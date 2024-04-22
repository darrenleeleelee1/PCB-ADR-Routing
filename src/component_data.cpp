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
    for (auto net : m_netlists.nets())
    {
        std::cout << "Net: " << net->net_id() << std::endl;
        for (auto group : net->group_escape_length())
        {
            std::cout << "Group: " << group.first << " Escape Length: " << group.second << std::endl;
        }
    }
#endif
}

void DataManager::preprocess()
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

void DataManager::AreaRouting() { sumEscapeLength(); }

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
            if (seg.start().z() == 1)
            {
                if (seg.start().x() >= 4875 && seg.start().x() <= 4907)
                {
                    if (seg.start().y() >= 2784 && seg.start().y() <= 2787)
                    {
                        if (v.net_id() == 4)
                        {
                            int debug = 0;
                        }
                    }
                }
            }
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