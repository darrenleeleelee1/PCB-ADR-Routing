#include "component_data.hpp"
#include "basic_ds.hpp"
#include "graph.hpp"
#include "math.hpp"
#include <cmath>
#include <fstream>
#include <limits>
#include <sstream>
#include <string>
#include <vector>
#ifdef VERBOSE
#include <iostream>
#endif
// Float point comparison
bool deq(double a, double b, double epsilon = 1e-4)
{
    if (a == std::numeric_limits<double>::infinity() && b == std::numeric_limits<double>::infinity())
    {
        return true;
    }
    return std::abs(a - b) < epsilon;
}
// Find the corner points of the component
std::vector<Coordinate> Component::findBoundingBox()
{
    std::vector<Coordinate> rectCorners;
    double left_most_x = std::numeric_limits<double>::max(), right_most_x = std::numeric_limits<double>::lowest();
    double top_most_y = std::numeric_limits<double>::lowest(), bottom_most_y = std::numeric_limits<double>::max();
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
                if (y_diff <= y_tolerance)
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
    // Tolerance is for x difference that is considered to be the same column
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1 != pin2)
            {
                double x_diff = std::abs(pin1->coordinate().x() - pin2->coordinate().x());
                if (x_diff <= x_tolerance)
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

void Component::rotateComponentPins(bool clockwise)
{
    // rotate pins
    if (m_rotation_angle == 0)
    {
        return;
    }
    for (auto &pin : m_pins)
    {
        if (clockwise)
            pin->coordinate() = math::rotateCoordinate(pin->coordinate(), -m_rotation_angle);
        else
            pin->coordinate() = math::rotateCoordinate(pin->coordinate(), m_rotation_angle);
    }

    return;
}

void Component::rotateEscapePoints(bool clockwise)
{
    if (m_rotation_angle == 0)
    {
        return;
    }
    for (size_t i = 0; i < m_escape_points.size(); i++)
    {
        for (auto &p : m_escape_points.at(i))
        {
            if (clockwise)
                p.first = math::rotateCoordinate(p.first, -m_rotation_angle);
            else
                p.first = math::rotateCoordinate(p.first, m_rotation_angle);
        }
    }
}

void Component::rotateBoundingBox(bool clockwise)
{
    if (m_rotation_angle == 0)
    {
        return;
    }
    m_bottom_left = math::rotateCoordinate(m_bottom_left, clockwise ? -m_rotation_angle : m_rotation_angle);
    m_top_left = math::rotateCoordinate(m_top_left, clockwise ? -m_rotation_angle : m_rotation_angle);
    m_top_right = math::rotateCoordinate(m_top_right, clockwise ? -m_rotation_angle : m_rotation_angle);
    m_bottom_right = math::rotateCoordinate(m_bottom_right, clockwise ? -m_rotation_angle : m_rotation_angle);

    return;
}

void rotateSegment(Segment &segment, double angle)
{
    segment.start() = math::rotateCoordinate(segment.start(), angle);
    segment.end() = math::rotateCoordinate(segment.end(), angle);
}

void Component::rotateWires(bool clockwise)
{
    if (m_rotation_angle == 0)
    {
        return;
    }
    for (auto &segment : m_router->segments())
    {
        rotateSegment(segment, clockwise ? -m_rotation_angle : m_rotation_angle);
        // segment.start() = math::rotateCoordinate(segment.start(), clockwise ? -m_rotation_angle : m_rotation_angle);
        // segment.end() = math::rotateCoordinate(segment.end(), clockwise ? -m_rotation_angle : m_rotation_angle);
    }
    for (auto &via : m_router->vias())
    {
        via.coordinate() = math::rotateCoordinate(via.coordinate(), clockwise ? -m_rotation_angle : m_rotation_angle);
    }
    return;
}

void Component::rotateAll(bool clockwise)
{
    if (m_rotation_angle == 0)
    {
        return;
    }
    rotateComponentPins(clockwise);
    rotateEscapePoints(clockwise);
    rotateBoundingBox(clockwise);
    rotateWires(clockwise);
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
    // // Print component information
    // std::cout << "Component: " << m_comp_name << std::endl;
    // std::cout << "Bottom Left: " << m_bottom_left.x() << " " << m_bottom_left.y() << std::endl;
    // std::cout << "Top Right: " << m_top_right.x() << " " << m_top_right.y() << std::endl;
    // std::cout << "Tile Width: " << m_tile_width << std::endl;
    // std::cout << "Tile Height: " << m_tile_height << std::endl;
    // std::cout << std::endl;
#endif
}

void Component::calculateEscapePoints()
{
    if (m_is_cpu)
    {
        double boundary_point = 0;
        if (m_cpu_escape_boundry == "N")
        {
            boundary_point = m_top_right.y() + tile_height();
            for (auto &seg : m_router->segments())
            {
                if (deq(seg.start().y(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(0).emplace_back(seg.start(), seg.net_id());
                }
                else if (deq(seg.end().y(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(0).emplace_back(seg.end(), seg.net_id());
                }
            }
            // sort from left to right
            std::sort(m_cpu_escape_points.at(0).begin(), m_cpu_escape_points.at(0).end(), [](auto a, auto b) {
                return a.first.x() < b.first.x();
            });
        }
        else if (m_cpu_escape_boundry == "E")
        {
            boundary_point = m_top_right.x() + tile_width();
            for (auto &seg : m_router->segments())
            {
                if (deq(seg.start().x(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(1).emplace_back(seg.start(), seg.net_id());
                }
                else if (deq(seg.end().x(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(1).emplace_back(seg.end(), seg.net_id());
                }
            }
            // sort from top to bottom
            std::sort(m_cpu_escape_points.at(1).begin(), m_cpu_escape_points.at(1).end(), [](auto a, auto b) {
                return a.first.y() > b.first.y();
            });
        }
        else if (m_cpu_escape_boundry == "S")
        {
            boundary_point = m_bottom_left.y() - tile_height();
            for (auto &seg : m_router->segments())
            {
                if (deq(seg.start().y(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(2).emplace_back(seg.start(), seg.net_id());
                }
                else if (deq(seg.end().y(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(2).emplace_back(seg.end(), seg.net_id());
                }
            }
            // sort from right to left
            std::sort(m_cpu_escape_points.at(2).begin(), m_cpu_escape_points.at(2).end(), [](auto a, auto b) {
                return a.first.x() > b.first.x();
            });
        }
        else if (m_cpu_escape_boundry == "W")
        {
            boundary_point = m_bottom_left.x() - tile_width();
            for (auto &seg : m_router->segments())
            {
                if (deq(seg.start().x(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(3).emplace_back(seg.start(), seg.net_id());
                }
                else if (deq(seg.end().x(), boundary_point, 5e-1))
                {
                    m_cpu_escape_points.at(3).emplace_back(seg.end(), seg.net_id());
                }
            }
            // sort from bottom to top
            std::sort(m_cpu_escape_points.at(3).begin(), m_cpu_escape_points.at(3).end(), [](auto a, auto b) {
                return a.first.y() < b.first.y();
            });
        }
        else
        {
            throw std::runtime_error("Error: CPU escape boundry not found");
        }

#ifdef VERBOSE
        std::cout << "CPU escape boundry: " << m_cpu_escape_boundry << std::endl;
        std::cout << "Boundary point: " << boundary_point << std::endl;
        std::cout << "# Escape points N: " << m_cpu_escape_points.at(0).size() << std::endl;
        std::cout << "# Escape points E: " << m_cpu_escape_points.at(1).size() << std::endl;
        std::cout << "# Escape points S: " << m_cpu_escape_points.at(2).size() << std::endl;
        std::cout << "# Escape points W: " << m_cpu_escape_points.at(3).size() << std::endl;
#endif
        return;
    }
    // if not vertical stack
    if (!m_is_vertical_stack)
    {
        // sort components vias 1. layer increasing 2, y increasing
        std::sort(router()->vias().begin(), router()->vias().end(), [](Via v1, Via v2) {
            if (v1.layer() != v2.layer())
            {
                return v1.layer() < v2.layer();
            }
            return v1.coordinate().y() < v2.coordinate().y();
        });
        for (size_t i = 0; i < router()->vias().size(); i++)
        {
            Coordinate escape_point = Coordinate{router()->vias()[i].coordinate().x(),
                                                 router()->vias()[i].coordinate().y(),
                                                 router()->vias()[i].layer()};
            escape_point.y() -= 0.5 * tile_height();
            m_escape_points.at(0).emplace_back(Coordinate{wire_bound().at(0), escape_point.y(), escape_point.z()},
                                               router()->vias()[i].net_id());
            m_escape_points.at(1).emplace_back(Coordinate{wire_bound().at(1), escape_point.y(), escape_point.z()},
                                               router()->vias()[i].net_id());
        }
    }
    else
    {
        // sort components vias 1. layer increasing 2, x increasing
        std::sort(router()->vias().begin(), router()->vias().end(), [](Via v1, Via v2) {
            if (v1.layer() != v2.layer())
            {
                return v1.layer() < v2.layer();
            }
            return v1.coordinate().x() < v2.coordinate().x();
        });
        for (size_t i = 0; i < router()->vias().size(); i++)
        {
            Coordinate escape_point = Coordinate{router()->vias()[i].coordinate().x(),
                                                 router()->vias()[i].coordinate().y(),
                                                 router()->vias()[i].layer()};
            escape_point.x() -= 0.5 * tile_width();
            m_escape_points.at(0).emplace_back(Coordinate{escape_point.x(), wire_bound().at(0), escape_point.z()},
                                               router()->vias()[i].net_id());
            m_escape_points.at(1).emplace_back(Coordinate{escape_point.x(), wire_bound().at(1), escape_point.z()},
                                               router()->vias()[i].net_id());
        }
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

void DataManager::sumEscapeLength()
{
    for (auto comp_group : m_groups)
    {
        std::string group_name = comp_group.first;
        for (auto comp : comp_group.second)
        {
            for (auto s : comp->router()->segments())
            {
                int net_id = s.net_id();
                if (m_netlists.nets().at(net_id)->net_id() != net_id)
                {
                    throw std::runtime_error("Error: net_id does not match");
                }
                if (!m_netlists.nets().at(net_id)->group_escape_length().count(group_name))
                {
                    m_netlists.nets().at(net_id)->group_escape_length()[group_name] = 0.0;
                }
                m_netlists.nets().at(net_id)->group_escape_length()[group_name] += s.length();
            }
        }
    }
#ifdef VERBOSE
    // print a Group all net wirelength in increasing order
    for (auto group : m_groups)
    {
        std::cout << "Group: " << group.first << std::endl;
        std::vector<std::shared_ptr<Nets>> group_nets;
        // (wirelength, net_id)
        std::pair<double, int> shortest = std::make_pair(std::numeric_limits<double>::max(), -1);
        std::pair<double, int> longest = std::make_pair(std::numeric_limits<double>::lowest(), -1);
        for (auto net : m_netlists.nets())
        {
            if (net->group_escape_length().count(group.first))
            {
                group_nets.emplace_back(net);
            }
        }
        // lambda capture group
        sort(group_nets.begin(), group_nets.end(), [&group](std::shared_ptr<Nets> n1, std::shared_ptr<Nets> n2) {
            return n1->group_escape_length().at(group.first) < n2->group_escape_length().at(group.first);
        });
        // shortest and longest wirelength
        for (auto n : group_nets)
        {
            if (n->group_escape_length().at(group.first) < shortest.first)
            {
                shortest.first = n->group_escape_length().at(group.first);
                shortest.second = n->net_id();
            }
            if (n->group_escape_length().at(group.first) > longest.first)
            {
                longest.first = n->group_escape_length().at(group.first);
                longest.second = n->net_id();
            }
        }
        unordered_map<int, int> count; //  layer, ordercount
        for (auto n : group_nets)
        {
            std::cout << "Net ID: " << n->net_id() << " Wirelength: " << n->group_escape_length().at(group.first)
                      << " Layer: " << n->group_layer().at(group.first) << std::endl;
            if (!count.count(n->group_layer().at(group.first)))
            {
                count[n->group_layer().at(group.first)] = 0;
            }
            else
            {
                count[n->group_layer().at(group.first)]++;
            }
            m_group_escape_layer_order[group.first][n->net_id()] =
                std::make_pair(n->group_layer().at(group.first), count[n->group_layer().at(group.first)]);
        }
        // show m_group_escape_layer&order to check
        // for (auto n : m_group_escape_layer&order[group.first])
        // {
        //     std::cout << "Net ID: " << n.first << " Layer: " << n.second.first << " Order: " << n.second.second
        //               << std::endl;
        // }
        std::cout << "Shortest: " << shortest.first << " Net ID: " << shortest.second << std::endl;
        std::cout << "Longest: " << longest.first << " Net ID: " << longest.second << std::endl;
        std::cout << std::endl;
    }
#endif
}

void DataManager::storeGroupLayer()
{
    for (auto group : m_groups)
    {
        if (group.first == "CPU")
        {
            for (auto n : m_netlists.nets())
            {
                n->group_layer()["CPU"] = 0;
            }
        }
        std::string group_name = group.first;
        for (auto comp : group.second)
        {
            for (auto v : comp->router()->vias())
            {
                if (!m_netlists.nets().at(v.net_id())->group_layer().count(group_name))
                {
                    m_netlists.nets().at(v.net_id())->group_layer()[group_name] = v.layer();
                }
                else
                {
                    if (m_netlists.nets().at(v.net_id())->group_layer()[group_name] != v.layer())
                    {
                        throw std::runtime_error("Error: Same net different layer in the same group");
                    }
                }
            }
        }
    }
}

void DataManager::preprocess_ER()
{
    for (auto &comp_pair : m_components)
    {
        auto &comp = comp_pair.second;
        comp->rotateComponentPins(true);
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
        comp->router()->setViaNetId();
        comp->router()->setSegmentNetId();
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
            try
            {
                if (flow != (long)comp->pins().size())
                {
                    throw std::runtime_error("Error: CPU2DDR flow != #pins");
                }
            }
            catch (const std::runtime_error &e)
            {
#ifdef VERBOSE
                std::cout << e.what() << std::endl;
#endif
            }
        }
    }
}

void DataManager::postprocess_ER()
{
    for (auto comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        comp->calculateEscapePoints();
        comp->rotateAll(false);
    }
}

std::vector<std::pair<Coordinate, Coordinate>> connectDiagonal(Coordinate p1, Coordinate p2)
{
    int dx = p2.x() - p1.x();
    int dy = p2.y() - p1.y();

    std::vector<std::pair<Coordinate, Coordinate>> segments;
    Coordinate bend;

    if (std::abs(dx) < std::abs(dy))
    {
        if (p1.y() < p2.y())
        {
            bend = Coordinate{p1.x(), p1.y() + std::abs(dy) - std::abs(dx), p1.z()};
        }
        else
        {
            bend = Coordinate{p2.x(), p2.y() + std::abs(dy) - std::abs(dx), p2.z()};
        }
    }
    else
    {
        if (p1.x() < p2.x())
        {
            bend = Coordinate{p1.x() + std::abs(dx) - std::abs(dy), p1.y(), p1.z()};
        }
        else
        {
            bend = Coordinate{p2.x() + std::abs(dx) - std::abs(dy), p2.y(), p2.z()};
        }
    }
    segments.emplace_back(std::make_pair(p1, bend));
    segments.emplace_back(std::make_pair(bend, p2));

    return segments;
}

void DataManager::AreaRouting()
{
    // DDR2DDR area routing
    for (auto p : m_ddr2ddr_edges)
    {
        auto comp1 = m_components[p.first.first];
        auto comp2 = m_components[p.second.first];
        auto comp1_escape_points = comp1->escape_points().at(p.first.second == 'W' || p.first.second == 'N' ? 0 : 1);
        auto comp2_escape_points = comp2->escape_points().at(p.second.second == 'W' || p.second.second == 'N' ? 0 : 1);
        if (comp1_escape_points.size() != comp2_escape_points.size())
        {
            throw std::runtime_error("Error: DDR2DDR Area Routing number of escape points are not equal");
        }
        for (size_t i = 0; i < comp1_escape_points.size(); i++)
        {
            auto net_id1 = comp1_escape_points.at(i).second;
            auto net_id2 = comp2_escape_points.at(i).second;
            if (net_id1 != net_id2)
            {
                throw std::runtime_error("Error: DDR2DDR Area Routing via net_id not equal, " + comp1->comp_name() +
                                         " " + std::to_string(net_id1) + " " + comp2->comp_name() + " " +
                                         std::to_string(net_id2));
            }
            if (comp1_escape_points.at(i).first.z() != comp2_escape_points.at(i).first.z())
            {
                throw std::runtime_error("Error: DDR2DDR Area Routing via layer not equal");
            }
            auto escape_point1 = comp1_escape_points.at(i).first;
            auto escape_point2 = comp2_escape_points.at(i).first;
            Segment test_slope(escape_point1, escape_point2);
            // if is vertical or horizontal placement or 45 degree
            if (deq(test_slope.slope(), 0) || deq(test_slope.slope(), 1) ||
                deq(test_slope.slope(), std::numeric_limits<double>::infinity()))
            {

                m_area_router->addSegment(Segment(escape_point1, escape_point2, net_id1));
            }
            else
            {
                // if is diagonal placement, only can 45 degree in corner
                auto segments = connectDiagonal(escape_point1, escape_point2);
                for (auto s : segments)
                {
                    m_area_router->addSegment(Segment(s.first, s.second, net_id1));
                }
            }
        }
    }
    storeGroupLayer();
    sumEscapeLength();
    // cpu2ddr
    for (auto p : m_cpu2ddr_edges)
    {
        auto from_pair = std::get<0>(p); // 获取第一个组件对
        auto to_pair = std::get<1>(p); // 获取第二个组件对
        bool fly_by = std::get<2>(p);
        auto comp1 = m_components[from_pair.first];

        // cpu escape points
        // check m_cpu_escape_boundry is "N" or "E" or "S" or "W" to get the exact cpu_escape_points
        int cpu_escape_boundry_idx = -1;
        if (m_cpu_escape_boundry == "N")
        {
            cpu_escape_boundry_idx = 0;
        }
        else if (m_cpu_escape_boundry == "E")
        {
            cpu_escape_boundry_idx = 1;
        }
        else if (m_cpu_escape_boundry == "S")
        {
            cpu_escape_boundry_idx = 2;
        }
        else if (m_cpu_escape_boundry == "W")
        {
            cpu_escape_boundry_idx = 3;
        }
        auto cpu_escape_point = comp1->cpu_escape_points().at(cpu_escape_boundry_idx);
        // perserve for T, or FLy-by, now true for fly_by

        if (fly_by)
        {
            auto comp2 = m_components[to_pair.first];
            comp2->rotateAll(true);
            // find out which group contain the comp2
            std::string group_name;
            for (auto group : m_groups)
            {
                for (auto &v : group.second)
                {
                    if (v == comp2)
                    {
                        group_name = group.first;
                        break;
                    }
                }
            }
            // DDR expend
            if (to_pair.second == 'E')
            {
                if (from_pair.second == 'N' || from_pair.second == 'S')
                {
                    double y_bound_shift = 0;
                    // calcualte the y_bound shift
                    bool stop = false;
                    while (!stop)
                    {
                        stop = true;
                        for (auto &ep_pair : comp2->escape_points().at(1))
                        {
                            auto ep = ep_pair.first;
                            auto net_id = ep_pair.second;
                            double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                            double x_offset = y_bound - ep.y();
                            Segment diagonal_segment(ep, Coordinate{ep.x() + x_offset, y_bound, ep.z()}, net_id);
                            rotateSegment(diagonal_segment, comp2->rotation_angle());

                            Coordinate cpu_ep = Coordinate{0, 0, 0};
                            for (auto ep : cpu_escape_point)
                            {
                                if (ep.second == net_id)
                                {
                                    cpu_ep = ep.first;
                                    break;
                                }
                            }
                            try
                            {
                                if (cpu_ep == Coordinate{0, 0, 0})
                                {
                                    std::string error_message =
                                        "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                    throw std::runtime_error(error_message);
                                }
                            }
                            catch (const std::runtime_error &e)
                            {
                                continue;
                            }
                            bool find_extent_segment = true;
                            Segment extent_segment;
                            try
                            {
                                extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                                    45.0, std::numeric_limits<double>::quiet_NaN(), cpu_ep.y());
                            }
                            catch (const std::runtime_error &e)
                            {
                                find_extent_segment = false;
                            }
                            if (!find_extent_segment)
                                continue;
                            if ((m_cpu_escape_boundry == "W" && extent_segment.end().x() > cpu_ep.x()) ||
                                (m_cpu_escape_boundry == "E" && extent_segment.end().x() < cpu_ep.x()))
                            {
                                y_bound_shift += 10;
                                stop = false;
                                break;
                            }
                        }
                    }
                    // Digonal segment, extent segment and CPU extend to drill via
                    for (auto &ep_pair : comp2->escape_points().at(1))
                    {
                        auto ep = ep_pair.first;
                        auto net_id = ep_pair.second;
                        double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                        double x_offset = y_bound - ep.y();
                        Segment diagonal_segment(ep, Coordinate{ep.x() + x_offset, y_bound, ep.z()}, net_id);
                        rotateSegment(diagonal_segment, comp2->rotation_angle());
                        m_area_router->addSegment(diagonal_segment);

                        Coordinate cpu_ep = Coordinate{0, 0, 0};
                        for (auto ep : cpu_escape_point)
                        {
                            if (ep.second == net_id)
                            {
                                cpu_ep = ep.first;
                                break;
                            }
                        }
                        try
                        {
                            if (cpu_ep == Coordinate{0, 0, 0})
                            {
                                std::string error_message =
                                    "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                throw std::runtime_error(error_message);
                            }
                        }
                        catch (const std::runtime_error &e)
                        {
#ifdef VERBOSE
                            std::cout << e.what() << std::endl;
#endif
                            continue;
                        }

                        Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                            45.0, std::numeric_limits<double>::quiet_NaN(), cpu_ep.y());
                        m_area_router->addSegment(extent_segment);

                        Segment cpu_extend_to_drill_via(
                            cpu_ep, Coordinate{extent_segment.end().x(), extent_segment.end().y(), cpu_ep.z()}, net_id);
                        m_area_router->addSegment(cpu_extend_to_drill_via);
                        m_area_router->addVia(Via(extent_segment.end(), cpu_ep.z(), net_id));
                    }
                }
                else if (from_pair.second == 'W' || from_pair.second == 'E')
                {
                    double y_bound_shift = 0;
                    // calcualte the y_bound shift
                    bool stop = false;
                    while (!stop)
                    {
                        stop = true;
                        for (auto &ep_pair : comp2->escape_points().at(1))
                        {
                            auto ep = ep_pair.first;
                            auto net_id = ep_pair.second;
                            double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                            double x_offset = y_bound - ep.y();
                            Segment diagonal_segment(ep, Coordinate{ep.x() + x_offset, y_bound, ep.z()}, net_id);
                            rotateSegment(diagonal_segment, comp2->rotation_angle());

                            Coordinate cpu_ep = Coordinate{0, 0, 0};
                            for (auto ep : cpu_escape_point)
                            {
                                if (ep.second == net_id)
                                {
                                    cpu_ep = ep.first;
                                    break;
                                }
                            }
                            try
                            {
                                if (cpu_ep == Coordinate{0, 0, 0})
                                {
                                    std::string error_message =
                                        "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                    throw std::runtime_error(error_message);
                                }
                            }
                            catch (const std::runtime_error &e)
                            {
                                continue;
                            }

                            Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                                45.0, cpu_ep.x(), std::numeric_limits<double>::quiet_NaN());
                            // 算算看最後的線段有沒有超過cpu escape point，因為超過的話CPU escpae
                            // point就不可以延伸去接via
                            if ((m_cpu_escape_boundry == "N" && extent_segment.end().y() < cpu_ep.y()) ||
                                (m_cpu_escape_boundry == "S" && extent_segment.end().y() > cpu_ep.y()))
                            {
                                y_bound_shift += 10;
                                stop = false;
                                break;
                            }
                        }
                    }
                    // Digonal segment, extent segment and CPU extend to drill via
                    for (auto &ep_pair : comp2->escape_points().at(1))
                    {
                        auto ep = ep_pair.first;
                        auto net_id = ep_pair.second;
                        double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                        double x_offset = y_bound - ep.y();
                        Segment diagonal_segment(ep, Coordinate{ep.x() + x_offset, y_bound, ep.z()}, net_id);
                        rotateSegment(diagonal_segment, comp2->rotation_angle());
                        m_area_router->addSegment(diagonal_segment);

                        Coordinate cpu_ep = Coordinate{0, 0, 0};
                        for (auto ep : cpu_escape_point)
                        {
                            if (ep.second == net_id)
                            {
                                cpu_ep = ep.first;
                                break;
                            }
                        }
                        try
                        {
                            if (cpu_ep == Coordinate{0, 0, 0})
                            {
                                std::string error_message =
                                    "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                throw std::runtime_error(error_message);
                            }
                        }
                        catch (const std::runtime_error &e)
                        {
#ifdef VERBOSE
                            std::cout << e.what() << std::endl;
#endif
                            continue;
                        }

                        Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                            45.0, cpu_ep.x(), std::numeric_limits<double>::quiet_NaN());
                        m_area_router->addSegment(extent_segment);

                        Segment cpu_extend_to_drill_via(
                            cpu_ep, Coordinate{extent_segment.end().x(), extent_segment.end().y(), cpu_ep.z()}, net_id);
                        m_area_router->addSegment(cpu_extend_to_drill_via);
                        m_area_router->addVia(Via(extent_segment.end(), cpu_ep.z(), net_id));
                    }
                }
            }
            else if (to_pair.second == 'W')
            {
                if (from_pair.second == 'N' || from_pair.second == 'S')
                {
                    double y_bound_shift = 0;
                    // calcualte the y_bound shift
                    bool stop = false;
                    while (!stop)
                    {
                        stop = true;
                        for (auto &ep_pair : comp2->escape_points().at(0))
                        {
                            auto ep = ep_pair.first;
                            auto net_id = ep_pair.second;
                            double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                            double x_offset = y_bound - ep.y();
                            Segment diagonal_segment(ep, Coordinate{ep.x() - x_offset, y_bound, ep.z()}, net_id);
                            rotateSegment(diagonal_segment, comp2->rotation_angle());

                            Coordinate cpu_ep = Coordinate{0, 0, 0};
                            for (auto ep : cpu_escape_point)
                            {
                                if (ep.second == net_id)
                                {
                                    cpu_ep = ep.first;
                                    break;
                                }
                            }
                            try
                            {
                                if (cpu_ep == Coordinate{0, 0, 0})
                                {
                                    std::string error_message =
                                        "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                    throw std::runtime_error(error_message);
                                }
                            }
                            catch (const std::runtime_error &e)
                            {
                                continue;
                            }
                            bool find_extent_segment = true;
                            Segment extent_segment;
                            try
                            {
                                extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                                    -45.0, std::numeric_limits<double>::quiet_NaN(), cpu_ep.y());
                            }
                            catch (const std::invalid_argument &e)
                            {
                                find_extent_segment = false;
                            }
                            if (!find_extent_segment)
                                continue;
                            if (extent_segment.end().x() < cpu_ep.x())
                            {
                                y_bound_shift += 10;
                                stop = false;
                                break;
                            }
                        }
                    }
                    // Digonal segment, extent segment and CPU extend to drill via
                    for (auto &ep_pair : comp2->escape_points().at(0))
                    {
                        auto ep = ep_pair.first;
                        auto net_id = ep_pair.second;
                        double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                        double x_offset = y_bound - ep.y();
                        Segment diagonal_segment(ep, Coordinate{ep.x() - x_offset, y_bound, ep.z()}, net_id);
                        rotateSegment(diagonal_segment, comp2->rotation_angle());
                        m_area_router->addSegment(diagonal_segment);

                        Coordinate cpu_ep = Coordinate{0, 0, 0};
                        for (auto ep : cpu_escape_point)
                        {
                            if (ep.second == net_id)
                            {
                                cpu_ep = ep.first;
                                break;
                            }
                        }
                        try
                        {
                            if (cpu_ep == Coordinate{0, 0, 0})
                            {
                                std::string error_message =
                                    "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                throw std::runtime_error(error_message);
                            }
                        }
                        catch (const std::runtime_error &e)
                        {
#ifdef VERBOSE
                            std::cout << e.what() << std::endl;
#endif
                            continue;
                        }

                        // Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                        //     -45.0,
                        //     std::numeric_limits<double>::quiet_NaN(), // Explicitly pass the default NaN value for
                        //                                               // target_x
                        //     cpu_ep.y() // Pass the desired value for target_y
                        // );
                        // m_area_router->addSegment(extent_segment);

                        // Segment cpu_extend_to_drill_via(
                        //     cpu_ep, Coordinate{extent_segment.end().x(), extent_segment.end().y(), cpu_ep.z()},
                        //     net_id);
                        // m_area_router->addSegment(cpu_extend_to_drill_via);
                        // m_area_router->addVia(Via(extent_segment.end(), cpu_ep.z(), net_id));
                    }
                }
                else if (from_pair.second == 'W' || from_pair.second == 'E')
                {
                    double y_bound_shift = 0;
                    // calcualte the y_bound shift
                    bool stop = false;
                    while (!stop)
                    {
                        stop = true;
                        for (auto &ep_pair : comp2->escape_points().at(0))
                        {
                            auto ep = ep_pair.first;
                            auto net_id = ep_pair.second;
                            double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                            double x_offset = y_bound - ep.y();
                            Segment diagonal_segment(ep, Coordinate{ep.x() - x_offset, y_bound, ep.z()}, net_id);
                            rotateSegment(diagonal_segment, comp2->rotation_angle());

                            Coordinate cpu_ep = Coordinate{0, 0, 0};
                            for (auto ep : cpu_escape_point)
                            {
                                if (ep.second == net_id)
                                {
                                    cpu_ep = ep.first;
                                    break;
                                }
                            }
                            try
                            {
                                if (cpu_ep == Coordinate{0, 0, 0})
                                {
                                    std::string error_message =
                                        "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                    throw std::runtime_error(error_message);
                                }
                            }
                            catch (const std::runtime_error &e)
                            {
                                continue;
                            }

                            Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                                -45.0, cpu_ep.x(), std::numeric_limits<double>::quiet_NaN());
                            if (m_cpu_escape_boundry == "N" && extent_segment.end().y() < cpu_ep.y())
                            {
                                y_bound_shift += 10;
                                stop = false;
                                break;
                            }
                            else if (m_cpu_escape_boundry == "S" && extent_segment.end().y() > cpu_ep.y())
                            {
                                y_bound_shift += 10;
                                stop = false;
                                break;
                            }
                        }
                    }
                    // Digonal segment, extent segment and CPU extend to drill via
                    for (auto &ep_pair : comp2->escape_points().at(0))
                    {
                        auto ep = ep_pair.first;
                        auto net_id = ep_pair.second;
                        double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                        double x_offset = y_bound - ep.y();
                        Segment diagonal_segment(ep, Coordinate{ep.x() - x_offset, y_bound, ep.z()}, net_id);
                        rotateSegment(diagonal_segment, comp2->rotation_angle());
                        m_area_router->addSegment(diagonal_segment);

                        Coordinate cpu_ep = Coordinate{0, 0, 0};
                        for (auto ep : cpu_escape_point)
                        {
                            if (ep.second == net_id)
                            {
                                cpu_ep = ep.first;
                                break;
                            }
                        }
                        try
                        {
                            if (cpu_ep == Coordinate{0, 0, 0})
                            {
                                std::string error_message =
                                    "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
                                throw std::runtime_error(error_message);
                            }
                        }
                        catch (const std::runtime_error &e)
                        {
#ifdef VERBOSE
                            std::cout << e.what() << std::endl;
#endif
                            continue;
                        }

                        Segment extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                            -45.0, cpu_ep.x(), std::numeric_limits<double>::quiet_NaN());
                        m_area_router->addSegment(extent_segment);

                        Segment cpu_extend_to_drill_via(
                            cpu_ep, Coordinate{extent_segment.end().x(), extent_segment.end().y(), cpu_ep.z()}, net_id);
                        m_area_router->addSegment(cpu_extend_to_drill_via);
                        m_area_router->addVia(Via(extent_segment.end(), cpu_ep.z(), net_id));
                    }
                }
            }
            comp2->rotateAll(false);
        }
        else
        {
            // comp2 is ddr2dde_edge idx
            auto ddr2ddr_edge = m_ddr2ddr_edges.at(std::stoi(to_pair.first));
            auto comp2 = m_components[ddr2ddr_edge.first.first];
            auto comp3 = m_components[ddr2ddr_edge.second.first];

            double area_wire_top_y =
                std::max(comp2->escape_points().at(1).at(0).first.y(), comp3->escape_points().at(0).at(0).first.y());
            double area_wire_bottom_y =
                std::min(comp2->escape_points().at(1).at(0).first.y(), comp3->escape_points().at(0).at(0).first.y());
            // find comp2 in which group
            std::string group_name;
            for (auto group : m_groups)
            {
                for (auto &v : group.second)
                {
                    if (v == comp2)
                    {
                        group_name = group.first;
                        break;
                    }
                }
            }
            // find out the segment between comp2 and comp3 in m_area_router
            std::vector<Segment> segments;
            if (ddr2ddr_edge.first.second == 'E' && ddr2ddr_edge.second.second == 'W')
            {
                for (auto &s : m_area_router->segments())
                {
                    if (s.start().y() <= area_wire_top_y && s.end().y() >= area_wire_bottom_y)
                    {
                        segments.push_back(s);
                    }
                }
            }
            // find out CPU the escape_points in group_name
            std::vector<std::pair<Coordinate, int>> cpu_group_escape_points;
            for (auto &ep : cpu_escape_point)
            {
                if (m_groups_nets[group_name].count(ep.second))
                {
                    cpu_group_escape_points.push_back(ep);
                }
            }
            double area_wirelength = 0;
            double wire_spacing = 0;
            if (from_pair.second == 'W')
            {
                // from_pair.second == 'W', order is from bottom to top
                area_wirelength = area_wire_top_y - area_wire_bottom_y;
                wire_spacing = (comp1->tile_height() / 2) * std::sqrt(2);
                while (ceil(area_wirelength / wire_spacing) < cpu_group_escape_points.size())
                {
                    wire_spacing -= 1.0;
                    if (wire_spacing < (m_wire_spacing + m_wire_width))
                    {
                        throw std::runtime_error("Error: wire_spacing < m_wire_spacing + m_wire_width");
                    }
                }
                double start_y = (area_wirelength - (cpu_group_escape_points.size() - 1) * wire_spacing) / 2;
                double current_y = start_y + area_wire_bottom_y;
                double current_x = 0.0;
                double cpu_x_shift = 0.0, cpu_x_increment = 5.0;
                if (current_y < cpu_group_escape_points.at(0).first.y())
                {
                    cpu_x_shift = 0.0;
                    cpu_x_increment = 5.0;
                }
                else
                {
                    cpu_x_shift = cpu_x_increment * (cpu_group_escape_points.size() - 1);
                    cpu_x_increment = -5.0;
                }
                // find segments include current_y and net_id
                for (auto &cgep : cpu_group_escape_points)
                {
                    for (auto &s : segments)
                    {
                        if (s.isInclude(std::numeric_limits<double>::quiet_NaN(), current_y) &&
                            s.net_id() == cgep.second)
                        {
                            current_x = s.findCoordinate(std::numeric_limits<double>::quiet_NaN(), current_y);
                            break;
                        }
                    }
                    for (auto &s : comp1->router()->segments())
                    {
                        if (s.isOverlap(cgep.first))
                        {
                            double rotate_angle = 0;
                            bool from_end = s.end() == cgep.first;
                            if (from_end)
                            {
                                s.end().x() -= cpu_x_shift;
                                cpu_x_shift += cpu_x_increment;
                            }
                            else
                            {
                                s.start().x() -= cpu_x_shift;
                                cpu_x_shift += cpu_x_increment;
                            }
                            if (cgep.first.y() > current_y)
                            {
                                rotate_angle = -135;
                            }
                            else
                            {
                                rotate_angle = 135;
                            }
                            Segment diagonal_segment = s.createExtendedSegmentByDegree(
                                rotate_angle, std::numeric_limits<double>::quiet_NaN(), current_y, from_end);
                            m_area_router->addSegment(diagonal_segment);
                            Segment extent_segment(
                                Coordinate{current_x, current_y, 0}, diagonal_segment.end(), s.net_id());
                            m_area_router->addSegment(extent_segment);
                        }
                    }
                    current_y += wire_spacing;
                }
            }
            int debug = 0;
        }
    }
}

void Router::addSegment(Segment segment)
{
    m_segments.push_back(segment); // add new segment
    bool merged = true;
    while (merged)
    {
        merged = false;
        for (auto &s : m_segments)
        {
            for (auto &other_s : m_segments)
            {
                if (s == other_s)
                    continue;
                double diagonal_factor = 0.25;
                double daigonal_short_segments = 30.0;
                if (s.start().isCloseTo(other_s.start()))
                {
                    if (fabs(s.slope() - other_s.slope()) > 5e-1)
                    {
                        other_s.net_id() = std::max(other_s.net_id(), s.net_id());

                        // 如果兩條線垂直(slope相乘等於-1), 連接的部分必須變成45度, s.start() 和 other_s.start() 連接
                        if (s.slope() == std::numeric_limits<double>::infinity() && deq(other_s.slope(), 0))
                        {
                            if (s.start().y() > s.end().y())
                            {
                                s.start().y() = s.start().y() - diagonal_factor * daigonal_short_segments;
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * daigonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * daigonal_short_segments;
                                }
                                Segment diagonal(s.start(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                s.start().y() = s.start().y() + diagonal_factor * daigonal_short_segments;
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * daigonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * daigonal_short_segments;
                                }
                                Segment diagonal(s.start(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        else if (other_s.slope() == std::numeric_limits<double>::infinity() && deq(s.slope(), 0))
                        {
                            if (other_s.start().y() > other_s.end().y())
                            {
                                other_s.start().y() =
                                    other_s.start().y() -
                                    diagonal_factor * (std::fabs(other_s.start().y() - other_s.end().y()));
                                if (s.start().x() > s.end().x())
                                {
                                    s.start().x() =
                                        s.start().x() - diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                else
                                {
                                    s.start().x() =
                                        s.start().x() + diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                Segment diagonal(s.start(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                other_s.start().y() =
                                    other_s.start().y() +
                                    diagonal_factor * (std::fabs(other_s.start().y() - other_s.end().y()));
                                if (s.start().x() > s.end().x())
                                {
                                    s.start().x() =
                                        s.start().x() - diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                else
                                {
                                    s.start().x() =
                                        s.start().x() + diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                Segment diagonal(s.start(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        continue;
                    }
                    s.start() = other_s.end(); // update start point
                    s.net_id() = std::max(s.net_id(), other_s.net_id());
                    other_s.start() = Coordinate(-1, -1, -1);
                    other_s.end() = Coordinate(-1, -1, -1);
                    merged = true;
                    break;
                }
                else if (s.end().isCloseTo(other_s.start()))
                {
                    if (fabs(s.slope() - other_s.slope()) > 5e-1)
                    {
                        other_s.net_id() = std::max(other_s.net_id(), s.net_id());

                        // 如果兩條線垂直(slope相乘等於-1), 連接的部分必須變成45度, s.end() 和 other_s.start() 連接
                        if (s.slope() == std::numeric_limits<double>::infinity() && deq(other_s.slope(), 0))
                        {
                            if (s.end().y() > s.start().y())
                            {
                                s.end().y() = s.end().y() - diagonal_factor * (std::fabs(s.end().y() - s.start().y()));
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * daigonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * daigonal_short_segments;
                                }
                                Segment diagonal(s.end(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                s.end().y() = s.end().y() + diagonal_factor * (std::fabs(s.end().y() - s.start().y()));
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * daigonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * daigonal_short_segments;
                                }
                                Segment diagonal(s.end(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        else if (other_s.slope() == std::numeric_limits<double>::infinity() && deq(s.slope(), 0))
                        {
                            if (other_s.start().y() > other_s.end().y())
                            {
                                other_s.start().y() =
                                    other_s.start().y() -
                                    diagonal_factor * (std::fabs(other_s.start().y() - other_s.end().y()));
                                if (s.end().x() > s.start().x())
                                {
                                    s.end().x() =
                                        s.end().x() - diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                else
                                {
                                    s.end().x() =
                                        s.end().x() + diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                other_s.start().y() =
                                    other_s.start().y() +
                                    diagonal_factor * (std::fabs(other_s.start().y() - other_s.end().y()));
                                if (s.end().x() > s.start().x())
                                {
                                    s.end().x() =
                                        s.end().x() - diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                else
                                {
                                    s.end().x() =
                                        s.end().x() + diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }

                        continue;
                    }
                    s.end() = other_s.end(); // extend end point
                    merged = true;
                    s.net_id() = std::max(s.net_id(), other_s.net_id());
                    other_s.start() = Coordinate(-1, -1, -1);
                    other_s.end() = Coordinate(-1, -1, -1);
                    break;
                }
                else if (s.start().isCloseTo(other_s.end()))
                {
                    if (fabs(s.slope() - other_s.slope()) > 5e-1)
                    {
                        other_s.net_id() = std::max(other_s.net_id(), s.net_id());
                        // 如果兩條線垂直(slope相乘等於-1), 連接的部分必須變成45度, s.start() 和 other_s.end() 連接
                        if (s.slope() == std::numeric_limits<double>::infinity() && deq(other_s.slope(), 0))
                        {
                            if (s.start().y() > s.end().y())
                            {
                                s.start().y() = s.start().y() - diagonal_factor * daigonal_short_segments;
                                if (other_s.end().x() > other_s.start().x())
                                {
                                    other_s.end().x() =
                                        other_s.end().x() -
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                else
                                {
                                    other_s.end().x() =
                                        other_s.end().x() +
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                Segment diagonal(s.start(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                s.start().y() = s.start().y() + diagonal_factor * daigonal_short_segments;
                                if (other_s.end().x() > other_s.start().x())
                                {
                                    other_s.end().x() =
                                        other_s.end().x() -
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                else
                                {
                                    other_s.end().x() =
                                        other_s.end().x() +
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                Segment diagonal(s.start(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        else if (other_s.slope() == std::numeric_limits<double>::infinity() && deq(s.slope(), 0))
                        {
                            if (other_s.end().y() > other_s.start().y())
                            {
                                other_s.end().y() =
                                    other_s.end().y() -
                                    diagonal_factor * (std::fabs(other_s.end().y() - other_s.start().y()));
                                if (s.start().x() > s.end().x())
                                {
                                    s.start().x() =
                                        s.start().x() - diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                else
                                {
                                    s.start().x() =
                                        s.start().x() + diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                Segment diagonal(s.start(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                other_s.end().y() =
                                    other_s.end().y() +
                                    diagonal_factor * (std::fabs(other_s.end().y() - other_s.start().y()));
                                if (s.start().x() > s.end().x())
                                {
                                    s.start().x() =
                                        s.start().x() - diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                else
                                {
                                    s.start().x() =
                                        s.start().x() + diagonal_factor * (std::fabs(s.start().x() - s.end().x()));
                                }
                                Segment diagonal(s.start(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }

                        continue;
                    }
                    s.start() = other_s.start(); // update start point
                    merged = true;
                    s.net_id() = std::max(s.net_id(), other_s.net_id());
                    other_s.start() = Coordinate(-1, -1, -1);
                    other_s.end() = Coordinate(-1, -1, -1);
                    break;
                }
                else if (s.end().isCloseTo(other_s.end()))
                {
                    if (fabs(s.slope() - other_s.slope()) > 5e-1)
                    {
                        other_s.net_id() = std::max(other_s.net_id(), s.net_id());
                        // 如果兩條線垂直(slope相乘等於-1), 連接的部分必須變成45度, s.end() 和 other_s.end() 連接
                        if (s.slope() == std::numeric_limits<double>::infinity() && deq(other_s.slope(), 0))
                        {
                            if (s.end().y() > s.start().y())
                            {
                                s.end().y() = s.end().y() - diagonal_factor * (std::fabs(s.end().y() - s.start().y()));
                                if (other_s.end().x() > other_s.start().x())
                                {
                                    other_s.end().x() =
                                        other_s.end().x() -
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                else
                                {
                                    other_s.end().x() =
                                        other_s.end().x() +
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                s.end().y() = s.end().y() + diagonal_factor * (std::fabs(s.end().y() - s.start().y()));
                                if (other_s.end().x() > other_s.start().x())
                                {
                                    other_s.end().x() =
                                        other_s.end().x() -
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                else
                                {
                                    other_s.end().x() =
                                        other_s.end().x() +
                                        diagonal_factor * (std::fabs(other_s.end().x() - other_s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        else if (other_s.slope() == std::numeric_limits<double>::infinity() && deq(s.slope(), 0))
                        {
                            if (other_s.end().y() > other_s.start().y())
                            {
                                other_s.end().y() =
                                    other_s.end().y() -
                                    diagonal_factor * (std::fabs(other_s.end().y() - other_s.start().y()));
                                if (s.end().x() > s.start().x())
                                {
                                    s.end().x() =
                                        s.end().x() - diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                else
                                {
                                    s.end().x() =
                                        s.end().x() + diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                other_s.end().y() =
                                    other_s.end().y() +
                                    diagonal_factor * (std::fabs(other_s.end().y() - other_s.start().y()));
                                if (s.end().x() > s.start().x())
                                {
                                    s.end().x() =
                                        s.end().x() - diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                else
                                {
                                    s.end().x() =
                                        s.end().x() + diagonal_factor * (std::fabs(s.end().x() - s.start().x()));
                                }
                                Segment diagonal(s.end(), other_s.end(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                        }
                        continue;
                    }
                    s.end() = other_s.start(); // extend end point
                    merged = true;
                    s.net_id() = std::max(s.net_id(), other_s.net_id());
                    other_s.start() = Coordinate(-1, -1, -1);
                    other_s.end() = Coordinate(-1, -1, -1);
                    break;
                }
                if (merged)
                    break;
            }
        }
    }
    // remove empty segments
    m_segments.erase(std::remove_if(m_segments.begin(),
                                    m_segments.end(),
                                    [](const Segment &seg) { return seg.start() == Coordinate(-1, -1, -1); }),
                     m_segments.end());
}

void Router::setViaNetId()
{
    // find overlap with which segments then update the net_id
    for (auto &v : m_vias)
    {
        for (auto &seg : m_segments)
        {
            if (seg.isOverlap(v))
            {
                v.net_id() = std::max(seg.net_id(), v.net_id());
                break;
            }
        }
    }
}

void Router::setSegmentNetId()
{
    for (auto &seg : m_segments)
    {

        for (auto &v : m_vias)
        {
            if (seg.isOverlap(v))
            {
                if (seg.net_id() != -1 && seg.net_id() != v.net_id())
                {
                    throw std::runtime_error("Error: Segment net_id != Via net_id");
                }
                seg.net_id() = std::max(seg.net_id(), v.net_id());
            }
        }
    }
    // // set overlapping segments to the same net_id
    for (auto &seg : m_segments)
    {
        for (auto &other_seg : m_segments)
        {
            if (seg == other_seg)
                continue;
            if (seg.isOverlap(other_seg.start()) || seg.isOverlap(other_seg.end()))
            {
                seg.net_id() = std::max(seg.net_id(), other_seg.net_id());
            }
        }
    }
}