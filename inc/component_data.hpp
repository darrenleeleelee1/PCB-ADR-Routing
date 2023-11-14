#ifndef COMPONENT_DATA_HPP
#define COMPONENT_DATA_HPP

#ifdef VERBOSE
#include <iostream>
#endif
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
    Coordinate(double x, double y, double z)
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
    Pin(const std::string &name, double x, double y, double z)
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

class Component
{
private:
    std::string m_name;
    std::unordered_map<std::string, std::shared_ptr<Pin>> m_pins;

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

    // Method to find the extreme points: bottom left and top right of the bounding rectangle
    std::pair<Coordinate, Coordinate> findExtremePoints() const
    {
        double min_x = std::numeric_limits<double>::max();
        double min_y = std::numeric_limits<double>::max();
        double max_x = std::numeric_limits<double>::lowest();
        double max_y = std::numeric_limits<double>::lowest();

        for (const auto &pair : m_pins)
        {
            auto &pin = pair.second;
            min_x = std::min(min_x, pin->coordinate().x());
            min_y = std::min(min_y, pin->coordinate().y());
            max_x = std::max(max_x, pin->coordinate().x());
            max_y = std::max(max_y, pin->coordinate().y());
        }

        Coordinate bottom_left{min_x, min_y, 0};
        Coordinate top_right{max_x, max_y, 0};

        return {bottom_left, top_right};
    }

    double calculateMinNonZeroXOffset(double y_tolerance = 0.5) const
    {
        double min_offset = std::numeric_limits<double>::max();
        for (const auto &pin1 : m_pins)
        {
            for (const auto &pin2 : m_pins)
            {
                if (pin1.first != pin2.first)
                {
                    double y_diff = std::abs(pin1.second->coordinate().y() - pin2.second->coordinate().y());
                    if (y_diff <= y_tolerance)
                    { // Check if y difference is within tolerance
                        double x_offset = std::abs(pin1.second->coordinate().x() - pin2.second->coordinate().x());
                        if (x_offset > 0)
                        {
                            min_offset = std::min(min_offset, x_offset);
                        }
                    }
                }
            }
        }
        return min_offset == std::numeric_limits<double>::max() ? 0.0 : min_offset;
    }

    double calculateMinNonZeroYOffset(double x_tolerance = 0.5) const
    {
        double min_offset = std::numeric_limits<double>::max();
        for (const auto &pin1 : m_pins)
        {
            for (const auto &pin2 : m_pins)
            {
                if (pin1.first != pin2.first)
                {
                    double x_diff = std::abs(pin1.second->coordinate().x() - pin2.second->coordinate().x());
                    if (x_diff <= x_tolerance)
                    { // Check if x difference is within tolerance
                        double y_offset = std::abs(pin1.second->coordinate().y() - pin2.second->coordinate().y());
                        if (y_offset > 0)
                        {
                            min_offset = std::min(min_offset, y_offset);
                        }
                    }
                }
            }
        }
        return min_offset == std::numeric_limits<double>::max() ? 0.0 : min_offset;
    }

#ifdef VERBOSE
    void printComponent() const
    {
        std::cout << "Component Name: " << m_name << std::endl;
        std::cout << "Pins:" << std::endl;
        for (const auto &pair : m_pins)
        {
            std::cout << "Pin Name: " << pair.first << " " << pair.second->coordinate().printCoordinate() << std::endl;
        }
        std::cout << "Minimum Non-Zero X Offset: " << calculateMinNonZeroXOffset() << std::endl;
        std::cout << "Minimum Non-Zero Y Offset: " << calculateMinNonZeroYOffset() << std::endl;
        auto extreme_points = findExtremePoints();
        std::cout << "Bottom Left: " << extreme_points.first.printCoordinate() << std::endl;
        std::cout << "Top Right: " << extreme_points.second.printCoordinate() << std::endl;
    }
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
    std::unordered_map<std::string, Component> m_components;
    std::unordered_map<std::string, int> m_layers;

public:
    // Accessor for netlist
    const Netlist &netlist() const { return m_netlist; }
    Netlist &netlist() { return m_netlist; }

    // Accessor for components
    const std::unordered_map<std::string, Component> &components() const { return m_components; }
    std::unordered_map<std::string, Component> &components() { return m_components; }

    // Accessor for layers
    const std::unordered_map<std::string, int> &layers() const { return m_layers; }
    std::unordered_map<std::string, int> &layers() { return m_layers; }
#ifdef VERBOSE
    void printDataManager(int verbose = 0) const
    {
        std::cout << "Number of Nets: " << m_netlist.num_nets() << std::endl;
        std::cout << "Number of Components: " << m_components.size() << std::endl;
        if (verbose > 0)
        {
            for (auto i : m_components)
            {
                i.second.printComponent();
            }
        }
        std::cout << "Number of Layers: " << m_layers.size() << std::endl;
        if (verbose > 0)
        {
            for (auto i : m_layers)
            {
                std::cout << "Layer Name: " << i.first << " Layer Number: " << i.second << std::endl;
            }
        }
    }
#endif
};

#endif // COMPONENT_DATA_HPP
