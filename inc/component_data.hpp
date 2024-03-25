#ifndef COMPONENT_DATA_HPP
#define COMPONENT_DATA_HPP

#ifdef VERBOSE
#include <iomanip>
#include <iostream>
#endif
#include <cmath>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
class Router;

class Coordinate
{
private:
    double m_x;
    double m_y;
    int m_z;

public:
    // Constructor
    Coordinate() = default;
    Coordinate(double x, double y, int z)
        : m_x(x)
        , m_y(y)
        , m_z(z)
    {
    }
    // Operator Overloads
    bool operator==(const Coordinate &rhs) const
    {
        const double epsilon = 5e-1;
        auto compare_float = [epsilon](double a, double b) -> bool { return std::fabs(a - b) < epsilon; };
        return compare_float(m_x, rhs.m_x) && compare_float(m_y, rhs.m_y) && m_z == rhs.m_z;
    }
    bool operator!=(const Coordinate &rhs) const { return !(*this == rhs); }
    // Accessor
    // Access for x
    const double &x() const { return m_x; }
    double &x() { return m_x; }
    // Access for y
    const double &y() const { return m_y; }
    double &y() { return m_y; }
    // Access for z
    const int &z() const { return m_z; }
    int &z() { return m_z; }

    bool isCloseTo(const Coordinate &other, double tolerance = 5e-2) const
    {
        return m_z == other.z() && std::abs(m_x - other.x()) < tolerance && std::abs(m_y - other.y()) < tolerance;
    }
#ifdef VERBOSE
    std::string printCoordinate() const
    {
        return "(" + std::to_string(m_x) + " " + std::to_string(m_y) + " " + std::to_string(m_z) + ")";
    }
#endif
};

