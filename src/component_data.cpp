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
            edge.a->cpu_connected_components().push_back(edge.b);
            continue;
        }
        if (edge.b->is_cpu())
        {
            edge.a->neighboors().at(0) = true;
            edge.a->neighboors().at(1) = true;
            edge.b->cpu_connected_components().push_back(edge.a);
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
                edge.a->ddr_neighboors().at(1) = true; // means a have bot ddr neighboor
                edge.b->neighboors().at(0) = true; // means b have top neighboor
                edge.b->ddr_neighboors().at(0) = true; // means b have top ddr neighboor
            }
            else
            {
                // b is on top
                edge.a->neighboors().at(0) = true; // means a have top neighboor
                edge.a->ddr_neighboors().at(0) = true; // means a have top ddr neighboor
                edge.b->neighboors().at(1) = true; // means b have bot neighboor
                edge.b->ddr_neighboors().at(1) = true; // means b have bot ddr neighboor
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
                edge.a->ddr_neighboors().at(0) = true; // means a have left ddr neighboor
                edge.b->neighboors().at(1) = true; // means b have right neighboor
                edge.b->ddr_neighboors().at(1) = true; // means b have right ddr neighboor
            }
            else
            {
                // b is on right
                edge.a->neighboors().at(1) = true; // means a have right neighboor
                edge.a->ddr_neighboors().at(1) = true; // means a have right ddr neighboor
                edge.b->neighboors().at(0) = true; // means b have left neighboor
                edge.b->ddr_neighboors().at(0) = true; // means b have left ddr neighboor
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
    //     if (comp_pair.second->is_cpu())
    //     {
    //         std::cout << "CPU Connected Components: ";
    //         for (const auto &connected_comp : comp_pair.second->cpu_connected_components())
    //         {
    //             std::cout << connected_comp->comp_name() << " ";
    //         }
    //         std::cout << std::endl;
    //     }
    //     else
    //     {
    //         std::cout << "Component: " << comp_pair.first << std::endl;
    //         std::cout << "Is CPU: " << comp_pair.second->is_cpu() << std::endl;
    //         std::cout << "Is Verticle Stack: " << comp_pair.second->is_verticle_stack() << std::endl;
    //         std::cout << "Neighboors: " << comp_pair.second->neighboors().at(0) << " "
    //                   << comp_pair.second->neighboors().at(1) << std::endl;
    //         std::cout << std::endl;
    //     }
    // }
#endif
}
void DataManager::DDR2DDR()
{
    std::shared_ptr<GraphManager> graph_manager;
    for (auto comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
            continue;
        int expand = 2;
        int maximum_layer = 3;
        do
        {
            graph_manager = std::make_shared<GraphManager>();
            graph_manager->DDR2DDRInit(*this, *comp, expand++, maximum_layer);
            if (expand > 5)
            {
                maximum_layer++;
                expand = 0;
            }
        } while (graph_manager->minCostMaxFlow() != (long)comp->pins().size());
        comp->bounding_box() = graph_manager->DDR2DDR(comp->router());
    }
}
void DataManager::CPU2DDR()
{
    std::shared_ptr<GraphManager> graph_manager;
    double wire_spacing = 4.8;
    double wire_width = 4.0;
    double bump_ball_radius = 7.5;
    std::string escape_boundry = "W";
    for (auto comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
        {
            graph_manager = std::make_shared<GraphManager>();
            graph_manager->CPU2DDRInit(*this, *comp, wire_spacing, wire_width, bump_ball_radius, escape_boundry);
#ifdef VERBOSE
            std::cout << "CPU2DDR: " << comp->comp_name() << std::endl;
            std::cout << "flow = " << graph_manager->minCostMaxFlow() << std::endl;
            std::cout << "#pins = " << (long)comp->pins().size() << std::endl;
#endif
            // escape routing
            graph_manager->CPU2DDR(comp->router(), *comp, escape_boundry);
            comp->reducedBends();

            for (auto connected_comp : comp->cpu_connected_components())
            {
                if (connected_comp->is_verticle_stack())
                {
                    if (connected_comp->ddr_neighboors().at(0))
                    {
#ifdef VERBOSE
                        std::cout << connected_comp->comp_name() << " Escape from Bot to CPU" << std::endl;
#endif
                    }
                    else
                    {
#ifdef VERBOSE
                        std::cout << connected_comp->comp_name() << " Escape from Top to CPU" << std::endl;
#endif
                    }
                }
                else
                {
                    if (connected_comp->ddr_neighboors().at(0))
                    {
#ifdef VERBOSE
                        std::cout << connected_comp->comp_name() << " Escape from Right to CPU" << std::endl;
#endif
                    }
                    else
                    {
#ifdef VERBOSE
                        std::cout << connected_comp->comp_name() << " Escape from Left to CPU" << std::endl;
#endif
                    }
                }
            }
        }
    }
}

