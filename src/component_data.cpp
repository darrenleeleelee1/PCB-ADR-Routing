#include "component_data.hpp"
#include "basic_ds.hpp"
#include "graph.hpp"
#include <cmath>
#include <fstream>
#include <limits>
#include <sstream>
#include <string>
#include <vector>
#ifdef VERBOSE
#include <iostream>
#endif

// Find the corner points of the component
std::vector<Coordinate> Component::findBoundingBox()
{
    std::vector<Coordinate> rectCorners;
    double left_most_x = std::numeric_limits<double>::max(), right_most_x = std::numeric_limits<double>::min();
    double top_most_y = std::numeric_limits<double>::min(), bottom_most_y = std::numeric_limits<double>::max();
    for (const auto &p : m_pins)
    {
        left_most_x = std::min(left_most_x, p->coordinate().x());
        right_most_x = std::max(right_most_x, p->coordinate().x());
        top_most_y = std::max(top_most_y, p->coordinate().y());
        bottom_most_y = std::min(bottom_most_y, p->coordinate().y());
    }

    rectCorners.push_back(Coordinate(left_most_x, bottom_most_y, 0));
    rectCorners.push_back(Coordinate(left_most_x, top_most_y, 0));
    rectCorners.push_back(Coordinate(right_most_x, top_most_y, 0));
    rectCorners.push_back(Coordinate(right_most_x, bottom_most_y, 0));

    return rectCorners;
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
    auto rectCorners = findBoundingBox();
    m_bottom_left = rectCorners[0];
    m_top_left = rectCorners[1];
    m_top_right = rectCorners[2];
    m_bottom_right = rectCorners[3];

    // Calculate the tile width and height
    m_tile_width = calculateTileWidth();
    m_tile_height = calculateTileHeight();

    // Calculate the number of rows and columns
    m_rows = static_cast<int>(std::round((m_top_right.y() - m_bottom_left.y()) / m_tile_height)) + 1;
    m_columns = static_cast<int>(std::round((m_top_right.x() - m_bottom_left.x()) / m_tile_width)) + 1;

    // Initialize the pin_arr
    m_pin_arr =
        std::vector<std::vector<std::shared_ptr<Pin>>>(m_rows, std::vector<std::shared_ptr<Pin>>(m_columns, nullptr));

    // Fill the pin_arr
    for (const auto &pin : m_pins)
    {
        int row = static_cast<int>(std::round((pin->coordinate().y() - m_bottom_left.y()) / m_tile_height));
        int column = static_cast<int>(std::round((pin->coordinate().x() - m_bottom_left.x()) / m_tile_width));
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
void Component::initializeAreaRouting()
{
    for (auto p : m_pins)
    {
        m_wire_on_boundary[p->net_name()] = std::vector<Coordinate>(4);
    }
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
        m_components[comp_name]->addPin(pin);
    }
}
void DataManager::preprocess(int threshold)
{
    for (auto &comp_pair : m_components)
    {
        auto &comp = comp_pair.second;
        comp->createPinArr();
    }
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
    double bump_ball_radius = 7.5;
    double flow;

    for (auto comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
        {
            graph_manager = std::make_shared<GraphManager>();
            graph_manager->CPU2DDRInit(
                *this, *comp, m_wire_spacing, m_wire_width, bump_ball_radius, m_cpu_escape_boundry);
            flow = graph_manager->minCostMaxFlow();
#ifdef VERBOSE
            // std::cout << "CPU2DDR: " << comp->comp_name() << std::endl;
            // std::cout << "flow = " << flow << std::endl;
            // std::cout << "#pins = " << (long)comp->pins().size() << std::endl;
#endif
            // escape routing
            graph_manager->CPU2DDR(comp->router(), *comp, m_cpu_escape_boundry);
            comp->reducedBends();

            for (auto connected_comp : comp->cpu_connected_components())
            {
                if (connected_comp->is_vertical_stack())
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
void DataManager::areaRouting(double height_of_diagonal)
{

    // lambda for add snaking wires
    auto addSnakingWire = [&](std::string peak_direction,
                              std::string go_direction,
                              std::shared_ptr<Router> area_router,
                              Coordinate start_point,
                              double l_dia,
                              double minimum_wirelength,
                              double h_sna,
                              int num_snakes) {
        if (peak_direction == "N")
        {
        }
        else if (peak_direction == "E")
        {
            if (go_direction == "N")
            {
                // go up
            }
            else if (go_direction == "S")
            {
                // go down
                int cnt = 0;
                Coordinate cur = start_point, next;
                while (cnt++ < num_snakes)
                {
                    next = Coordinate{cur.x(), cur.y() - minimum_wirelength, cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() + std::sqrt(l_dia), cur.y() - std::sqrt(l_dia), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() + h_sna, cur.y(), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() + std::sqrt(l_dia), cur.y() - std::sqrt(l_dia), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x(), cur.y() - minimum_wirelength, cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() - std::sqrt(l_dia), cur.y() - std::sqrt(l_dia), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() - h_sna, cur.y(), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                    next = Coordinate{cur.x() - std::sqrt(l_dia), cur.y() - std::sqrt(l_dia), cur.z()};
                    area_router->addSegment(Segment{cur, next});

                    cur = next;
                }
                return cur;
            }
        }
        else if (peak_direction == "S")
        {
        }
        else if (peak_direction == "W")
        {
        }
    };

    auto comp_pair = std::make_pair(m_components.at("U45"), m_components.at("U61"));
    std::vector<int> layers = {1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2};
    std::vector<int> orders = {5, 7, 2, 3, 4, 4, 8, 8, 6, 1, 6, 1, 7, 0, 2, 0, 5, 3};

    std::ifstream x_file("outputs/x_values.csv");
    std::ifstream s_file("outputs/s_values.csv");
    std::string line;
    std::vector<std::vector<double>> x;
    std::vector<std::vector<double>> s;

    while (std::getline(x_file, line))
    {
        std::vector<double> layerValues;
        std::stringstream ss(line);
        std::string value;

        while (std::getline(ss, value, ','))
        {
            layerValues.push_back(std::stod(value));
        }

        x.push_back(layerValues);
    }
    x_file.close();
    while (std::getline(s_file, line))
    {
        std::vector<double> layerValues;
        std::stringstream ss(line);
        std::string value;

        while (std::getline(ss, value, ','))
        {
            layerValues.push_back(std::stod(value));
        }

        s.push_back(layerValues);
    }
    s_file.close();

    int cnt = -1;
    for (auto p : comp_pair.first->pins())
    {
        cnt++;
        auto east_first = comp_pair.first->wire_on_boundary()[p->net_name()].at(1);
        auto east_second = comp_pair.second->wire_on_boundary()[p->net_name()].at(1);
        double first_offset = east_first.x() < east_second.x() ? east_second.x() - east_first.x() : 0;
        first_offset += height_of_diagonal;
        // CPU horizontal
        m_area_router->addSegment(
            Segment{east_first,
                    Coordinate{first_offset + east_first.x() + x.at(layers.at(cnt) - 1).at(orders.at(cnt)),
                               east_first.y(),
                               east_first.z()}});

        double secod_offset = east_second.x() < east_first.x() ? east_first.x() - east_second.x() : 0;
        // DDR horizontal
        m_area_router->addSegment(
            Segment{east_second,
                    Coordinate{secod_offset + east_second.x() + x.at(east_second.z() - 1).at(orders.at(cnt)),
                               east_second.y(),
                               east_second.z()}});
        m_area_router->addSegment(
            Segment{Coordinate{secod_offset + east_second.x() + x.at(east_second.z() - 1).at(orders.at(cnt)),
                               east_second.y(),
                               east_second.z()},
                    Coordinate{secod_offset + east_second.x() + x.at(east_second.z() - 1).at(orders.at(cnt)) +
                                   height_of_diagonal,
                               east_second.y() + height_of_diagonal,
                               east_second.z()}});
        // CPU to DDR
        m_area_router->addVia(
            Via{Coordinate{first_offset + east_first.x() + x.at(layers.at(cnt) - 1).at(orders.at(cnt)),
                           east_first.y(),
                           east_second.z()},
                east_first.z()});
        Coordinate cur = Coordinate{first_offset + east_first.x() + x.at(layers.at(cnt) - 1).at(orders.at(cnt)),
                                    east_first.y(),
                                    east_second.z()};
        cur = addSnakingWire(
            "E", "S", m_area_router, cur, 5.0, 5.0, 15.0, std::floor(s.at(layers.at(cnt) - 1).at(orders.at(cnt))));
        m_area_router->addSegment(
            Segment{cur,
                    Coordinate{secod_offset + east_second.x() + x.at(east_second.z() - 1).at(orders.at(cnt)) +
                                   height_of_diagonal,
                               east_second.y() + height_of_diagonal,
                               east_second.z()}});
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