class Pin
{
private:
    std::string m_pin_name;
    std::string m_comp_name;
    std::string m_net_name;
    int m_net_id;
    Coordinate m_coordinate;

public:
    // Constructor
    Pin() = default;
    Pin(const std::string &pin_name,
        const std::string &comp_name,
        const std::string &net_name,
        const int &net_id,
        const Coordinate &coordinate)
        : m_pin_name(pin_name)
        , m_comp_name(comp_name)
        , m_net_name(net_name)
        , m_net_id(net_id)
        , m_coordinate(coordinate)
    {
    }
    Pin(const std::string &pin_name,
        const std::string &comp_name,
        const std::string &net_name,
        const int &net_id,
        const double &x,
        const double &y,
        const int &z)
        : m_pin_name(pin_name)
        , m_comp_name(comp_name)
        , m_net_name(net_name)
        , m_net_id(net_id)
        , m_coordinate(x, y, z)
    {
    }
    // Operator Overloads
    bool operator==(const Pin &rhs) const
    {
        return m_pin_name == rhs.m_pin_name && m_comp_name == rhs.m_comp_name && m_net_name == rhs.m_net_name &&
               m_net_id == rhs.m_net_id && m_coordinate == rhs.m_coordinate;
    }
    bool operator!=(const Pin &rhs) const { return !(*this == rhs); }
    // Accessor
    // Access for pin_name
    const std::string &pin_name() const { return m_pin_name; }
    std::string &pin_name() { return m_pin_name; }
    // Access for comp_name
    const std::string &comp_name() const { return m_comp_name; }
    std::string &comp_name() { return m_comp_name; }
    // Access for net_name
    const std::string &net_name() const { return m_net_name; }
    std::string &net_name() { return m_net_name; }
    // Access for net_id
    const int &net_id() const { return m_net_id; }
    int &net_id() { return m_net_id; }
    // Access for coordinate
    const Coordinate &coordinate() const { return m_coordinate; }
    Coordinate &coordinate() { return m_coordinate; }
    // Methods
};
class Component
{
private:
    std::string m_comp_name;
    std::vector<std::shared_ptr<Pin>> m_pins;
    int m_rows;
    int m_columns;
    std::vector<std::vector<std::shared_ptr<Pin>>> m_pin_arr;
    Coordinate m_bottom_left, m_top_right;
    double m_tile_width, m_tile_height;
    bool m_is_cpu;
    bool m_is_verticle_stack; // true for vericle stack, false for horizontal stack
    std::vector<bool> m_neighboors; // 0 for left/top, 1 for right/bottom
    std::vector<bool> m_ddr_neighboors; // 0 for left/top, 1 for right/bottom, for CPU know which side to connect
    std::vector<Component *> m_cpu_connected_components;
    std::shared_ptr<Router> m_router;
    std::pair<Coordinate, Coordinate> m_bounding_box; // wires bounding box
    // collect for area routing
    std::unordered_map<std::string, std::vector<Coordinate>> m_wire_on_boundary; // N:0, E:1, S:2, W:3
    // Private Methods
    std::pair<Coordinate, Coordinate> findBoundingBox();
    double calculateTileWidth(double y_tolerance = 5e-2);
    double calculateTileHeight(double x_tolerance = 5e-2);

public:
    // Constructor
    Component() = default;
    Component(const std::string &comp_name)
        : m_comp_name(comp_name)
        , m_is_cpu(false)
        , m_is_verticle_stack(false)
        , m_neighboors(2, false)
        , m_ddr_neighboors(2, false)
    {
        m_router = std::make_shared<Router>();
    }
    // Operator Overloads
    // == only check wether there m_pin_arr is the same
    bool operator==(const Component &rhs) const
    {
        if (m_pin_arr.size() != rhs.m_pin_arr.size() || m_pin_arr.at(0).size() != rhs.m_pin_arr.at(0).size())
        {
            return false;
        }
        for (size_t i = 0; i < m_pin_arr.size(); ++i)
        {
            for (size_t j = 0; j < m_pin_arr.at(0).size(); ++j)
            {
                if (m_pin_arr.at(i).at(j) != nullptr && rhs.m_pin_arr.at(i).at(j) != nullptr)
                {
                    if (m_pin_arr.at(i).at(j)->net_name() != rhs.m_pin_arr.at(i).at(j)->net_name())
                    {
                        return false;
                    }
                }
            }
        }
        return true;
    }
    bool operator!=(const Component &rhs) const { return !(*this == rhs); }
    // Accessor
    // Access for comp_name
    const std::string &comp_name() const { return m_comp_name; }
    std::string &comp_name() { return m_comp_name; }
    // Access for pins
    const std::vector<std::shared_ptr<Pin>> &pins() const { return m_pins; }
    std::vector<std::shared_ptr<Pin>> &pins() { return m_pins; }
    // Access for rows
    const int &rows() const { return m_rows; }
    int &rows() { return m_rows; }
    // Access for columns
    const int &columns() const { return m_columns; }
    int &columns() { return m_columns; }
    // Access for pin_arr
    const std::vector<std::vector<std::shared_ptr<Pin>>> &pin_arr() const { return m_pin_arr; }
    std::vector<std::vector<std::shared_ptr<Pin>>> &pin_arr() { return m_pin_arr; }
    // Access for bottom_left
    const Coordinate &bottom_left() const { return m_bottom_left; }
    Coordinate &bottom_left() { return m_bottom_left; }
    // Access for top_right
    const Coordinate &top_right() const { return m_top_right; }
    Coordinate &top_right() { return m_top_right; }
    // Access for tile_width
    const double &tile_width() const { return m_tile_width; }
    double &tile_width() { return m_tile_width; }
    // Access for tile_height
    const double &tile_height() const { return m_tile_height; }
    double &tile_height() { return m_tile_height; }
    // Access for is_cpu
    const bool &is_cpu() const { return m_is_cpu; }
    bool &is_cpu() { return m_is_cpu; }
    // Access for is_verticle_stack
    const bool &is_verticle_stack() const { return m_is_verticle_stack; }
    bool &is_verticle_stack() { return m_is_verticle_stack; }
    // Access for neighboor
    const std::vector<bool> &neighboors() const { return m_neighboors; }
    std::vector<bool> &neighboors() { return m_neighboors; }
    // Access for ddr_neighboor
    const std::vector<bool> &ddr_neighboors() const { return m_ddr_neighboors; }
    std::vector<bool> &ddr_neighboors() { return m_ddr_neighboors; }
    // Access for cpu_connected_components
    const std::vector<Component *> &cpu_connected_components() const { return m_cpu_connected_components; }
    std::vector<Component *> &cpu_connected_components() { return m_cpu_connected_components; }
    // Access for router
    const std::shared_ptr<Router> &router() const { return m_router; }
    std::shared_ptr<Router> &router() { return m_router; }
    // Access for bounding_box
    const std::pair<Coordinate, Coordinate> &bounding_box() const { return m_bounding_box; }
    std::pair<Coordinate, Coordinate> &bounding_box() { return m_bounding_box; }
    // Access for wire_on_boundary
    const std::unordered_map<std::string, std::vector<Coordinate>> &wire_on_boundary() const
    {
        return m_wire_on_boundary;
    }
    std::unordered_map<std::string, std::vector<Coordinate>> &wire_on_boundary() { return m_wire_on_boundary; }
    // Methods
    void addPin(std::shared_ptr<Pin> pin) { m_pins.push_back(pin); }
    void createPinArr();
    void initializeAreaRouting();
    void reducedBends();
};

