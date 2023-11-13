#include "io.hpp"
#include <fstream>
#include <sstream>
#include <stdexcept>

ADRParser::ADRParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open file");
    }
}

ADRParser::~ADRParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void ADRParser::parse()
{
    std::string line;
    while (std::getline(file, line))
    {
        if (line.find("-pin nets:") != std::string::npos)
        {
            // Handle the n-pin nets header
            continue;
        }

        if (line.find("NetName:") != std::string::npos)
        {
            // Start a new net block
            Net net;
            net.netName = line.substr(line.find(":") + 2);

            while (std::getline(file, line))
            {
                if (line.find("PIN START") != std::string::npos)
                    continue;

                if (line.find("PIN END") != std::string::npos)
                    break;
                std::istringstream iss(line);
                std::string compPin, coords;
                iss >> compPin >> coords;

                std::getline(iss, coords);

                auto dotPos = compPin.find('.');
                auto commaPos = coords.find(',');

                std::string compName = compPin.substr(0, dotPos);
                std::string pinName = compPin.substr(dotPos + 1);

                double x = std::stod(coords.substr(0, commaPos));
                double y = std::stod(coords.substr(commaPos + 1));

                if (components.find(compName) == components.end())
                {
                    components[compName] = Component();
                }

                components[compName].addPin(pinName, x, y);
                net.addPin(&components[compName].pins[pinName]);
            }

            // Here you can store the net information as needed
        }
    }
}
// Other method implementations
