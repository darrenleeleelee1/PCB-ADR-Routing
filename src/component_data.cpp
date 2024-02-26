#include "component_data.hpp"
#include "basic_ds.hpp"
#include "graph.hpp"
#ifdef VERBOSE
#include <iostream>
#endif
// Find the corner points of the component
std::pair<Coordinate, Coordinate> Component::findBoundingBox()
{
    double min_x = std::numeric_limits<double>::max();
    double min_y = std::numeric_limits<double>::max();
    double max_x = std::numeric_limits<double>::lowest();
    double max_y = std::numeric_limits<double>::lowest();

    for (const auto &pin : m_pins)
    {
        min_x = std::min(min_x, pin->coordinate().x());
        min_y = std::min(min_y, pin->coordinate().y());
        max_x = std::max(max_x, pin->coordinate().x());
        max_y = std::max(max_y, pin->coordinate().y());
    }

    Coordinate bottom_left{min_x, min_y, 0};
    Coordinate top_right{max_x, max_y, 0};

    return {bottom_left, top_right};
}
double Component::calculateTileWidth(double y_tolerance)
{
    // Tolerance is for y difference that is considered to be the same row
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1 != pin2)
            {
                double y_diff = std::abs(pin1->coordinate().y() - pin2->coordinate().y());
                if (y_diff > y_tolerance)
                { // Check if y difference is within tolerance
                    double x_offset = std::abs(pin1->coordinate().x() - pin2->coordinate().x());
                    if (x_offset > 0)
                    {
                        min_offset = std::min(min_offset, x_offset);
                    }
                }
            }
        }
    }
    double result = min_offset == std::numeric_limits<double>::max() ? 0.0 : min_offset;

    if (result == 0.0)
    {
        throw std::runtime_error("Error: No non-zero x offset found");
    }

    return result;
}

double Component::calculateTileHeight(double x_tolerance)
{
    // Tolerance is for x difference that is considered to be the same row
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1 != pin2)
            {
                double x_diff = std::abs(pin1->coordinate().x() - pin2->coordinate().x());
                if (x_diff > x_tolerance)
                { // Check if x difference is within tolerance
                    double y_offset = std::abs(pin1->coordinate().y() - pin2->coordinate().y());
                    if (y_offset > 0)
                    {
                        min_offset = std::min(min_offset, y_offset);
                    }
                }
            }
        }
    }

    double result = min_offset == std::numeric_limits<double>::max() ? 0.0 : min_offset;

    if (result == 0.0)
    {
        throw std::runtime_error("Error: No non-zero y offset found");
    }

    return result;
}
void Component::createPinArr()
{
    // Find the corner points of the component
    auto [bottom_left, top_right] = findBoundingBox();
    m_bottom_left = bottom_left;
    m_top_right = top_right;
    // Calculate the tile width and height
    double tile_width = calculateTileWidth();
    double tile_height = calculateTileHeight();
    m_tile_width = tile_width;
    m_tile_height = tile_height;

    // Calculate the number of rows and columns
    int rows = static_cast<int>(std::round((m_top_right.y() - m_bottom_left.y()) / tile_height)) + 1;
    int columns = static_cast<int>(std::round((m_top_right.x() - m_bottom_left.x()) / tile_width)) + 1;
    m_rows = rows;
    m_columns = columns;

    // Initialize the pin_arr
    m_pin_arr =
        std::vector<std::vector<std::shared_ptr<Pin>>>(rows, std::vector<std::shared_ptr<Pin>>(columns, nullptr));

    // Fill the pin_arr
    for (const auto &pin : m_pins)
    {
        int row = static_cast<int>(std::round((pin->coordinate().y() - m_bottom_left.y()) / tile_height));
        int column = static_cast<int>(std::round((pin->coordinate().x() - m_bottom_left.x()) / tile_width));
        m_pin_arr.at(row).at(column) = pin;
    }
#ifdef VERBOSE
    // Print component information
    // std::cout << "Component: " << m_comp_name << std::endl;
    // std::cout << "Bottom Left: " << m_bottom_left.x() << " " << m_bottom_left.y() << std::endl;
    // std::cout << "Top Right: " << m_top_right.x() << " " << m_top_right.y() << std::endl;
    // std::cout << "Tile Width: " << m_tile_width << std::endl;
    // std::cout << "Tile Height: " << m_tile_height << std::endl;
    // std::cout << std::endl;
#endif
}