class Nets
{
private:
    std::string m_net_name;
    int m_net_id;
    std::vector<std::shared_ptr<Pin>> m_pins;
    // For linear programming
    double m_escape_length;
    double m_height_diagonal, m_height_orthogonal;
    int m_ddr_layer;

public:
    // Constructor
    Nets() = default;
    Nets(const std::string &net_name, const int &net_id)
        : m_net_name(net_name)
        , m_net_id(net_id)
    {
    }
    // Accessor
    // Access for net_name
    const std::string &net_name() const { return m_net_name; }
    std::string &net_name() { return m_net_name; }
    // Access for net_id
    const int &net_id() const { return m_net_id; }
    int &net_id() { return m_net_id; }
    // Access for pins
    const std::vector<std::shared_ptr<Pin>> &pins() const { return m_pins; }
    std::vector<std::shared_ptr<Pin>> &pins() { return m_pins; }
    // Access for escape_length
    const double &escape_length() const { return m_escape_length; }
    double &escape_length() { return m_escape_length; }
    // Access for height_diagonal
    const double &height_diagonal() const { return m_height_diagonal; }
    double &height_diagonal() { return m_height_diagonal; }
    // Access for height_orthogonal
    const double &height_orthogonal() const { return m_height_orthogonal; }
    double &height_orthogonal() { return m_height_orthogonal; }
    // Access for ddr_layer
    const int &ddr_layer() const { return m_ddr_layer; }
    int &ddr_layer() { return m_ddr_layer; }
    // Methods
    void addPin(std::shared_ptr<Pin> pin) { m_pins.push_back(pin); }
};

class Netlist
{
private:
    std::vector<std::shared_ptr<Nets>> m_nets;

public:
    // Constructor
    Netlist() = default;
    // Accessor
    // Access for nets
    const std::vector<std::shared_ptr<Nets>> &nets() const { return m_nets; }
    std::vector<std::shared_ptr<Nets>> &nets() { return m_nets; }
    // Methods
#ifdef VERBOSE
    // Dump
    void dump()
    {
        for (auto &n : m_nets)
        {
            std::cout << "Net: " << n->net_name() << " ID: " << n->net_id() << std::endl;
            for (auto &p : n->pins())
            {
                std::cout << "Pin: " << p->pin_name() << " Comp: " << p->comp_name() << " Net: " << p->net_name()
                          << " ID: " << p->net_id() << " Coordinate: " << p->coordinate().printCoordinate()
                          << std::endl;
            }
        }
    }
#endif
};

