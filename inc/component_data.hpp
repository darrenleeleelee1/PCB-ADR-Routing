#ifndef COMPONENT_DATA_HPP
#define COMPONENT_DATA_HPP

#include <string>
#include <unordered_map>
#include <vector>

// Define a Pin structure
struct Pin
{
    std::string name;
    double x;
    double y;
};

// Component class which stores pins
class Component
{
public:
    std::string name;
    std::unordered_map<std::string, Pin> pins;

    void addPin(const std::string &pinName, double x, double y)
    {
        Pin pin = {pinName, x, y};
        pins[pinName] = pin;
    }

    // Other methods and members as needed
};

// Net class to store the net name and associated pins
class Net
{
public:
    std::string netName;
    std::vector<Pin *> connectedPins;

    void addPin(Pin *pin) { connectedPins.push_back(pin); }

    // Other methods and members as needed
};

class Netlist
{
public:
    size_t numNets;
    std::vector<Net *> nets;
    void addNet(Net *net) { nets.push_back(net); }
};

#endif // COMPONENT_DATA_HPP
