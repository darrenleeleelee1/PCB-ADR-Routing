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

void Component::rotateWires(bool clockwise)
{
    if (m_rotation_angle == 0)
    {
        return;
    }
    for (auto &segment : m_router->segments())
    {
        segment.start() = math::rotateCoordinate(segment.start(), clockwise ? -m_rotation_angle : m_rotation_angle);
        segment.end() = math::rotateCoordinate(segment.end(), clockwise ? -m_rotation_angle : m_rotation_angle);
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
    // Print component information
    std::cout << "Component: " << m_comp_name << std::endl;
    std::cout << "Bottom Left: " << m_bottom_left.x() << " " << m_bottom_left.y() << std::endl;
    std::cout << "Top Right: " << m_top_right.x() << " " << m_top_right.y() << std::endl;
    std::cout << "Tile Width: " << m_tile_width << std::endl;
    std::cout << "Tile Height: " << m_tile_height << std::endl;
    std::cout << std::endl;
#endif
}

void Component::calculateEscapePoints()
{
    if (m_is_cpu) {
        

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
    // for (auto net : m_netlists.nets())
    // {
    //     std::cout << "Net: " << net->net_id() << std::endl;
    //     for (auto group : net->group_escape_length())
    //     {
    //         std::cout << "Group: " << group.first << " Escape Length: " << group.second << std::endl;
    //     }
    // }
#endif
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
                // not doing anything right now
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
            auto escape_point1 = comp1_escape_points.at(i).first;
            auto escape_point2 = comp2_escape_points.at(i).first;
            m_area_router->addSegment(Segment(escape_point1, escape_point2, net_id1));
        }
    }
    sumEscapeLength();
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
                if (s.start().isCloseTo(other_s.start()))
                {
                    if (fabs(s.slope() - other_s.slope()) > 5e-1)
                    {
                        other_s.net_id() = std::max(other_s.net_id(), s.net_id());
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