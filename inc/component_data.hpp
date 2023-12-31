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

enum class PinNodePosition
{
    BottomLeft = 0,
    BottomRight = 1,
    TopRight = 2,
    TopLeft = 3
};

enum class TileNodePosition
{
    North = 0,
    East = 1,
    South = 2,
    West = 3,
    Center = 4,
    Via = 5
};

class Tile
{
private:
    std::array<std::shared_ptr<Pin>, 4> m_pins; // Array to store 4 pin positions
    std::array<int, 4> m_pins_node_idx; // Array to store 4 pin positions
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
    const std::shared_ptr<Pin> &getPin(PinNodePosition position) const { return m_pins[static_cast<size_t>(position)]; }
    void setPin(PinNodePosition position, std::shared_ptr<Pin> pin) { m_pins[static_cast<size_t>(position)] = pin; }

    // Accessor for pins_node_idx
    const int &getPinNodeIdx(PinNodePosition position) const { return m_pins_node_idx[static_cast<size_t>(position)]; }
    void setPinNodeIdx(PinNodePosition position, int idx) { m_pins_node_idx[static_cast<size_t>(position)] = idx; }

    // Accessor for bottom_left
    const Coordinate &bottom_left() const { return m_bottom_left; }
    Coordinate &bottom_left() { return m_bottom_left; }

    // Accessor for tile_width
    double tile_width() const { return m_tile_width; }
    double &tile_width() { return m_tile_width; }

    // Accessor for tile_height
    double tile_height() const { return m_tile_height; }
    double &tile_height() { return m_tile_height; }

    Coordinate getPinCornerCoordinate(PinNodePosition pos)
    {
        switch (pos)
        {
        case PinNodePosition::BottomLeft: return m_bottom_left;
        case PinNodePosition::BottomRight:
            return Coordinate{m_bottom_left.x() + m_tile_width, m_bottom_left.y(), m_bottom_left.z()};
        case PinNodePosition::TopRight:
            return Coordinate{m_bottom_left.x() + m_tile_width, m_bottom_left.y() + m_tile_height, m_bottom_left.z()};
        case PinNodePosition::TopLeft:
            return Coordinate{m_bottom_left.x(), m_bottom_left.y() + m_tile_height, m_bottom_left.z()};
        default: throw std::invalid_argument("Invalid PinNodePosition");
        }
    }

    Coordinate getPinCornerCoordinate(int pos) { return getPinCornerCoordinate(static_cast<PinNodePosition>(pos)); }

    Coordinate getTileVertexCoordinate(TileNodePosition pos)
    {
        // Define the offsets as 1/10th of the tile's width and height
        double offsetX = m_tile_width / 10.0;
        double offsetY = m_tile_height / 10.0;

        switch (pos)
        {
        case TileNodePosition::North:
            return Coordinate{
                m_bottom_left.x() + m_tile_width / 2, m_bottom_left.y() + m_tile_height - offsetY, m_bottom_left.z()};
        case TileNodePosition::East:
            return Coordinate{
                m_bottom_left.x() + m_tile_width - offsetX, m_bottom_left.y() + m_tile_height / 2, m_bottom_left.z()};
        case TileNodePosition::South:
            return Coordinate{m_bottom_left.x() + m_tile_width / 2, m_bottom_left.y() + offsetY, m_bottom_left.z()};
        case TileNodePosition::West:
            return Coordinate{m_bottom_left.x() + offsetX, m_bottom_left.y() + m_tile_height / 2, m_bottom_left.z()};
        case TileNodePosition::Center:
        case TileNodePosition::Via:
            return Coordinate{
                m_bottom_left.x() + m_tile_width / 2, m_bottom_left.y() + m_tile_height / 2, m_bottom_left.z()};
        default: throw std::invalid_argument("Invalid TileNodePosition");
        }
    }

    Coordinate getTileVertexCoordinate(int pos) { return getTileVertexCoordinate(static_cast<TileNodePosition>(pos)); }
};

class Component
{
private:
    std::string m_name;
    std::unordered_map<std::string, std::shared_ptr<Pin>> m_pins;
    std::vector<std::vector<std::vector<std::shared_ptr<Tile>>>> m_tiles;
    std::vector<bool> m_in_directions;
    std::vector<bool> m_out_directions;
    std::vector<size_t> m_pin_start_idx;
    std::vector<size_t> m_tile_start_idx;

public:
    Component() = default;
    Component(const std::string &name)
        : m_name(name)
        , m_in_directions(4, false)
        , m_out_directions(4, false)
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

    // Accessor for in_direction
    const std::vector<bool> &in_directions() const { return m_in_directions; }
    std::vector<bool> &in_directions() { return m_in_directions; }

    // Accessor for out_direction
    const std::vector<bool> &out_directions() const { return m_out_directions; }
    std::vector<bool> &out_directions() { return m_out_directions; }

    // Accessor for pin_start_idx
    const std::vector<size_t> &pin_start_idx() const { return m_pin_start_idx; }
    std::vector<size_t> &pin_start_idx() { return m_pin_start_idx; }

    // Accessor for tile_start_idx
    const std::vector<size_t> &tile_start_idx() const { return m_tile_start_idx; }
    std::vector<size_t> &tile_start_idx() { return m_tile_start_idx; }

    // Method to find the extreme points: bottom left and top right of the bounding rectangle
    std::pair<Coordinate, Coordinate> findExtremePoints() const;
    double calculateMinNonZeroXOffset(double y_tolerance = 0.5) const;
    double calculateMinNonZeroYOffset(double x_tolerance = 0.5) const;

    void initialAndSplitingTiles(size_t num_layers);
    void initialIdxVectors(size_t num_layers);
    void initial(size_t num_layers)
    {
        initialAndSplitingTiles(num_layers);
        initialIdxVectors(num_layers);
    }

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
    std::vector<std::shared_ptr<Component>> m_components;
    std::unordered_map<std::string, size_t> m_component2idx;
    std::unordered_map<std::string, int> m_layers;

public:
    // Accessor for netlist
    const Netlist &netlist() const { return m_netlist; }
    Netlist &netlist() { return m_netlist; }

    // Accessor for components
    const std::vector<std::shared_ptr<Component>> &components() const { return m_components; }
    std::vector<std::shared_ptr<Component>> &components() { return m_components; }
    std::shared_ptr<Component> getComponent(size_t index) const { return m_components.at(index); }

    std::shared_ptr<Component> getComponent(const std::string &name) const
    {
        auto it = m_component2idx.find(name);
        if (it != m_component2idx.end())
        {
            return getComponent(it->second); // Reuse the numeric index function
        }
        return nullptr;
    }

    // Accessor for component2idx
    const std::unordered_map<std::string, size_t> &component2idx() const { return m_component2idx; }
    std::unordered_map<std::string, size_t> &component2idx() { return m_component2idx; }

    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }
    void addComponent(std::string comp_name)
    {
        if (m_component2idx.find(comp_name) == m_component2idx.end())
        {
            m_component2idx.emplace(comp_name, m_component2idx.size());
            m_components.push_back(std::make_shared<Component>(comp_name));
        }
        else
        {
            throw std::runtime_error("Add Component error, component `" + comp_name + "` already exists");
        }
    }
    void initialComponents()
    {
        for (auto &component : m_components)
        {
            component->initial(m_layers.size());
        }
    }
#ifdef VERBOSE
    void printDataManager(int verbose = 0) const;
#endif
};

#endif // COMPONENT_DATA_HPP