class DataManager
{
private:
    std::unordered_map<std::string, std::shared_ptr<Component>> m_components;
    std::unordered_map<Component *, std::vector<std::string>> m_groups;
    std::unordered_map<int, Netlist> m_netlists;
    std::unordered_map<std::string, int> m_layers;
    std::shared_ptr<Router> m_area_router;
    std::string m_cpu_escape_boundry;

public:
    // Constructor
    DataManager()
    {
        m_area_router = std::make_shared<Router>();
        m_cpu_escape_boundry = "E";
    };
    // Accessor
    // Access for components
    const std::unordered_map<std::string, std::shared_ptr<Component>> &components() const { return m_components; }
    std::unordered_map<std::string, std::shared_ptr<Component>> &components() { return m_components; }
    // Access for groups
    const std::unordered_map<Component *, std::vector<std::string>> &groups() const { return m_groups; }
    std::unordered_map<Component *, std::vector<std::string>> &groups() { return m_groups; }
    // Access for netlists
    const std::unordered_map<int, Netlist> &netlists() const { return m_netlists; }
    std::unordered_map<int, Netlist> &netlists() { return m_netlists; }
    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }
    // Access for area_router
    const std::shared_ptr<Router> &area_router() const { return m_area_router; }
    std::shared_ptr<Router> &area_router() { return m_area_router; }
    // Access for cpu_escape_boundry
    const std::string &cpu_escape_boundry() const { return m_cpu_escape_boundry; }
    std::string &cpu_escape_boundry() { return m_cpu_escape_boundry; }
    // Methods
    void createNetlist(int count);
    void addCompPin(std::string comp_name, std::shared_ptr<Pin> pin);
    void preprocess(int threshold = 250); // 250 for case 4, 5, 6, and 25 for case 2
    void DDR2DDR();
    void CPU2DDR();
    void areaRouting(Coordinate diagonal_start_line);
};
class Via
{
private:
    Coordinate m_coordinate;
    int m_layer;

public:
    // Constructor
    Via() = default;
    // make sure the coordinate.z < layer, or swap them
    Via(const Coordinate &coordinate, const int &layer)
        : m_coordinate(coordinate)
        , m_layer(layer)
    {
        if (m_coordinate.z() >= m_layer)
        {
            std::swap(m_coordinate.z(), m_layer);
        }
    }
    // Accessor
    // Access for coordinate
    const Coordinate &coordinate() const { return m_coordinate; }
    Coordinate &coordinate() { return m_coordinate; }
    // Access for layer
    const int &layer() const { return m_layer; }
    int &layer() { return m_layer; }
    // Methods
};
class Segment
{
private:
    Coordinate m_start;
    Coordinate m_end;
    int m_net_id;

public:
    // Constructor
    Segment() = default;
    Segment(const Coordinate &start, const Coordinate &end)
        : m_start(start)
        , m_end(end)
    {
    }
    Segment(const Coordinate &start, const Coordinate &end, int net_id)
        : m_start(start)
        , m_end(end)
        , m_net_id(net_id)
    {
    }
    Segment(const double &x1, const double &y1, const int z1, const double &x2, const double &y2, const int z2)
        : m_start(x1, y1, z1)
        , m_end(x2, y2, z2)
    {
    }
    // overload operator
    bool operator==(const Segment &rhs) const { return m_start == rhs.m_start && m_end == rhs.m_end; }
    bool operator!=(const Segment &rhs) const { return !(*this == rhs); }
    // Accessor
    // Access for start
    const Coordinate &start() const { return m_start; }
    Coordinate &start() { return m_start; }
    // Access for end
    const Coordinate &end() const { return m_end; }
    Coordinate &end() { return m_end; }
    // Access for net_id
    const int &net_id() const { return m_net_id; }
    int &net_id() { return m_net_id; }
    // Methods
    double slope() const
    {
        double deltaX = m_end.x() - m_start.x();
        double deltaY = m_end.y() - m_start.y();
        // Handling the case of vertical line segments
        if (std::fabs(deltaX) < 5e-1)
        {
            return std::numeric_limits<double>::infinity();
        }
        else if (std::fabs(deltaY) < 5e-1)
        {
            return 0.0;
        }
        return deltaY / deltaX;
    }
};

class Router
{
private:
    std::vector<Segment> m_segments;
    std::vector<Via> m_vias;

public:
    // Constructor
    Router() = default;
    // Accessor
    // Access for segments
    const std::vector<Segment> &segments() const { return m_segments; }
    std::vector<Segment> &segments() { return m_segments; }
    // Access for vias
    const std::vector<Via> &vias() const { return m_vias; }
    std::vector<Via> &vias() { return m_vias; }
    // Methods
    void addSegment(Segment segment) { m_segments.push_back(segment); }
    void addVia(Via via) { m_vias.push_back(via); }
};
#endif // COMPONENT_DATA_HPP
