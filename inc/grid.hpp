#ifndef GRID_HPP
#define GRID_HPP
#include "component_data.hpp"
#include <vector>
namespace A_Star
{
struct Point
{
    int x, y;
    Point()
        : x(0)
        , y(0)
    {
    }
    Point(int x, int y)
        : x(x)
        , y(y)
    {
    }
    bool operator==(const Point &other) const { return x == other.x && y == other.y; }
    Point operator+(const Point &other) const { return Point(x + other.x, y + other.y); }
};

struct PointHash
{
    std::size_t operator()(const Point &pt) const { return std::hash<int>()(pt.x) + 31 * std::hash<int>()(pt.y); }
};

struct Node
{
    Point point;
    double cost;
    double priority;
    Point parent;
    Node(Point pt, double c, double p, Point prnt)
        : point(pt)
        , cost(c)
        , priority(p)
        , parent(prnt)
    {
    }
    bool operator>(const Node &other) const { return priority > other.priority; }
};

inline double heuristic(const Point &a, const Point &b)
{
    int dx = abs(a.x - b.x);
    int dy = abs(a.y - b.y);
    if (dx > dy)
    {
        std::swap(dx, dy);
    }
    return sqrt(2) * dx + dy - dx;
}

// inline double heuristic(const Point &a, const Point &b) { return abs(a.x - b.x) + abs(a.y - b.y); }

inline void parentLookupTable(Point &parent, const std::string &direction, const double &angle)
{
    if (direction == "E")
    {
        if (angle == 0.0)
        {
            parent = Point(-1, 0);
        }
        else if (angle == 45.0)
        {
            parent = Point(-1, -1);
        }
        else if (angle == 90.0)
        {
            parent = Point(0, -1);
        }
        else if (angle == 135.0)
        {
            parent = Point(1, -1);
        }
        else if (angle == 180.0)
        {
            parent = Point(1, 0);
        }
        else if (angle == 225.0)
        {
            parent = Point(1, 1);
        }
        else if (angle == 270.0)
        {
            parent = Point(0, 1);
        }
        else if (angle == 315.0)
        {
            parent = Point(-1, 1);
        }
        else
        {
            throw std::runtime_error("Parent lookup table Invalid angle: " + std::to_string(angle));
        }
    }
    else if (direction == "W")
    {
        if (angle == 0.0)
        {
            parent = Point(1, 0);
        }
        else if (angle == 45.0)
        {
            parent = Point(1, 1);
        }
        else if (angle == 90.0)
        {
            parent = Point(0, 1);
        }
        else if (angle == 135.0)
        {
            parent = Point(-1, 1);
        }
        else if (angle == 180.0)
        {
            parent = Point(-1, 0);
        }
        else if (angle == 225.0)
        {
            parent = Point(-1, -1);
        }
        else if (angle == 270.0)
        {
            parent = Point(0, -1);
        }
        else if (angle == 315.0)
        {
            parent = Point(1, -1);
        }
        else
        {
            throw std::runtime_error("Parent lookup table Invalid angle: " + std::to_string(angle));
        }
    }
    else
    {
        throw std::runtime_error("Parent lookup table Invalid direction: " + direction);
    }

    return;
}

class Grid
{
public:
    int rows, cols;
    std::vector<std::vector<int>> grid;
    Coordinate bottome_left, top_right;
    double grid_witdh; // grid_width = grid_height

    // Create an empty grid with the given size bottome_left, top_right, and the size of the grid
    Grid(Coordinate _bottome_left, Coordinate _top_right, double _grid_witdh)
        : bottome_left(_bottome_left)
        , top_right(_top_right)
        , grid_witdh(_grid_witdh)
    {
        rows = (top_right.x() - bottome_left.x()) / grid_witdh;
        cols = (top_right.y() - bottome_left.y()) / grid_witdh;
        grid = std::vector<std::vector<int>>(rows, std::vector<int>(cols, 0));
    }
    std::vector<Point> get_valid_directions(const Point &prev, const Point &current);
    std::vector<Point> a_star_search(const Coordinate &start, const Coordinate &goal, const Point &parent);
    std::vector<Point> a_star_search(Point start, Point goal);
    std::vector<Point> a_star_search(Point start, Point goal, const Point &parent);
    std::vector<Segment> points2segments(const std::vector<Point> &points, const int &net_id, const int &layer);
    std::vector<Point> segments2points(const std::vector<Segment> &segments);
    void addObstacle(const Point &obstacle);
    void addObstacle(const std::vector<Point> &obstacle);
    void addObstacle(const Segment &obstacle);
    void addObstacle(std::vector<Segment> &obstacles);
    void addObstacle(const Coordinate &start, const Coordinate &end);
};
} // namespace A_Star

#endif