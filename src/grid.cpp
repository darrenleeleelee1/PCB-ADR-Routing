#include "grid.hpp"
#include <algorithm>
#include <queue>
#include <unordered_map>
using namespace A_Star;
Point getDirection(const Point &prev, const Point &current)
{
    if (prev == Point(-1, -1))
    {
        return Point(0, 0);
    }
    return Point(current.x - prev.x, current.y - prev.y);
}
bool sameDirection(const Point &prev, const Point &current, const Point &new_direction)
{
    if (prev == Point(-1, -1))
    {
        return true;
    }
    Point direction(current.x - prev.x, current.y - prev.y);
    return direction == new_direction;
}
std::vector<Point> Grid::get_valid_directions(const Point &prev, const Point &current)
{
    if (prev == Point(-1, -1))
    {
        return {{-1, 0}, {1, 0}, {0, -1}, {0, 1}, {-1, -1}, {-1, 1}, {1, -1}, {1, 1}};
    }
    Point direction(current.x - prev.x, current.y - prev.y);
    if (direction == Point(-1, 0))
    {
        return {{-1, 0}, {-1, 1}, {-1, -1}};
    }
    else if (direction == Point(1, 0))
    {
        return {{1, 0}, {1, 1}, {1, -1}};
    }
    else if (direction == Point(0, -1))
    {
        return {{0, -1}, {1, -1}, {-1, -1}};
    }
    else if (direction == Point(0, 1))
    {
        return {{0, 1}, {1, 1}, {-1, 1}};
    }
    else if (direction == Point(-1, -1))
    {
        return {{-1, -1}, {-1, 0}, {0, -1}};
    }
    else if (direction == Point(-1, 1))
    {
        return {{-1, 1}, {-1, 0}, {0, 1}};
    }
    else if (direction == Point(1, -1))
    {
        return {{1, -1}, {1, 0}, {0, -1}};
    }
    else if (direction == Point(1, 1))
    {
        return {{1, 1}, {1, 0}, {0, 1}};
    }
    return {};
}

// A* start and goal are in Coordinate type, and Call the a_star_search function with Point type
std::vector<Point> Grid::a_star_search(const Coordinate &start, const Coordinate &goal, const Point &parent_direction)
{
    Point start_point((start.x() - bottom_left.x()) / grid_width, (start.y() - bottom_left.y()) / grid_width);
    Point goal_point((goal.x() - bottom_left.x()) / grid_width, (goal.y() - bottom_left.y()) / grid_width);
    return a_star_search(start_point, goal_point, Point(start_point + parent_direction));
}

// start point with parent, and goal point, and return the path
std::vector<Point> Grid::a_star_search(Point start, Point goal, const Point &parent)
{
    int rows = grid.size();
    int cols = grid[0].size();
    std::priority_queue<Node, std::vector<Node>, std::greater<Node>> open_list;
    open_list.emplace(start, 0, heuristic(start, goal), parent);
    std::unordered_map<Point, Point, PointHash> came_from;
    std::unordered_map<Point, double, PointHash> cost_so_far;
    cost_so_far[start] = 0;
    // mark start and goal point grid as 0
    grid[start.x][start.y] = 0;
    grid[goal.x][goal.y] = 0;
    // count 如果超過 grid 的一半 就不要走了
    int count = 0;
    while (!open_list.empty())
    {
        // 正常A_Star不需要這個部分，單純加速過濾掉繞不出來的訊號
        count++;
        if (count > rows * cols / 2)
        {
            return {};
        }

        Node current = open_list.top();
        open_list.pop();
        if (came_from.find(current.point) != came_from.end() && current.cost > cost_so_far[current.point])
        {
            continue;
        }
        came_from[current.point] = current.parent;

        if (current.point == goal)
        {
            std::vector<Point> path;
            Point temp = current.point;
            // 計算轉彎的數量
            int bend = 0;
            Point pre_direction = Point(-1, -1);
            while (temp.x != parent.x || temp.y != parent.y)
            {
                path.push_back(temp);
                temp = came_from[temp];
                // 計算轉彎的數量
                Point temp_direction = getDirection(temp, came_from[temp]);
                if (!(temp_direction == pre_direction))
                {
                    bend++;
                };
                pre_direction = temp_direction;
            }
#ifdef VERBOSE
            std::cout << "Bend: " << bend << std::endl;
#endif
            std::reverse(path.begin(), path.end());
            return path;
        }

        for (const auto &d : get_valid_directions(current.parent, current.point))
        {
            Point neighbor(current.point.x + d.x, current.point.y + d.y);

            if (neighbor.x >= 0 && neighbor.x < rows && neighbor.y >= 0 && neighbor.y < cols &&
                grid[neighbor.x][neighbor.y] == 0)
            {
                if (d.x != 0 && d.y != 0)
                {
                    if (grid[current.point.x][neighbor.y] == 1 && grid[neighbor.x][current.point.y] == 1)
                    {
                        continue;
                    }
                }

                double new_cost =
                    current.cost + ((d.x != 0 && d.y != 0) ? sqrt(2) : 1) + cost_grid[neighbor.x][neighbor.y];

                // I want to keep the original direction, the cost will be lower
                if (!sameDirection(current.parent, current.point, d))
                {
                    new_cost += bend_cost;
                }

                if (cost_so_far.find(neighbor) == cost_so_far.end() || new_cost < cost_so_far[neighbor])
                {
                    cost_so_far[neighbor] = new_cost;
                    double priority = new_cost + heuristic(neighbor, goal);

                    open_list.emplace(neighbor, new_cost, priority, current.point);
                }
            }
        }
    }

    return {};
}

