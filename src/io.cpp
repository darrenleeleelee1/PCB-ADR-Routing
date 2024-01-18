#include "io.hpp"
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
ADRParser::ADRParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

ADRParser::~ADRParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void ADRParser::parse(DataManager &data_manager)
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
            // Net net;
            std::shared_ptr<Net> net = std::make_shared<Net>();
            net->net_name() = line.substr(line.find(":") + 2);

            while (std::getline(file, line))
            {
                if (line.find("PIN START") != std::string::npos)
                    continue;

                if (line.find("PIN END") != std::string::npos)
                    break;
                std::istringstream iss(line);
                std::string comp_pin, coords;
                iss >> comp_pin >> coords;

                std::getline(iss, coords);

                auto dot_pos = comp_pin.find('.');
                auto comma_pos = coords.find(',');

                std::string comp_name = comp_pin.substr(0, dot_pos);
                std::string pin_name = comp_pin.substr(dot_pos + 1);

                double x = std::stod(coords.substr(0, comma_pos));
                double y = std::stod(coords.substr(comma_pos + 1));

                if (data_manager.component2idx().find(comp_name) == data_manager.component2idx().end())
                {
                    throw std::runtime_error("Component " + comp_name + " found in .adr file but not in .odr file");
                }

                data_manager.getComponent(comp_name)->addPin(pin_name, net, x, y);
                net->addPin(data_manager.getComponent(comp_name)->pins().at(pin_name));
            }
        }
    }
}

LayerParser::LayerParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

LayerParser::~LayerParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void LayerParser::parse(DataManager &data_manager)
{
    int layerCount;
    if (!(file >> layerCount))
    {
        std::cerr << "Failed to read layer count" << std::endl;
        return;
    }

    file.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // Skip the rest of the first line

    for (int i = 0; i < layerCount; ++i)
    {
        std::string line;
        if (!getline(file, line))
        {
            break;
        } // error or end of file

        std::size_t lastSpace = line.find_last_of(" ");
        if (lastSpace == std::string::npos)
        {
            break;
        } // error: no space found

        std::string layer_name = line.substr(0, lastSpace);
        int layer_number;
        std::istringstream iss(line.substr(lastSpace + 1));
        if (!(iss >> layer_number))
        {
            break;
        } // error reading number

        data_manager.layers().emplace(layer_name, layer_number);
        // data_manager.layers()[layer_name] = layer_number;
    }
}

OrderParser::OrderParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

OrderParser::~OrderParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void OrderParser::parse(DataManager &data_manager)
{
    std::string line;

    auto getDirectionEnum = [](const std::string &direction) -> TileNodePosition {
        if (direction == "North")
            return TileNodePosition::North;
        else if (direction == "East")
            return TileNodePosition::East;
        else if (direction == "South")
            return TileNodePosition::South;
        else if (direction == "West")
            return TileNodePosition::West;
        else
            throw std::runtime_error("Invalid direction in order file");
    };

    while (std::getline(file, line))
    {
        if (line.empty() || isdigit(line[0]))
            continue; // Skip number lines and empty lines

        std::string comp_name = line.substr(0, line.find(':'));

        data_manager.addComponent(comp_name);

        for (size_t i = 0; i < 2; ++i)
        {
            std::getline(file, line);
            std::istringstream iss(line);
            std::string directionType, direction;
            iss >> directionType;
            while (iss >> direction)
            {
                TileNodePosition tmp = getDirectionEnum(direction);
                if (directionType == "In:")
                    data_manager.getComponent(comp_name)->in_directions().at(static_cast<size_t>(tmp)) = true;
                else if (directionType == "Out:")
                    data_manager.getComponent(comp_name)->out_directions().at(static_cast<size_t>(tmp)) = true;
            }
        }
    }
}