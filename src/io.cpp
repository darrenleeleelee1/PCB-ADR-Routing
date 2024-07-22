#include "io.hpp"
#include <cmath>
#include <fstream>
#include <iostream>
#include <nlohmann/json.hpp>
#include <regex>
#include <sstream>
#include <stdexcept>
#include <utility>

using json = nlohmann::json;
GlobalRoutingManager *global_routing_manager = nullptr;
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

        data_manager.layers().emplace(layer_number, layer_name);
        data_manager.layers_names().emplace(layer_name, layer_number);
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
            data_manager.components()[component["id"]]->neighbors().at(0) = component["boundaries"]["N"];
            data_manager.components()[component["id"]]->neighbors().at(1) = component["boundaries"]["S"];
        }
        else
        {
            data_manager.components()[component["id"]]->neighbors().at(0) = component["boundaries"]["W"];
            data_manager.components()[component["id"]]->neighbors().at(1) = component["boundaries"]["E"];
        }
        if (component["group"] == "CPU")
        {
            data_manager.components()[component["id"]]->is_cpu() = true;
            if (component["boundaries"]["N"])
            {
                data_manager.cpu_escape_boundary() = "N";
                data_manager.components()[component["id"]]->cpu_escape_boundary() = "N";
            }
            else if (component["boundaries"]["E"])
            {
                data_manager.cpu_escape_boundary() = "E";
                data_manager.components()[component["id"]]->cpu_escape_boundary() = "E";
            }
            else if (component["boundaries"]["S"])
            {
                data_manager.cpu_escape_boundary() = "S";
                data_manager.components()[component["id"]]->cpu_escape_boundary() = "S";
            }
            else if (component["boundaries"]["W"])
            {
                data_manager.cpu_escape_boundary() = "W";
                data_manager.components()[component["id"]]->cpu_escape_boundary() = "W";
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
    //     std::cout << "neighbors: " << component.second->neighbors().at(0) << " "
    //               << component.second->neighbors().at(1) << std::endl;
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
                    element["from"]["escape_dir"].get<std::string>()[0] // string to char
                };
                std::pair<std::string, char> to = {
                    element["to"]["comp_name"],
                    element["to"]["escape_dir"].get<std::string>()[0] // string to char
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
                    std::optional<int> T_topology_layer;
                    if (!fly_by && element.contains("T_topology_layer"))
                    {
                        T_topology_layer = element["T_topology_layer"].get<int>();
                    }

                    data_manager.cpu2ddr_edges().push_back({from, to, fly_by, T_topology_layer});
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

SubDrawingParser::SubDrawingParser(const std::string &filename)
{
    file.open(filename);
    if (!file.is_open())
    {
        // just return
        return;
        throw std::runtime_error("Could not open " + filename);
    }
}

SubDrawingParser::~SubDrawingParser()
{
    if (file.is_open())
    {
        file.close();
    }
}

void SubDrawingParser::parse(DataManager &data_manager)
{
    if (!file.is_open())
    {
        return;
        throw std::runtime_error("File not open");
    }

    std::vector<std::vector<Segment>> segments;
    std::regex pathStartRegex(R"(_clpPathStart\s*\(list\s*\(_clpAdjustPt\s*([0-9.]+):([0-9.]+)\s*_clp_cinfo\))");
    std::regex pathLineRegex(R"(\t_clp_cinfo->t_to_units\) \(_clpAdjustPt\s+([0-9.]+):([0-9.]+)\s+_clp_cinfo\)\))");
    // Regular expression to match the layer name in the line:
    // _clp_dbid = _clpDBCreatePath(_clp_path "ETCH/layer_name" nil _clp_sym _clpPl)
    // where layer_name is the name of the layer of the path
    std::regex LayerRegex(
        R"(_clp_dbid\s=\s_clpDBCreatePath\(_clp_path\s+\"ETCH/([^\"]+)\"\s+nil\s+_clp_sym\s+_clpPl\))");

    std::smatch match;

    std::stringstream buffer;
    buffer << file.rdbuf();
    std::string content = buffer.str();

    std::istringstream stream(content);
    std::string line;
    std::vector<Segment> currentPath;
    Coordinate current_point = {0.0, 0.0, -1};

    while (std::getline(stream, line))
    {
        if (std::regex_search(line, match, pathStartRegex))
        {
            current_point.x() = std::stod(match[1].str());
            current_point.y() = std::stod(match[2].str());
        }
        else if (std::regex_search(line, match, pathLineRegex))
        {
            Coordinate next_point = {std::stod(match[1].str()), std::stod(match[2].str()), -1};
            currentPath.emplace_back(Segment{current_point, next_point, 255});
            current_point = next_point;
        }
        else if (std::regex_search(line, match, LayerRegex))
        {
            // change all the segments to the new layer
            if (!data_manager.layers_names().count(match[1].str()))
            {
                currentPath.clear();
                break;
            }
            int layer = data_manager.layers_names()[match[1].str()];
            for (auto &seg : currentPath)
            {
                seg.setLayer(layer);
            }
            if (!currentPath.empty())
            {
                segments.push_back(currentPath);
                currentPath.clear();
            }
        }
    }

    // Here you can use the segments vector to populate the data_manager or further processing
    // Example: data_manager.setSegments(segments);
    data_manager.data_signals() = segments;
#ifdef VERBOSE
    // Example print out
    for (const auto &path : segments)
    {
        std::cout << "New Path:" << std::endl;
        for (const auto &seg : path)
        {
            std::cout << "  Segment from (" << seg.start().x() << ", " << seg.start().y() << ", " << seg.layer()
                      << ") to (" << seg.end().x() << ", " << seg.end().y() << ", " << seg.layer() << ")" << std::endl;
        }
    }
#endif
}

std::pair<int, int> GlobalRoutingManager::findCell(const double &x,
                                                   const double &y,
                                                   const double &left_bottom_x,
                                                   const double &left_bottom_y,
                                                   const double &cell_width,
                                                   const double &cell_height)
{
    // 計算相對於左下角的偏移
    double relative_x = x - left_bottom_x;
    double relative_y = y - left_bottom_y;

    // 計算在哪個格子，因為學姊的 col j 代表 x 軸，row i 代表 y 軸
    int i = std::floor(relative_x / cell_width);
    int j = std::floor(relative_y / cell_height);

    // 返回 pair<i, j>
    return std::make_pair(i, j);
}

void GlobalRoutingManager::writeADREscapePoints(DataManager *data_manager,
                                                const std::vector<std::pair<Coordinate, int>> &cpu_ep,
                                                const std::vector<std::pair<Coordinate, int>> &ddr_ep)
{
    std::string file_name = m_output_directory + "/" + m_prefix + "_adr_escape_points.txt";
    std::ofstream file(file_name, std::ios::trunc);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open " + file_name);
    }

    // Create a structure to hold sorted data
    struct EscapePoint
    {
        Coordinate coord;
        bool is_cpu;
    };
    std::map<int, std::vector<EscapePoint>> sorted_points;

    // Populate the map with DDR escape points first
    for (const auto &ep : ddr_ep)
    {
        sorted_points[ep.second].push_back({ep.first, false});
    }

    // Populate the map with CPU escape points, adjusting z coordinate
    for (const auto &ep : cpu_ep)
    {
        auto &points = sorted_points[ep.second];
        if (!points.empty())
        {
            // Adjust z coordinate to match DDR point
            Coordinate adjusted_coord = ep.first;
            adjusted_coord.z() = points[0].coord.z();
            points.insert(points.begin(), {adjusted_coord, true});
        }
        else
        {
            // If no DDR point exists, add CPU point as is
            points.push_back({ep.first, true});
        }
    }

    // Write sorted data to file
    for (const auto &[net_id, points] : sorted_points)
    {
        file << "Net name: " << data_manager->netlists().nets().at(net_id)->net_name() << std::endl;
        for (const auto &point : points)
        {
            const auto [cell_row, cell_col] = findCell(point.coord.x(), point.coord.y());
            file << (point.is_cpu ? "CPU: " : "DDR: ") << cell_row << " " << cell_col << " " << point.coord.z()
                 << std::endl;
        }
        file << std::endl; // Add a blank line between nets
    }
}