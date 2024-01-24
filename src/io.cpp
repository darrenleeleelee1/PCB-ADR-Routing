#include "io.hpp"
#include <fstream>
#include <iostream>
#include <regex>
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
    std::regex pin_nets_pattern(R"((\d+)-pin nets: (\d+))");
    std::regex net_pattern(R"(NetName: ([^\n]+))");
    std::regex pin_pattern(R"(    (\w+)\.(\w+)\s+(\d+(\.\d+)?)\s*,\s*(\d+(\.\d+)?))");
    std::smatch match;
    std::shared_ptr<Nets> net;
    int number;
    int count;
    std::string net_name;
    while (std::getline(file, line))
    {
        if (std::regex_match(line, match, pin_nets_pattern))
        {
            number = std::stoi(match[1].str());
            count = std::stoi(match[2].str());
            data_manager.createNetlist(number);
            continue;
        }
        if (std::regex_match(line, match, net_pattern))
        {
            net_name = match[1].str();
            net = std::make_shared<Nets>(net_name, data_manager.netlists().at(number).nets().size());
            continue;
        }
        if (std::regex_match(line, match, pin_pattern))
        {
            std::string comp_name = match[1].str();
            std::string pin_name = match[2].str();
            double x = std::stod(match[3].str());
            double y = std::stod(match[5].str());
            std::shared_ptr<Pin> pin = std::make_shared<Pin>(pin_name, comp_name, net_name, net->net_id(), x, y, 0);
            net->addPin(pin);
            data_manager.addCompPin(comp_name, pin);
            continue;
        }
        if (line == "PIN START")
        {
            continue;
        }
        if (line == "PIN END")
        {
            data_manager.netlists().at(number).nets().push_back(net);
            continue;
        }
    }
    // Check if netlist count matches
    if (data_manager.netlists().at(number).nets().size() != static_cast<std::size_t>(count))
    {
        throw std::runtime_error("Error: Netlist count does not match");
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
    }
}