void Component::reducedBends()
{
    auto compareSlope = [](const Segment &seg1, const Segment &seg2, double epsilon = 1e-1) -> bool {
        double slope1 = seg1.slope();
        double slope2 = seg2.slope();

        // both are vertical lines
        if (std::isinf(slope1) && std::isinf(slope2))
        {
            return true;
        }

        // one is vertical and the other is not
        if (std::isinf(slope1) || std::isinf(slope2))
        {
            return false;
        }

        // otherwise, compare the slopes
        return std::fabs(slope1 - slope2) < epsilon;
    };
    for (auto &pin : m_pins)
    {
        int cnt = 0;
        // std::cout << "Pin: " << pin->net_name() << std::endl;
        // std::cout << "Coordinate: " << pin->coordinate().x() << " " << pin->coordinate().y() << std::endl;
        Coordinate cur;
        for (auto &s : m_router->segments())
        {
            Segment *seg = &s;
            if (seg->start() == pin->coordinate() || seg->end() == pin->coordinate())
            {
                cur = seg->start() == pin->coordinate() ? seg->end() : seg->start();
                cnt++;
            }
            else
                continue;
            bool keep_going = false;

            // ---merge the segments with the same slope---
            do
            {
                keep_going = false;
                for (auto &o_s : m_router->segments())
                {
                    Segment *other_seg = &o_s;
                    if (*seg != *other_seg)
                    {
                        if (other_seg->start() == cur || other_seg->end() == cur)
                        {
                            cur = other_seg->start() == cur ? other_seg->end() : other_seg->start();
                            keep_going = true;
                            if (compareSlope(*seg, *other_seg))
                            {
                                if (seg->start() == other_seg->start() || seg->start() == other_seg->end())
                                {
                                    seg->start() =
                                        seg->start() == other_seg->start() ? other_seg->end() : other_seg->start();
                                }
                                else if (seg->end() == other_seg->start() || seg->end() == other_seg->end())
                                {
                                    seg->end() =
                                        seg->end() == other_seg->start() ? other_seg->end() : other_seg->start();
                                }
                                other_seg->start() = Coordinate(-1, -1, -1);
                                other_seg->end() = Coordinate(-1, -1, -1);
                            }
                            else
                                seg = other_seg;
                            break;
                        }
                    }
                }
            } while (keep_going);
            // ---merge the segments with the same slope---
        }
        if (cnt > 1)
        {
            throw std::runtime_error("Error: Pin " + pin->net_name() + " have two connection");
        }
    }
    // remove empty segments
    m_router->segments().erase(std::remove_if(m_router->segments().begin(),
                                              m_router->segments().end(),
                                              [](const Segment &seg) { return seg.start() == Coordinate(-1, -1, -1); }),
                               m_router->segments().end());
    /*
    // remove bends
    for (auto &pin : m_pins)
    {
        std::cout << "Pin: " << pin->net_name() << std::endl;
        std::cout << "Coordinate: " << pin->coordinate().x() << " " << pin->coordinate().y() << std::endl;
        Coordinate cur;
        for (auto &s : m_router->segments())
        {
            Segment *seg = &s;
            if (seg->start() == pin->coordinate() || seg->end() == pin->coordinate())
            {
                cur = seg->start() == pin->coordinate() ? seg->end() : seg->start();
            }
            else
                continue;
            bool keep_going = false;
            std::vector<Segment *> vs;
            vs.push_back(seg);
            // ---merge the segments with the same slope---
            do
            {
                keep_going = false;
                if (vs.size() == 3)
                {
                    // vs[0] is not vertical or horizontal
                    if (vs[0]->slope() != 0.0 && !std::isinf(vs[0]->slope()))
                    {
                        if (vs[2]->slope() != 0.0 && !std::isinf(vs[2]->slope()))
                        {
                            double height = std::fabs(vs[2]->start().y() - vs[2]->end().y());
                            vs[2]->start().y() -= std::fabs(vs[1]->start().y() - vs[1]->end().y());
                            vs[2]->end().y() -= std::fabs(vs[1]->start().y() - vs[1]->end().y());

                            vs[1]->start().y() += height;
                            vs[1]->end().y() += height;
                            if (std::fabs(vs[0]->start().x() - vs[2]->start().x()) < 1e-5)
                            {
                                vs[1]->start().x() = vs[2]->end().x();
                                vs[1]->end().x() = vs[2]->end().x();
                                if (vs[2]->end().x() < std::max(vs[0]->start().x(), vs[0]->end().x()) &&
                                    vs[2]->end().x() > std::min(vs[0]->start().x(), vs[0]->end().x()))
                                {
                                    if (std::fabs(vs[1]->start().y() - vs[2]->end().y()) < 1e-5)
                                    {
                                        vs[1]->start().y() -= height;
                                    }
                                    else
                                    {
                                        vs[1]->end().y() -= height;
                                    }
                                    vs[0]->start().x() = vs[2]->end().x();
                                    vs[2]->start() = Coordinate(-1, -1, -1);
                                    vs[2]->end() = Coordinate(-1, -1, -1);
                                }
                            }
                            else if (std::fabs(vs[0]->start().x() - vs[2]->end().x()) < 1e-5)
                            {
                                vs[1]->start().x() = vs[2]->start().x();
                                vs[1]->end().x() = vs[2]->start().x();
                                if (vs[2]->start().x() < std::max(vs[0]->start().x(), vs[0]->end().x()) &&
                                    vs[2]->start().x() > std::min(vs[0]->start().x(), vs[0]->end().x()))
                                {
                                    if (std::fabs(vs[1]->start().y() - vs[2]->start().y()) < 1e-5)
                                    {
                                        vs[1]->start().y() -= height;
                                    }
                                    else
                                    {
                                        vs[1]->end().y() -= height;
                                    }
                                    vs[0]->start().x() = vs[2]->start().x();
                                    vs[2]->start() = Coordinate(-1, -1, -1);
                                    vs[2]->end() = Coordinate(-1, -1, -1);
                                }
                            }
                            else if (std::fabs(vs[0]->end().x() - vs[2]->start().x()) < 1e-5)
                            {
                                vs[1]->start().x() = vs[2]->end().x();
                                vs[1]->end().x() = vs[2]->end().x();
                                if (vs[2]->end().x() < std::max(vs[0]->start().x(), vs[0]->end().x()) &&
                                    vs[2]->end().x() > std::min(vs[0]->start().x(), vs[0]->end().x()))
                                {
                                    if (std::fabs(vs[1]->start().y() - vs[2]->end().y()) < 1e-5)
                                    {
                                        vs[1]->start().y() -= height;
                                    }
                                    else
                                    {
                                        vs[1]->end().y() -= height;
                                    }
                                    vs[0]->end().x() = vs[2]->end().x();
                                    vs[2]->start() = Coordinate(-1, -1, -1);
                                    vs[2]->end() = Coordinate(-1, -1, -1);
                                }
                            }
                            else if (std::fabs(vs[0]->end().x() - vs[2]->end().x()) < 1e-5)
                            {
                                vs[1]->start().x() = vs[2]->start().x();
                                vs[1]->end().x() = vs[2]->start().x();
                                if (vs[2]->start().x() < std::max(vs[0]->start().x(), vs[0]->end().x()) &&
                                    vs[2]->start().x() > std::min(vs[0]->start().x(), vs[0]->end().x()))
                                {
                                    if (std::fabs(vs[1]->start().y() - vs[2]->start().y()) < 1e-5)
                                    {
                                        vs[1]->start().y() -= height;
                                    }
                                    else
                                    {
                                        vs[1]->end().y() -= height;
                                    }
                                    vs[0]->end().x() = vs[2]->start().x();
                                    vs[2]->start() = Coordinate(-1, -1, -1);
                                    vs[2]->end() = Coordinate(-1, -1, -1);
                                }
                            }
                        }
                    }
                    break;
                }
                for (auto &o_s : m_router->segments())
                {
                    Segment *other_seg = &o_s;
                    if (*seg != *other_seg)
                    {
                        if (other_seg->start() == cur || other_seg->end() == cur)
                        {
                            cur = other_seg->start() == cur ? other_seg->end() : other_seg->start();
                            keep_going = true;
                            seg = other_seg;
                            break;
                        }
                    }
                }
                vs.push_back(seg);
            } while (keep_going);
            // ---merge the segments with the same slope---
        }
    }
    // remove empty segments
    m_router->segments().erase(std::remove_if(m_router->segments().begin(),
                                              m_router->segments().end(),
                                              [](const Segment &seg) { return seg.start() == Coordinate(-1, -1, -1); }),
                               m_router->segments().end());
    */
}