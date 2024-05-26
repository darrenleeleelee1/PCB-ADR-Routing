#ifndef COMPONENT_DATA_HPP
#define COMPONENT_DATA_HPP

#ifdef VERBOSE
#include <iomanip>
#include <iostream>
#endif
#include <cmath>
#include <list>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
class Router;

// Float point comparison
inline bool deq(double a, double b, double epsilon = 1e-4)
{
    if (a == std::numeric_limits<double>::infinity() && b == std::numeric_limits<double>::infinity())
    {
        return true;
    }
    return std::abs(a - b) < epsilon;
}

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
    std::string m_group;
    int m_rows;
    int m_columns;
    std::vector<std::vector<std::shared_ptr<Pin>>> m_pin_arr;
    Coordinate m_bottom_left, m_top_left, m_top_right, m_bottom_right; // pin array bounding box
    double m_tile_width, m_tile_height;
    bool m_is_cpu;
    bool m_is_vertical_stack; // true for vericle stack, false for horizontal stack
    double m_rotation_angle; // 0, 45, 90, 135, 180, 225, 270, 315
    std::vector<bool> m_neighboors; // 0 for left/top, 1 for right/bottom
    // wires bound for calculate escape point
    std::vector<double> m_wire_bound; // 0 for left x/ top y, 1 for right x/ bottom y
    // escape point
    std::vector<std::vector<std::pair<Coordinate, int>>>
        m_escape_points; // 0 for left/top, 1 for right/bottom pair<coordinate, net_id>
    std::vector<std::vector<std::pair<Coordinate, int>>>
        m_cpu_escape_points; // pair<coordinate, net_id>, only m_is_cpu == true will be used
    std::shared_ptr<Router> m_router;
    std::pair<Coordinate, Coordinate> m_bounding_box; // wires bounding box
    std::string m_cpu_escape_boundry; // only m_is_cpu == true will be used
    // Private Methods
    std::vector<Coordinate> findBoundingBox();
    double calculateTileWidth(double y_tolerance = 5e-2);
    double calculateTileHeight(double x_tolerance = 5e-2);

public:
    // Constructor
    Component() = default;
    Component(const std::string &comp_name)
        : m_comp_name(comp_name)
        , m_is_cpu(false)
        , m_is_vertical_stack(false)
        , m_neighboors(2, false)
        , m_wire_bound(2, 0)
        , m_escape_points(2)
        , m_cpu_escape_points(4)
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
    // Access for group
    const std::string &group() const { return m_group; }
    std::string &group() { return m_group; }
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
    // Access for top_left
    const Coordinate &top_left() const { return m_top_left; }
    Coordinate &top_left() { return m_top_left; }
    // Access for top_right
    const Coordinate &top_right() const { return m_top_right; }
    Coordinate &top_right() { return m_top_right; }
    // Access for bottom_right
    const Coordinate &bottom_right() const { return m_bottom_right; }
    Coordinate &bottom_right() { return m_bottom_right; }
    // Access for tile_width
    const double &tile_width() const { return m_tile_width; }
    double &tile_width() { return m_tile_width; }
    // Access for tile_height
    const double &tile_height() const { return m_tile_height; }
    double &tile_height() { return m_tile_height; }
    // Access for is_cpu
    const bool &is_cpu() const { return m_is_cpu; }
    bool &is_cpu() { return m_is_cpu; }
    // Access for is_vertical_stack
    const bool &is_vertical_stack() const { return m_is_vertical_stack; }
    bool &is_vertical_stack() { return m_is_vertical_stack; }
    // Access for rotation_angle
    const double &rotation_angle() const { return m_rotation_angle; }
    double &rotation_angle() { return m_rotation_angle; }
    // Access for neighboor
    const std::vector<bool> &neighboors() const { return m_neighboors; }
    std::vector<bool> &neighboors() { return m_neighboors; }
    // Access for wire_bound
    const std::vector<double> &wire_bound() const { return m_wire_bound; }
    std::vector<double> &wire_bound() { return m_wire_bound; }
    // Access for escape_points
    const std::vector<std::vector<std::pair<Coordinate, int>>> &escape_points() const { return m_escape_points; }
    std::vector<std::vector<std::pair<Coordinate, int>>> &escape_points() { return m_escape_points; }
    // Access for cpu_escape_points
    const std::vector<std::vector<std::pair<Coordinate, int>>> &cpu_escape_points() const
    {
        return m_cpu_escape_points;
    }
    std::vector<std::vector<std::pair<Coordinate, int>>> &cpu_escape_points() { return m_cpu_escape_points; }
    // Access for router
    const std::shared_ptr<Router> &router() const { return m_router; }
    std::shared_ptr<Router> &router() { return m_router; }
    // Access for bounding_box
    const std::pair<Coordinate, Coordinate> &bounding_box() const { return m_bounding_box; }
    std::pair<Coordinate, Coordinate> &bounding_box() { return m_bounding_box; }
    // Access for cpu_escape_boundry
    const std::string &cpu_escape_boundry() const { return m_cpu_escape_boundry; }
    std::string &cpu_escape_boundry() { return m_cpu_escape_boundry; }
    // Methods
    void addPin(std::shared_ptr<Pin> pin) { m_pins.push_back(pin); }
    void rotateComponentPins(bool clockwise = true);
    void rotateEscapePoints(bool clockwise = true);
    void rotateBoundingBox(bool clockwise = true);
    void rotateWires(bool clockwise = true);
    void rotateAll(bool clockwise = true);
    void createPinArr();
    void calculateEscapePoints();
};