std::vector<Segment> Grid::points2segments(const std::vector<Point> &points, const int &net_id, const int &layer)
{
    if (points.size() < 2)
    {
        return {};
    }
    std::vector<Segment> segments;

    // grid to grid connections are set in the middle
    for (size_t i = 0; i < points.size() - 1; i++)
    {
        Coordinate start(points[i].x * grid_width + bottom_left.x() + grid_width / 2,
                         points[i].y * grid_width + bottom_left.y() + grid_width / 2,
                         layer);
        Coordinate end(points[i + 1].x * grid_width + bottom_left.x() + grid_width / 2,
                       points[i + 1].y * grid_width + bottom_left.y() + grid_width / 2,
                       layer);
        segments.emplace_back(start, end, net_id);
    }
    return segments;
}
// Convert segments to points, need to follow the grid_width
std::vector<Point> Grid::segments2points(const std::vector<Segment> &segments)
{
    std::vector<Point> points;
    for (const auto &s : segments)
    {
        // traverse the segment from start to end follow by their slope, and add the points to the vector
        // the traverse unit is grid_width
        // Segment Coordinate transfer to points should calculate by the bottom left and grid_width
        double slope = s.slope();
        if (slope == std::numeric_limits<double>::infinity())
        {
            int start_y = (s.start().y() - bottom_left.y()) / grid_width;
            int end_y = (s.end().y() - bottom_left.y()) / grid_width;
            if (start_y > end_y)
            {
                std::swap(start_y, end_y);
            }
            for (int y = start_y; y <= end_y; y++)
            {
                points.emplace_back((s.start().x() - bottom_left.x()) / grid_width, y);
            }
        }
        else if (slope == 0.0)
        {
            int start_x = (s.start().x() - bottom_left.x()) / grid_width;
            int end_x = (s.end().x() - bottom_left.x()) / grid_width;
            if (start_x > end_x)
            {
                std::swap(start_x, end_x);
            }
            for (int x = start_x; x <= end_x; x++)
            {
                points.emplace_back(x, (s.start().y() - bottom_left.y()) / grid_width);
            }
        }
        else
        {
            int start_x = (s.start().x() - bottom_left.x()) / grid_width;
            int end_x = (s.end().x() - bottom_left.x()) / grid_width;
            int start_y = (s.start().y() - bottom_left.y()) / grid_width;
            int end_y = (s.end().y() - bottom_left.y()) / grid_width;
            if (start_x > end_x)
            {
                std::swap(start_x, end_x);
                std::swap(start_y, end_y);
            }
            for (int x = start_x; x <= end_x; x++)
            {
                int y = slope * (x - start_x) + start_y;
                points.emplace_back(x, y);
            }
        }
    }

    return points;
}

void Grid::addCost(const Point &point) { cost_grid[point.x][point.y] += path_cost; }

void Grid::addPathCost(const std::vector<Point> &path)
{
    for (const auto &p : path)
    {
        addCost(p);
    }
}

void Grid::addObstacle(const Via &obstacle) { addObstacle(obstacle.coordinate()); }

void Grid::addObstacle(const Obstacle &obstacle)
{
    // mark the whole area of the obstacle as 1
    // obstacle's cooridnate is the bottom left and top right, and the grid_width is the unit
    for (int x = (obstacle.bottom_left().x() - bottom_left.x()) / grid_width;
         x <= (obstacle.top_right().x() - bottom_left.x()) / grid_width;
         x++)
    {
        for (int y = (obstacle.bottom_left().y() - bottom_left.y()) / grid_width;
             y <= (obstacle.top_right().y() - bottom_left.y()) / grid_width;
             y++)
        {
            grid[x][y] = 1;
        }
    }
}

void Grid::addObstacle(const Segment &obstacle)
{
    std::vector<Point> points = segments2points({obstacle});
    for (const auto &p : points)
    {
        grid[p.x][p.y] = 1;
    }
}

void Grid::addObstacle(std::vector<Segment> &obstacles)
{
    for (const auto &o : obstacles)
    {
        addObstacle(o);
    }
}

void Grid::addObstacle(const Coordinate &obstacle)
{
    grid[(obstacle.x() - bottom_left.x()) / grid_width][(obstacle.y() - bottom_left.y()) / grid_width] = 1;
}

void Grid::addObstacle(const Point &obstacle) { grid[obstacle.x][obstacle.y] = 1; }

void Grid::addObstacle(const std::vector<Point> &obstacle)
{
    for (const auto &o : obstacle)
    {
        grid[o.x][o.y] = 1;
    }
}