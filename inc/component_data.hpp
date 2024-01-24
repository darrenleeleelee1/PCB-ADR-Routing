#ifndef COMPONENT_DATA_HPP
#define COMPONENT_DATA_HPP

#ifdef VERBOSE
#include <iostream>
#endif
#include <cmath>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

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
    bool operator==(const Coordinate &rhs) const { return m_x == rhs.m_x && m_y == rhs.m_y && m_z == rhs.m_z; }
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
    // Private Methods
    std::pair<Coordinate, Coordinate> findBoundingBox();
    double calculateTileWidth(double y_tolerance = 5e-2);
    double calculateTileHeight(double x_tolerance = 5e-2);

public:
    // Constructor
    Component() = default;
    Component(const std::string &comp_name)
        : m_comp_name(comp_name)
    {
    }
    // Operator Overloads
    bool operator==(const Component &rhs) const
    {
        return m_comp_name == rhs.m_comp_name && m_pins == rhs.m_pins && m_rows == rhs.m_rows &&
               m_columns == rhs.m_columns && m_pin_arr == rhs.m_pin_arr && m_bottom_left == rhs.m_bottom_left &&
               m_top_right == rhs.m_top_right && m_tile_width == rhs.m_tile_width && m_tile_height == rhs.m_tile_height;
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
    // Methods
    void addPin(std::shared_ptr<Pin> pin) { m_pins.push_back(pin); }
    void createPinArr();
};

class Nets
{
private:
    std::string m_net_name;
    int m_net_id;
    std::vector<std::shared_ptr<Pin>> m_pins;

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
};

class DataManager
{
private:
    std::unordered_map<std::string, std::shared_ptr<Component>> m_components;
    std::unordered_map<int, Netlist> m_netlists;
    std::unordered_map<std::string, int> m_layers;

public:
    // Constructor
    DataManager() = default;
    // Accessor
    // Access for components
    const std::unordered_map<std::string, std::shared_ptr<Component>> &components() const { return m_components; }
    std::unordered_map<std::string, std::shared_ptr<Component>> &components() { return m_components; }
    // Access for netlists
    const std::unordered_map<int, Netlist> &netlists() const { return m_netlists; }
    std::unordered_map<int, Netlist> &netlists() { return m_netlists; }
    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }

    // Methods
    void createNetlist(int count);
    void addCompPin(std::string comp_name, std::shared_ptr<Pin> pin);
    void preprocess();
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

public:
    // Constructor
    Segment() = default;
    Segment(const Coordinate &start, const Coordinate &end)
        : m_start(start)
        , m_end(end)
    {
    }
    Segment(const double &x1, const double &y1, const int z1, const double &x2, const double &y2, const int z2)
        : m_start(x1, y1, z1)
        , m_end(x2, y2, z2)
    {
    }
    // Accessor
    // Access for start
    const Coordinate &start() const { return m_start; }
    Coordinate &start() { return m_start; }
    // Access for end
    const Coordinate &end() const { return m_end; }
    Coordinate &end() { return m_end; }
    // Methods
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