class Nets
{
private:
    std::string m_net_name;
    int m_net_id;
    std::vector<std::shared_ptr<Pin>> m_pins;
    std::unordered_map<std::string, double> m_group_escape_length; // group name, escape length
    std::unordered_map<std::string, int> m_group_layer; // group name, layer
    double m_final_wirelength;

public:
    // Constructor
    Nets() = default;
    Nets(const std::string &net_name, const int &net_id)
        : m_net_name(net_name)
        , m_net_id(net_id)
        , m_final_wirelength(0)
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
    // Access for group_escape_length
    const std::unordered_map<std::string, double> &group_escape_length() const { return m_group_escape_length; }
    std::unordered_map<std::string, double> &group_escape_length() { return m_group_escape_length; }
    // Access for group_layer
    const std::unordered_map<std::string, int> &group_layer() const { return m_group_layer; }
    std::unordered_map<std::string, int> &group_layer() { return m_group_layer; }
    // Access for final_wirelength
    const double &final_wirelength() const { return m_final_wirelength; }
    double &final_wirelength() { return m_final_wirelength; }
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

class Obstacle
{
private:
    Coordinate m_bottom_left;
    Coordinate m_top_right;
    int m_layer;

public:
    // Constructor
    Obstacle() = default;
    Obstacle(const Coordinate &bottom_left, const Coordinate &top_right, const int &layer)
        : m_bottom_left(bottom_left)
        , m_top_right(top_right)
        , m_layer(layer)
    {
    }
    // Accessor
    // Access for bottom_left
    const Coordinate &bottom_left() const { return m_bottom_left; }
    Coordinate &bottom_left() { return m_bottom_left; }
    // Access for top_right
    const Coordinate &top_right() const { return m_top_right; }
    Coordinate &top_right() { return m_top_right; }
    // Access for layer
    const int &layer() const { return m_layer; }
    int &layer() { return m_layer; }
    // Methods
};

class DataManager
{
private:
    std::unordered_map<std::string, std::shared_ptr<Component>> m_components;
    std::unordered_map<std::string, std::vector<std::shared_ptr<Component>>> m_groups;
    std::unordered_map<std::string, std::unordered_set<int>>
        m_groups_nets; // check net_id in the group, group name, net_id
    Netlist m_netlists;
    std::unordered_map<std::string, int> m_layers;
    std::vector<Obstacle> m_obstacles;
    std::shared_ptr<Router> m_area_router;
    std::string m_cpu_escape_boundry;
    std::vector<Coordinate> m_pcb_bounding_box; // bottom_left, top_right
    double m_wire_spacing;
    double m_wire_width;
    double m_minimum_segment;
    std::vector<std::pair<std::pair<std::string, char>, std::pair<std::string, char>>>
        m_ddr2ddr_edges; // pair< pair<ddr name, escape direction>, <ddr name, escape direction> >
    std::vector<std::tuple<std::pair<std::string, char>, std::pair<std::string, char>, bool, std::optional<int>>>
        m_cpu2ddr_edges; // tuple< pair<cpu name, escape direction>, <ddr name, escape direction>, fly-by,
                         // T_topology_layer >
    // escape wirelength by layer, [group name][net_id][(layer), (order)]
    std::unordered_map<std::string, std::unordered_map<int, std::pair<int, int>>>
        m_group_escape_layer_order; // group name, escape length
    // helper function
    void processDiagonalAndExtendSegment(char to_pair_second,
                                         char from_pair_second,
                                         std::shared_ptr<Component> comp2,
                                         std::vector<std::pair<Coordinate, int>> &cpu_escape_point,
                                         bool continued);

public:
    // Constructor
    DataManager()
    {
        m_area_router = std::make_shared<Router>();
        m_pcb_bounding_box.resize(2);
        m_pcb_bounding_box.at(0) = Coordinate(1000000.0, 1000000.0, 0);
        m_pcb_bounding_box.at(1) = Coordinate(0.0, 0.0, 0);
        m_wire_spacing = 4.8;
        m_wire_width = 4.0;
        m_minimum_segment = 5.0;
    };
    // Accessor
    // Access for components
    const std::unordered_map<std::string, std::shared_ptr<Component>> &components() const { return m_components; }
    std::unordered_map<std::string, std::shared_ptr<Component>> &components() { return m_components; }
    // Access for groups
    const std::unordered_map<std::string, std::vector<std::shared_ptr<Component>>> &groups() const { return m_groups; }
    std::unordered_map<std::string, std::vector<std::shared_ptr<Component>>> &groups() { return m_groups; }
    // Access for groups_nets
    const std::unordered_map<std::string, std::unordered_set<int>> &groups_nets() const { return m_groups_nets; }
    std::unordered_map<std::string, std::unordered_set<int>> &groups_nets() { return m_groups_nets; }
    // Access for netlists
    const Netlist &netlists() const { return m_netlists; }
    Netlist &netlists() { return m_netlists; }
    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }
    // Access for obstacles
    const std::vector<Obstacle> &obstacles() const { return m_obstacles; }
    std::vector<Obstacle> &obstacles() { return m_obstacles; }
    // Access for area_router
    const std::shared_ptr<Router> &area_router() const { return m_area_router; }
    std::shared_ptr<Router> &area_router() { return m_area_router; }
    // Access for cpu_escape_boundry
    const std::string &cpu_escape_boundry() const { return m_cpu_escape_boundry; }
    std::string &cpu_escape_boundry() { return m_cpu_escape_boundry; }
    // Access for PCB_bounding_box
    const std::vector<Coordinate> &pcb_bounding_box() const { return m_pcb_bounding_box; }
    std::vector<Coordinate> &pcb_bounding_box() { return m_pcb_bounding_box; }
    // Access for wire_spacing
    const double &wire_spacing() const { return m_wire_spacing; }
    double &wire_spacing() { return m_wire_spacing; }
    // Access for wire_width
    const double &wire_width() const { return m_wire_width; }
    double &wire_width() { return m_wire_width; }
    // Access for minimum_segment
    const double &minimum_segment() const { return m_minimum_segment; }
    double &minimum_segment() { return m_minimum_segment; }
    // Access for ddr2ddr_edges
    const std::vector<std::pair<std::pair<std::string, char>, std::pair<std::string, char>>> &ddr2ddr_edges() const
    {
        return m_ddr2ddr_edges;
    }
    std::vector<std::pair<std::pair<std::string, char>, std::pair<std::string, char>>> &ddr2ddr_edges()
    {
        return m_ddr2ddr_edges;
    }
    // Access for cpu2ddr_edges
    const std::vector<std::tuple<std::pair<std::string, char>, std::pair<std::string, char>, bool, std::optional<int>>>
        &cpu2ddr_edges() const
    {
        return m_cpu2ddr_edges;
    }
    std::vector<std::tuple<std::pair<std::string, char>, std::pair<std::string, char>, bool, std::optional<int>>> &
    cpu2ddr_edges()
    {
        return m_cpu2ddr_edges;
    }
    // Access for group_escape_layer_order
    const std::unordered_map<std::string, std::unordered_map<int, std::pair<int, int>>> &
    group_escape_layer_order() const
    {
        return m_group_escape_layer_order;
    }
    std::unordered_map<std::string, std::unordered_map<int, std::pair<int, int>>> &group_escape_layer_order()
    {
        return m_group_escape_layer_order;
    }
    // Methods
    void addCompPin(std::string comp_name, std::shared_ptr<Pin> pin);
    void addObstacle(const Obstacle &obstacle) { m_obstacles.push_back(obstacle); }
    void sumEscapeLength();
    void storeGroupLayer();
    void preprocess_ER();
    void DDR2DDR();
    void CPU2DDR();
    void postprocess_ER();
    void AreaRouting();
    void analyzeWirelength();
};

