#include "io.hpp"
#include <fstream>
#include <iostream>
#include <nlohmann/json.hpp>
#include <regex>
#include <sstream>
#include <stdexcept>

using json = nlohmann::json;

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
            continue;
        }
        if (std::regex_match(line, match, net_pattern))
        {
            net_name = match[1].str();
            net = std::make_shared<Nets>(net_name, data_manager.netlists().nets().size());
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
            data_manager.netlists().nets().push_back(net);
            continue;
        }
    }
    // Check if netlist count matches
    // If number is 0, then we are not checking, means no address signal
    if (number && data_manager.netlists().nets().size() != static_cast<std::size_t>(count))
    {
        throw std::runtime_error("Error: Netlist count does not match");
    }

    return;
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

    return;
}

ObstaclesParser::ObstaclesParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

ObstaclesParser::~ObstaclesParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void ObstaclesParser::parse(DataManager &data_manager)
{
    /*
    Pattern: bottom_left_x bottom_left_y top_right_x top_right_y layer_number
    */

    std::string line;
    while (std::getline(file, line))
    {
        std::istringstream iss(line);
        int bottom_left_x, bottom_left_y, top_right_x, top_right_y, layer_number;
        if (!(iss >> bottom_left_x >> bottom_left_y >> top_right_x >> top_right_y >> layer_number))
        {
            std::cerr << "Failed to read obstacle" << std::endl;
            continue;
        }

        data_manager.addObstacle(Obstacle{Coordinate(bottom_left_x / 100.0, bottom_left_y / 100.0, layer_number),
                                          Coordinate(top_right_x / 100.0, top_right_y / 100.0, layer_number),
                                          layer_number});
        data_manager.pcb_bounding_box().at(0).x() =
            std::min(data_manager.pcb_bounding_box().at(0).x(), bottom_left_x / 100.0);
        data_manager.pcb_bounding_box().at(0).y() =
            std::min(data_manager.pcb_bounding_box().at(0).y(), bottom_left_y / 100.0);
        data_manager.pcb_bounding_box().at(1).x() =
            std::max(data_manager.pcb_bounding_box().at(1).x(), top_right_x / 100.0);
        data_manager.pcb_bounding_box().at(1).y() =
            std::max(data_manager.pcb_bounding_box().at(1).y(), top_right_y / 100.0);
    }

    return;
}

ComponentParser::ComponentParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

ComponentParser::~ComponentParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void ComponentParser::parse(DataManager &data_manager)
{
    json config;
    file >> config;

    for (auto &component : config["components"])
    {
        data_manager.components()[component["id"]]->group() = component["group"];
        data_manager.components()[component["id"]]->rotation_angle() = component["angle"];
        data_manager.components()[component["id"]]->is_vertical_stack() = component["is_vertical_stack"];
        if (data_manager.components()[component["id"]]->is_vertical_stack())
        {
            data_manager.components()[component["id"]]->neighboors().at(0) = component["boundaries"]["N"];
            data_manager.components()[component["id"]]->neighboors().at(1) = component["boundaries"]["S"];
        }
        else
        {
            data_manager.components()[component["id"]]->neighboors().at(0) = component["boundaries"]["W"];
            data_manager.components()[component["id"]]->neighboors().at(1) = component["boundaries"]["E"];
        }
        if (component["group"] == "CPU")
        {
            data_manager.components()[component["id"]]->is_cpu() = true;
            if (component["boundaries"]["N"])
            {
                data_manager.cpu_escape_boundry() = "N";
                data_manager.components()[component["id"]]->cpu_escape_boundry() = "N";
            }
            else if (component["boundaries"]["E"])
            {
                data_manager.cpu_escape_boundry() = "E";
                data_manager.components()[component["id"]]->cpu_escape_boundry() = "E";
            }
            else if (component["boundaries"]["S"])
            {
                data_manager.cpu_escape_boundry() = "S";
                data_manager.components()[component["id"]]->cpu_escape_boundry() = "S";
            }
            else if (component["boundaries"]["W"])
            {
                data_manager.cpu_escape_boundry() = "W";
                data_manager.components()[component["id"]]->cpu_escape_boundry() = "W";
            }
        }
        data_manager.groups()[component["group"]].push_back(data_manager.components()[component["id"]]);
        // push component's nets to m_groups_nets, insert net_id
        for (auto &n : data_manager.groups()[component["group"]].at(0)->pins())
        {
            data_manager.groups_nets()[component["group"]].insert(n->net_id());
        }
    }
#ifdef VERBOSE
    // just print out groups_nets size
    for (const auto &group : data_manager.groups_nets())
    {
        std::cout << "Group: " << group.first << std::endl;
        std::cout << "Size: " << group.second.size() << std::endl;
    }
    // for (const auto &component : data_manager.components())
    // {
    //     std::cout << "Component ID: " << component.first << std::endl;
    //     std::cout << "Group: " << component.second->group() << std::endl;
    //     std::cout << "Rotation Angle: " << component.second->rotation_angle() << std::endl;
    //     std::cout << "Is Vertical Stack: " << component.second->is_vertical_stack() << std::endl;
    //     std::cout << "Neighboors: " << component.second->neighboors().at(0) << " "
    //               << component.second->neighboors().at(1) << std::endl;
    //     std::cout << "Is CPU: " << component.second->is_cpu() << std::endl;
    // }
#endif
    return;
}

EdgeParser::EdgeParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + filename);
    }
}

EdgeParser::~EdgeParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void EdgeParser::parse(DataManager &data_manager)
{
    json config;
    file >> config;

    for (const auto &pair : config.items()) // Loop through each key-value pair
    {
        const std::string &key = pair.key();
        const json &elements = pair.value();

        if (key == "ddr2ddr" || key == "cpu2ddr") // Check if key is "ddr2ddr" or "cpu2ddr"
        {
            for (const auto &element : elements) // Loop through each edge
            {
                std::pair<std::string, char> from = {
                    element["from"]["comp_name"],
                    element["from"]["escaepe_dir"].get<std::string>()[0] // string to char
                };
                std::pair<std::string, char> to = {
                    element["to"]["comp_name"],
                    element["to"]["escaepe_dir"].get<std::string>()[0] // string to char
                };

                // if (!data_manager.components().count(from.first) || !data_manager.components().count(to.first))
                // {
                //     throw std::runtime_error("Error: Component not found");
                // }

                if (key == "ddr2ddr")
                {
                    data_manager.ddr2ddr_edges().push_back({from, to});
                }
                else if (key == "cpu2ddr")
                {
                    bool fly_by = element.value("fly-by", false);
                    data_manager.cpu2ddr_edges().push_back({from, to, fly_by});
                }
            }
        }
        else
        {
            throw std::runtime_error("Error: Unknown edge type");
        }
    }

    return;
}
