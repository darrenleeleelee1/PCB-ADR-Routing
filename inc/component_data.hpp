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
    std::string m_name;
    Coordinate m_coordinate;

public:
    //  Constructor
    Pin() = default;
    Pin(const std::string &name, double x, double y, int z)
        : m_name(name)
        , m_coordinate{x, y, z}
    {
    }
    // Accessor for name
    const std::string &name() const { return m_name; }
    std::string &name() { return m_name; }

    // Accessor for coordinate
    const Coordinate &coordinate() const { return m_coordinate; }
    Coordinate &coordinate() { return m_coordinate; }
};

enum PinNodePosition
{
    BottomLeft = 0,
    BottomRight = 1,
    TopRight = 2,
    TopLeft = 3
};

enum TileNodePosition
{
    North = 0,
    East = 1,
    South = 2,
    West = 3,
    Center = 4
};

class Tile
{
private:
    std::array<std::shared_ptr<Pin>, 4> m_pins; // Array to store 4 pin positions
    Coordinate m_bottom_left;
    double m_tile_width;
    double m_tile_height;

public:
    // Constructors
    Tile()
        : m_tile_width(0.0)
        , m_tile_height(0.0)
    {
    }

    Tile(const Coordinate &bottom_left, double tile_width, double tile_height)
        : m_bottom_left(bottom_left)
        , m_tile_width(tile_width)
        , m_tile_height(tile_height)
    {
    }

    // Accessor for pins
    const std::shared_ptr<Pin> &getPin(PinNodePosition position) const { return m_pins[position]; }

    void setPin(PinNodePosition position, std::shared_ptr<Pin> pin) { m_pins[position] = pin; }

    // Accessors for bottom_left, tile_width, and tile_height
    const Coordinate &bottom_left() const { return m_bottom_left; }
    double tile_width() const { return m_tile_width; }
    double tile_height() const { return m_tile_height; }
};

class Component
{
private:
    std::string m_name;
    std::unordered_map<std::string, std::shared_ptr<Pin>> m_pins;
    std::vector<std::vector<std::vector<std::shared_ptr<Tile>>>> m_tiles;

public:
    Component() = default;
    Component(const std::string &name)
        : m_name(name)
    {
    }
    // Accessor for name
    const std::string &name() const { return m_name; }
    std::string &name() { return m_name; }

    // Accessor for pins
    const std::unordered_map<std::string, std::shared_ptr<Pin>> &pins() const { return m_pins; }
    // Method for add pins
    void addPin(const std::string &pin_name, double x, double y)
    {
        m_pins[pin_name] = std::make_shared<Pin>(Pin{pin_name, x, y, 0});
    }

    // Accessor for tiles
    const std::vector<std::vector<std::vector<std::shared_ptr<Tile>>>> &tiles() const { return m_tiles; }
    std::vector<std::vector<std::vector<std::shared_ptr<Tile>>>> &tiles() { return m_tiles; }

    // Method to find the extreme points: bottom left and top right of the bounding rectangle
    std::pair<Coordinate, Coordinate> findExtremePoints() const;
    double calculateMinNonZeroXOffset(double y_tolerance = 0.5) const;
    double calculateMinNonZeroYOffset(double x_tolerance = 0.5) const;
    void splitingTiles(size_t num_layers);

#ifdef VERBOSE
    void printTiles() const;

    void printComponent() const;
#endif
};

class Net
{
private:
    std::string m_net_name;
    std::vector<std::shared_ptr<Pin>> m_connected_pins;

public:
    // Accessor for net_name
    const std::string &net_name() const { return m_net_name; }
    std::string &net_name() { return m_net_name; }

    // Accessor for connected_pins
    const std::vector<std::shared_ptr<Pin>> &connected_pins() const { return m_connected_pins; }
    std::vector<std::shared_ptr<Pin>> &connected_pins() { return m_connected_pins; }
    // Method to add a pin
    void addPin(const std::shared_ptr<Pin> &pin) { m_connected_pins.push_back(pin); }
};

class Netlist
{
private:
    size_t m_num_nets;
    std::vector<std::unique_ptr<Net>> m_nets;

public:
    // Accessor for num_nets
    const size_t &num_nets() const { return m_num_nets; }
    size_t &num_nets() { return m_num_nets; }

    // Accessor for nets
    const std::vector<std::unique_ptr<Net>> &nets() const { return m_nets; }
    std::vector<std::unique_ptr<Net>> &nets() { return m_nets; }

    // Method to add a net
    void addNet(std::unique_ptr<Net> net)
    {
        m_nets.push_back(std::move(net));
        m_num_nets = m_nets.size();
    }
};

class DataManager
{
private:
    Netlist m_netlist;
    std::unordered_map<std::string, std::shared_ptr<Component>> m_components;
    std::unordered_map<std::string, int> m_layers;

public:
    // Accessor for netlist
    const Netlist &netlist() const { return m_netlist; }
    Netlist &netlist() { return m_netlist; }

    // Accessor for components
    const std::unordered_map<std::string, std::shared_ptr<Component>> &components() const { return m_components; }
    std::unordered_map<std::string, std::shared_ptr<Component>> &components() { return m_components; }

    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }

    void splitingTiles()
    {
        for (auto &component : m_components) component.second->splitingTiles(m_layers.size());
    }
#ifdef VERBOSE
    void printDataManager(int verbose = 0) const;
#endif
};

#endif // COMPONENT_DATA_HPP