class Via
{
private:
    Coordinate m_coordinate;
    int m_layer;
    int m_net_id;

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
        m_net_id = -1;
    }
    Via(const Coordinate &coordinate, const int &layer, const int &net_id)
        : m_coordinate(coordinate)
        , m_layer(layer)
        , m_net_id(net_id)
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
    // Access for net_id
    const int &net_id() const { return m_net_id; }
    int &net_id() { return m_net_id; }
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
        m_net_id = -1;
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
        m_net_id = -1;
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
    double length() const
    {
        double delta_x = m_end.x() - m_start.x();
        double delta_y = m_end.y() - m_start.y();
        return std::sqrt(delta_x * delta_x + delta_y * delta_y);
    }
    double slope() const
    {
        double delta_x = m_end.x() - m_start.x();
        double delta_y = m_end.y() - m_start.y();
        // Handling the case of vertical line segments
        if (std::fabs(delta_x) < 5e-1)
        {
            return std::numeric_limits<double>::infinity();
        }
        else if (std::fabs(delta_y) < 5e-1)
        {
            return 0.0;
        }
        return delta_y / delta_x;
    }
    bool isInclude(double target_x = std::numeric_limits<double>::quiet_NaN(),
                   double target_y = std::numeric_limits<double>::quiet_NaN())
    {
        if (!std::isnan(target_x) && !std::isnan(target_y))
        {
            throw std::invalid_argument("Segment::isInclude Both target_x and target_y are provided.");
        }
        if (!std::isnan(target_x))
        {
            return std::min(m_start.x(), m_end.x()) <= target_x && target_x <= std::max(m_start.x(), m_end.x());
        }
        else if (!std::isnan(target_y))
        {
            return std::min(m_start.y(), m_end.y()) <= target_y && target_y <= std::max(m_start.y(), m_end.y());
        }
        return false;
    }
    // find corresponding y-coordinate for given x or vice-versa
    double findCoordinate(double target_x = std::numeric_limits<double>::quiet_NaN(),
                          double target_y = std::numeric_limits<double>::quiet_NaN()) const
    {
        if (!std::isnan(target_x))
        {
            if (m_end.x() == m_start.x()) // Check for vertical line
                throw std::invalid_argument("Vertical line segment, y cannot be determined by x.");
            return m_start.y() + (m_end.y() - m_start.y()) * (target_x - m_start.x()) / (m_end.x() - m_start.x());
        }
        else if (!std::isnan(target_y))
        {
            if (m_end.y() == m_start.y()) // Check for horizontal line
                throw std::invalid_argument("Horizontal line segment, x cannot be determined by y.");
            return m_start.x() + (m_end.x() - m_start.x()) * (target_y - m_start.y()) / (m_end.y() - m_start.y());
        }
        throw std::invalid_argument("Either target_x or target_y must be provided, not both or neither.");
    }
    bool isOverlap(Coordinate coor) const
    {
        if (m_start.z() != coor.z() && m_start.z() != coor.z())
            return false;

        if (slope() == std::numeric_limits<double>::infinity())
        {
            if (m_start.x() != coor.x()) // not on the vertical line
                return false;

            return (m_start.y() <= coor.y() && coor.y() <= m_end.y()) ||
                   (m_end.y() <= coor.y() && coor.y() <= m_start.y());
        }
        else
        {
            double epsilon = 5e-1;
            double x_min = std::min(m_start.x(), m_end.x());
            double x_max = std::max(m_start.x(), m_end.x());
            double y_min = std::min(m_start.y(), m_end.y());
            double y_max = std::max(m_start.y(), m_end.y());

            if (coor.x() < x_min - epsilon || coor.x() > x_max + epsilon || coor.y() < y_min - epsilon ||
                coor.y() > y_max + epsilon)
                return false; // not on the line

            return fabs(slope() * (coor.x() - m_start.x()) - (coor.y() - m_start.y())) < epsilon;
        }
    }
    bool isOverlap(Via via) const
    {
        if (m_start.z() != via.coordinate().z() && m_start.z() != via.layer())
            return false;

        if (slope() == std::numeric_limits<double>::infinity())
        {
            if (m_start.x() != via.coordinate().x()) // not on the vertical line
                return false;

            return (m_start.y() <= via.coordinate().y() && via.coordinate().y() <= m_end.y()) ||
                   (m_end.y() <= via.coordinate().y() && via.coordinate().y() <= m_start.y());
        }
        else
        {
            double epsilon = 5e-1;
            double x_min = std::min(m_start.x(), m_end.x());
            double x_max = std::max(m_start.x(), m_end.x());
            double y_min = std::min(m_start.y(), m_end.y());
            double y_max = std::max(m_start.y(), m_end.y());

            if (via.coordinate().x() < x_min - epsilon || via.coordinate().x() > x_max + epsilon ||
                via.coordinate().y() < y_min - epsilon || via.coordinate().y() > y_max + epsilon)
                return false; // not on the line

            return fabs(slope() * (via.coordinate().x() - m_start.x()) - (via.coordinate().y() - m_start.y())) <
                   epsilon;
        }
    }
    Segment createExtendedSegmentByDegreeAndLength(double angle_degrees, double length, bool from_end = true)
    {
        // Calculate the current angle of the segment
        double current_angle;
        if (from_end)
        {
            current_angle = atan2(m_end.y() - m_start.y(), m_end.x() - m_start.x());
        }
        else
        {
            current_angle = atan2(m_start.y() - m_end.y(), m_start.x() - m_end.x());
        }

        // Convert degrees to radians and add to current angle
        double total_angle_radians = current_angle + angle_degrees * (M_PI / 180.0);

        // Calculate the delta x and delta y based on the total angle and length
        double delta_x = length * cos(total_angle_radians);
        double delta_y = length * sin(total_angle_radians);

        if (from_end)
        {
            // Calculate the new end coordinate
            Coordinate new_end(m_end.x() + delta_x, m_end.y() + delta_y, m_end.z());

            // Create the new segment from the current end to the new end
            return Segment(m_end, new_end);
        }
        else
        {
            // Calculate the new end coordinate
            Coordinate new_end(m_start.x() + delta_x, m_start.y() + delta_y, m_start.z());

            // Create the new segment from the current start to the new end
            return Segment(m_start, new_end);
        }
    }

    // Create a new segment by extending the current segment by a specified degree
    Segment createExtendedSegmentByDegree(double angle_degrees,
                                          double target_x = std::numeric_limits<double>::quiet_NaN(),
                                          double target_y = std::numeric_limits<double>::quiet_NaN(),
                                          bool from_end = true)
    {
        if (from_end)
        {
            // First, calculate the current angle of the segment
            double current_angle = atan2(m_end.y() - m_start.y(), m_end.x() - m_start.x());
            // Convert degrees to radians and add to current angle
            double total_angle_radians = current_angle + angle_degrees * (M_PI / 180.0);

            // Calculate the new endpoint based on the specified target coordinate
            Coordinate new_end;
            if (!std::isnan(target_x))
            {
                // Calculate y using the known x
                double delta_x = target_x - m_end.x();
                double delta_y = tan(total_angle_radians) * delta_x;
                // if total_andle_radains is M_PI/2 or -M_PI/2
                if (deq(total_angle_radians, M_PI / 2) || deq(total_angle_radians, -M_PI / 2))
                    throw std::invalid_argument("Angle results in an undefined delta_y (vertical line).");
                new_end = Coordinate(target_x, m_end.y() + delta_y, m_end.z());
            }
            else if (!std::isnan(target_y))
            {
                // Calculate x using the known y
                double delta_y = target_y - m_end.y();
                double delta_x = delta_y / tan(total_angle_radians);
                if (std::isinf(delta_x)) // Handle cases where tan returns infinity
                    throw std::invalid_argument("Angle results in an undefined delta_x (horizontal line).");
                new_end = Coordinate(m_end.x() + delta_x, target_y, m_end.z());
            }
            else
            {
                throw std::invalid_argument("At least one target coordinate (x or y) must be provided.");
            }

            // Create the new segment from the current end to the new end
            return Segment(m_end, new_end);
        }
        else
        {
            // First, calculate the current angle of the segment
            double current_angle = atan2(m_end.y() - m_start.y(), m_end.x() - m_start.x());
            // Convert degrees to radians and add to current angle
            double total_angle_radians = current_angle + angle_degrees * (M_PI / 180.0);

            // Calculate the new endpoint based on the specified target coordinate
            Coordinate new_end;
            if (!std::isnan(target_x))
            {
                // Calculate y using the known x
                double delta_x = target_x - m_start.x();
                double delta_y = tan(total_angle_radians) * delta_x;
                new_end = Coordinate(target_x, m_start.y() + delta_y, m_start.z());
            }
            else if (!std::isnan(target_y))
            {
                // Calculate x using the known y
                double delta_y = target_y - m_start.y();
                double delta_x = delta_y / tan(total_angle_radians);
                if (std::isinf(delta_x)) // Handle cases where tan returns infinity
                    throw std::invalid_argument("Angle results in an undefined delta_x (vertical line).");
                new_end = Coordinate(m_start.x() + delta_x, target_y, m_start.z());
            }
            else
            {
                throw std::invalid_argument("At least one target coordinate (x or y) must be provided.");
            }

            // Create the new segment from the current end to the new end
            return Segment(m_start, new_end);
        }
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
    void addSegment(Segment segment);
    void addVia(Via via) { m_vias.push_back(via); }
    void setViaNetId();
    void setSegmentNetId();
    void removeSegment(Segment segment)
    {
        // remove the segment from the vector
        // iterate the segments it and remove it
        for (auto it = m_segments.begin(); it != m_segments.end();)
        {
            if (*it == segment)
            {
                it = m_segments.erase(it);
            }
            else
            {
                ++it;
            }
        }
    }
};
#endif // COMPONENT_DATA_HPP
