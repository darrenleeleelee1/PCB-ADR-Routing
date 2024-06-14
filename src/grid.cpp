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
std::vector<Point> Grid::a_star_search(const Coordinate &start, const Coordinate &goal, const Point &parent)
{
    Point start_point((start.x() - bottome_left.x()) / grid_witdh, (start.y() - bottome_left.y()) / grid_witdh);
    Point goal_point((goal.x() - bottome_left.x()) / grid_witdh, (goal.y() - bottome_left.y()) / grid_witdh);
    return a_star_search(start_point, goal_point, Point(start_point + parent));
}
// start point have 8 directions to go, and the cost is 0, and the priority is heuristic(start, goal)
std::vector<Point> Grid::a_star_search(Point start, Point goal)
{
    int rows = grid.size();
    int cols = grid[0].size();
    std::priority_queue<Node, std::vector<Node>, std::greater<Node>> open_list;
    Point parent(-1, -1);
    open_list.emplace(start, 0, heuristic(start, goal), parent);
    std::unordered_map<Point, Point, PointHash> came_from;
    std::unordered_map<Point, double, PointHash> cost_so_far;
    cost_so_far[start] = 0;

    while (!open_list.empty())
    {
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
            while (temp.x != parent.x || temp.y != parent.y)
            {
                path.push_back(temp);
                temp = came_from[temp];
            }
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
                double new_cost = current.cost + ((d.x != 0 && d.y != 0) ? sqrt(2) : 1);

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

    while (!open_list.empty())
    {
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

                double new_cost = current.cost + ((d.x != 0 && d.y != 0) ? sqrt(2) : 1);
                // I want to keep the original direction, the cost will be lower
                if (!sameDirection(current.parent, current.point, d))
                {
                    new_cost += 10;
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
        Coordinate start(points[i].x * grid_witdh + bottome_left.x() + grid_witdh / 2,
                         points[i].y * grid_witdh + bottome_left.y() + grid_witdh / 2,
                         layer);
        Coordinate end(points[i + 1].x * grid_witdh + bottome_left.x() + grid_witdh / 2,
                       points[i + 1].y * grid_witdh + bottome_left.y() + grid_witdh / 2,
                       layer);
        segments.emplace_back(start, end, net_id);
    }
    return segments;
}
// Convert segments to points, need to follow the grid_witdh
std::vector<Point> Grid::segments2points(const std::vector<Segment> &segments)
{
    std::vector<Point> points;
    for (const auto &s : segments)
    {
        // traverse the segment from start to end follow by their slope, and add the points to the vector
        // the traverse unit is grid_witdh
        // Segment Coordinate transfer to points should calculate by the bottom left and grid_witdh
        double slope = s.slope();
        if (slope == std::numeric_limits<double>::infinity())
        {
            int start_y = (s.start().y() - bottome_left.y()) / grid_witdh;
            int end_y = (s.end().y() - bottome_left.y()) / grid_witdh;
            if (start_y > end_y)
            {
                std::swap(start_y, end_y);
            }
            for (int y = start_y; y <= end_y; y++)
            {
                points.emplace_back((s.start().x() - bottome_left.x()) / grid_witdh, y);
            }
        }
        else if (slope == 0.0)
        {
            int start_x = (s.start().x() - bottome_left.x()) / grid_witdh;
            int end_x = (s.end().x() - bottome_left.x()) / grid_witdh;
            if (start_x > end_x)
            {
                std::swap(start_x, end_x);
            }
            for (int x = start_x; x <= end_x; x++)
            {
                points.emplace_back(x, (s.start().y() - bottome_left.y()) / grid_witdh);
            }
        }
        else
        {
            int start_x = (s.start().x() - bottome_left.x()) / grid_witdh;
            int end_x = (s.end().x() - bottome_left.x()) / grid_witdh;
            int start_y = (s.start().y() - bottome_left.y()) / grid_witdh;
            int end_y = (s.end().y() - bottome_left.y()) / grid_witdh;
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

void Grid::addObstacle(const Via &obstacle) { addObstacle(obstacle.coordinate()); }

void Grid::addObstacle(const Obstacle &obstacle)
{
    // mark the whole area of the obstacle as 1
    // obstacle's cooridnate is the bottom left and top right, and the grid_witdh is the unit
    for (int x = (obstacle.bottom_left().x() - bottome_left.x()) / grid_witdh;
         x <= (obstacle.top_right().x() - bottome_left.x()) / grid_witdh;
         x++)
    {
        for (int y = (obstacle.bottom_left().y() - bottome_left.y()) / grid_witdh;
             y <= (obstacle.top_right().y() - bottome_left.y()) / grid_witdh;
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
    grid[(obstacle.x() - bottome_left.x()) / grid_witdh][(obstacle.y() - bottome_left.y()) / grid_witdh] = 1;
}

void Grid::addObstacle(const Point &obstacle) { grid[obstacle.x][obstacle.y] = 1; }

void Grid::addObstacle(const std::vector<Point> &obstacle)
{
    for (const auto &o : obstacle)
    {
        grid[o.x][o.y] = 1;
    }
}