void DataManager::createNetlist(int count)
{
    if (!m_netlists.count(count))
    {
        m_netlists[count] = Netlist();
    }
    else
    {
        throw std::runtime_error("Error: Netlist " + std::to_string(count) + " already exists");
    }
}
void DataManager::addCompPin(std::string comp_name, std::shared_ptr<Pin> pin)
{
    if (m_components.count(comp_name))
    {
        m_components[comp_name]->addPin(pin);
    }
    else
    {
        m_components[comp_name] = std::make_shared<Component>(comp_name);
    }
}
void DataManager::preprocess(int threshold)
{
    UnionFind uf;
    for (auto &comp_pair : m_components)
    {
        auto &comp = comp_pair.second;
        comp->createPinArr();
        for (auto &other_pair : m_components)
        {
            if (comp_pair.first != other_pair.first)
            {
                if (*comp_pair.second == *other_pair.second)
                {
                    uf.unite(comp_pair.second.get(), other_pair.second.get());
                }
            }
        }
    }
    for (auto &comp_pair : m_components)
    {
        m_groups[uf.find(comp_pair.second.get())].push_back(comp_pair.first);
    }
    // Grouping
    std::vector<Edge> edges;
    for (const auto &group : m_groups)
    {
        const auto &components = group.second;

        //  Check if it is a single component grouping
        if (components.size() == 1)
        {
            Component *singleComponent = m_components[components.front()].get();
            singleComponent->is_cpu() = true;
            // Add edges between single component and all other components
            for (const auto &other_group : m_groups)
            {
                if (other_group.first != group.first)
                { // Avoid connecting with itself
                    for (const auto &other_comp_key : other_group.second)
                    {
                        Component *otherComponent = m_components[other_comp_key].get();
                        edges.push_back({singleComponent,
                                         otherComponent,
                                         distanceBetweenComponent(singleComponent, otherComponent)});
                    }
                }
            }
        }
        else
        {
            // Normal processing of multiple component grouping
            for (size_t i = 0; i < components.size(); ++i)
            {
                for (size_t j = i + 1; j < components.size(); ++j)
                {
                    Component *a = m_components[components[i]].get();
                    Component *b = m_components[components[j]].get();
                    edges.push_back({a, b, distanceBetweenComponent(a, b)});
                }
            }
        }
    }
    std::vector<Edge> mst = kruskalMST(edges);
    // mst result
    for (const auto &edge : mst)
    {
        if (edge.a->is_cpu())
        {
            edge.b->neighboors().at(0) = true;
            edge.b->neighboors().at(1) = true;
            continue;
        }
        if (edge.b->is_cpu())
        {
            edge.a->neighboors().at(0) = true;
            edge.a->neighboors().at(1) = true;
            continue;
        }
        if (std::abs(std::ceil(edge.a->bottom_left().x()) - std::ceil(edge.b->bottom_left().x())) < threshold &&
            std::abs(std::ceil(edge.a->top_right().x()) - std::ceil(edge.b->top_right().x())) < threshold)
        {
            edge.a->is_verticle_stack() = true;
            edge.b->is_verticle_stack() = true;
            // who is on top
            if (edge.a->bottom_left().y() > edge.b->bottom_left().y())
            {
                // a is on top
                edge.a->neighboors().at(1) = true; // means a have bot neighboor
                edge.b->neighboors().at(0) = true; // means b have top neighboor
            }
            else
            {
                // b is on top
                edge.a->neighboors().at(0) = true; // means a have top neighboor
                edge.b->neighboors().at(1) = true; // means b have bot neighboor
            }
        }
        if (std::abs(std::ceil(edge.a->bottom_left().y()) - std::ceil(edge.b->bottom_left().y())) < threshold &&
            std::abs(std::ceil(edge.a->top_right().y()) - std::ceil(edge.b->top_right().y())) < threshold)
        {
            edge.a->is_verticle_stack() = false;
            edge.b->is_verticle_stack() = false;
            // who is on right
            if (edge.a->bottom_left().x() > edge.b->bottom_left().x())
            {
                // a is on right
                edge.a->neighboors().at(0) = true; // means a have left neighboor
                edge.b->neighboors().at(1) = true; // means b have right neighboor
            }
            else
            {
                // b is on right
                edge.a->neighboors().at(1) = true; // means a have right neighboor
                edge.b->neighboors().at(0) = true; // means b have left neighboor
            }
        }
    }
#ifdef VERBOSE
    // print mst result
    // for (const auto &edge : mst)
    // {
    //     std::cout << "Edge: " << edge.a->comp_name() << " " << edge.b->comp_name() << std::endl;
    // }
    // print out every component's information
    // for (const auto &comp_pair : m_components)
    // {
    //     std::cout << "Component: " << comp_pair.first << std::endl;
    //     std::cout << "Is CPU: " << comp_pair.second->is_cpu() << std::endl;
    //     std::cout << "Is Verticle Stack: " << comp_pair.second->is_verticle_stack() << std::endl;
    //     std::cout << "Neighboors: " << comp_pair.second->neighboors().at(0) << " "
    //               << comp_pair.second->neighboors().at(1) << std::endl;
    //     std::cout << std::endl;
    // }
#endif
}

void Router::DDR2DDR(std::shared_ptr<DataManager> data_manager)
{
    std::shared_ptr<GraphManager> graph_manager;
    for (auto comp_pair : data_manager->components())
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
            continue;
        int expand = 2;
        int maximum_layer = 3;
        do
        {
            graph_manager = std::make_shared<GraphManager>(*data_manager, *comp, expand++, maximum_layer);
            if (expand > 5)
            {
                maximum_layer++;
                expand = 0;
            }
        } while (graph_manager->minCostMaxFlow() != (long)comp->pins().size());
#ifdef VERBOSE
        std::cout << "DDR2DDR: " << comp->comp_name() << std::endl;
        std::cout << "expand = " << expand << std::endl;
        std::cout << "maximum_layer = " << maximum_layer << std::endl;
#endif
        graph_manager->DDR2DDR(*this);
    }
}

void Router::CPU2DDR(std::shared_ptr<DataManager> data_manager)
{
    std::shared_ptr<GraphManager> graph_manager;
    double wire_spacing = 4.8;
    double wire_width = 4.0;
    double bump_ball_radius = 7.5;
    std::string escape_boundry = "E";
    for (auto comp_pair : data_manager->components())
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
        {
            graph_manager = std::make_shared<GraphManager>(
                *data_manager, *comp, wire_spacing, wire_width, bump_ball_radius, escape_boundry);
#ifdef VERBOSE
            std::cout << "CPU2DDR: " << comp->comp_name() << std::endl;
            std::cout << "flow = " << graph_manager->minCostMaxFlow() << std::endl;
            std::cout << "#pins = " << (long)comp->pins().size() << std::endl;
            graph_manager->CPU2DDR(*this, escape_boundry);
#endif
        }
    }
}