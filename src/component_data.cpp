#include "component_data.hpp"
#include "basic_ds.hpp"
#include "gdt.hpp"
#include "graph.hpp"
#include "grid.hpp"
#include "io.hpp"
#include "log.hpp"
#include "math.hpp"
#include <cmath>
#include <deque>
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
        if (m_cpu_escape_boundary == "N")
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
            std::sort(m_cpu_escape_points.at(0).begin(),
                      m_cpu_escape_points.at(0).end(),
                      [](auto a, auto b) { return a.first.x() < b.first.x(); });
        }
        else if (m_cpu_escape_boundary == "E")
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
            std::sort(m_cpu_escape_points.at(1).begin(),
                      m_cpu_escape_points.at(1).end(),
                      [](auto a, auto b) { return a.first.y() > b.first.y(); });
        }
        else if (m_cpu_escape_boundary == "S")
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
            std::sort(m_cpu_escape_points.at(2).begin(),
                      m_cpu_escape_points.at(2).end(),
                      [](auto a, auto b) { return a.first.x() > b.first.x(); });
        }
        else if (m_cpu_escape_boundary == "W")
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
            std::sort(m_cpu_escape_points.at(3).begin(),
                      m_cpu_escape_points.at(3).end(),
                      [](auto a, auto b) { return a.first.y() < b.first.y(); });
        }
        else
        {
            throw std::runtime_error("Error: CPU escape boundary not found");
        }

#ifdef VERBOSE
        std::cout << "CPU escape boundary: " << m_cpu_escape_boundary << std::endl;
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
        std::sort(router()->vias().begin(),
                  router()->vias().end(),
                  [](Via v1, Via v2)
                  {
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
        std::sort(router()->vias().begin(),
                  router()->vias().end(),
                  [](Via v1, Via v2)
                  {
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
        sort(group_nets.begin(),
             group_nets.end(),
             [&group](std::shared_ptr<Nets> n1, std::shared_ptr<Nets> n2)
             { return n1->group_escape_length().at(group.first) < n2->group_escape_length().at(group.first); });
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
        unordered_map<int, int> count; //  layer, order count
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

void DataManager::distributeLayerByGroup()
{
    // print out m_group informations
    // *** Do not redistribute the objects in the Layer 0 ***
    int base_layer = 0;
    for (auto group : m_groups)
    {
        std::unordered_set<int> use_count;
        std::string group_name = group.first;
        for (auto comp : group.second)
        {
            for (auto v : comp->router()->vias())
            {
                use_count.insert(m_netlists.nets().at(v.net_id())->group_layer().at(group_name));
            }
        }
        if (use_count.size() == 0)
            continue;
        std::cout << group_name << " use count: " << use_count.size() << std::endl;

        // distribute next group's layer from base_layer
        for (auto comp : group.second)
        {
            for (auto &v : comp->router()->vias())
            {
                if (m_netlists.nets().at(v.net_id())->group_layer().at(group_name) == 0)
                    continue;
                m_netlists.nets().at(v.net_id())->group_layer().at(group_name) += base_layer;
                v.layer() += base_layer;
            }
            for (auto &s : comp->router()->segments())
            {
                if (s.layer() == 0)
                    continue;
                s.setLayer(s.layer() + base_layer);
            }

            for (auto &p : comp->escape_points())
            {
                for (auto &v : p)
                {
                    if (v.first.z() == 0)
                        continue;
                    v.first.z() += base_layer;
                }
            }
        }

        base_layer += use_count.size();
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
        long flow = 0;
        int expand = 2;
        int maximum_layer = 3;
        std::vector<std::unordered_set<int>> pinsets(1);
        // all pins
        for (size_t i = 0; i < comp->pins().size(); i++)
        {
            pinsets[0].insert(comp->pins().at(i)->net_id());
        }

        do
        {
            graph_manager = std::make_shared<GraphManager>();
            graph_manager->DDR2DDRInit(*this, *comp, expand++, maximum_layer);
            flow = 0;
            for (auto ps : pinsets)
            {
                graph_manager->addSource2Pins(*comp, ps);
                flow += graph_manager->minCostMaxFlow();
                graph_manager->fixFlowResults();
            }
            utils::printlog("DDR: " + comp->comp_name() + " expand: " + std::to_string(expand - 1) +
                            " maximum_layer: " + std::to_string(maximum_layer));
            if (expand > 5)
            {
                maximum_layer++;
                expand = 0;
            }
        } while (flow != (long)comp->pins().size());
        graph_manager->restoreFlowResults();
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
                *this, *comp, m_wire_spacing, m_wire_width, bump_ball_radius, m_cpu_escape_boundary);
            flow = graph_manager->minCostMaxFlow();
#ifdef VERBOSE
            // std::cout << "CPU2DDR: " << comp->comp_name() << std::endl;
            // std::cout << "flow = " << flow << std::endl;
            // std::cout << "#pins = " << (long)comp->pins().size() << std::endl;
#endif
            // escape routing
            graph_manager->CPU2DDR(comp->router(), *comp, m_cpu_escape_boundary);
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
    checkAndCorrectPinSegments();
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
// helper function to create diagonal, extend and CPU extend to drill via segment
void DataManager::processDiagonalAndExtendSegment(char to_pair_second,
                                                  char from_pair_second,
                                                  std::shared_ptr<Component> comp2,
                                                  std::vector<std::pair<Coordinate, int>> &cpu_escape_point,
                                                  bool continued = false)
{
    bool is_north_south = (from_pair_second == 'N' || from_pair_second == 'S');
    bool is_west_east = (from_pair_second == 'W' || from_pair_second == 'E');

    // 確定是否要執行 y_bound_shift 計算邏輯
    if (is_north_south || is_west_east)
    {
        double y_bound_shift = 0, y_bound_shift_limit = 5000;
        double outtest_coordinate =
            (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "E")
                ? std::numeric_limits<double>::lowest()
                : std::numeric_limits<double>::max(); // CPU, N: largest y, E: largest x, S: smallest y, W: smallest x
        bool stop = false;
        // 確定 y_bound_shift
        while (!stop)
        {
            stop = true;
            // y_bound_shift 超過 CPU, 表示直接從 DDR escape point 拉直線到 CPU escape point
            if (y_bound_shift > y_bound_shift_limit)
            {
                break;
            }
            for (auto &ep_pair : comp2->escape_points().at(to_pair_second == 'E' ? 1 : 0))
            {
                auto ep = ep_pair.first;
                auto net_id = ep_pair.second;
                double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
                double x_offset = y_bound - ep.y();
                // 用旋轉過的component座標系統去建立拉到component邊界top right
                // component 只會有往東或往西的escape point，所以x_offset只會是正值
                Segment diagonal_segment(
                    ep, Coordinate{ep.x() + (to_pair_second == 'E' ? x_offset : -x_offset), y_bound, ep.z()}, net_id);
                rotateSegment(diagonal_segment, comp2->rotation_angle());

                Coordinate cpu_ep = Coordinate{0, 0, 0};
                for (auto &ep : cpu_escape_point)
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
                Segment extent_segment;
                try
                {
                    extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                        (to_pair_second == 'E' ? 45.0 : -45.0),
                        is_west_east ? cpu_ep.x() : std::numeric_limits<double>::quiet_NaN(),
                        is_north_south ? cpu_ep.y() : std::numeric_limits<double>::quiet_NaN());
                }
                catch (const std::invalid_argument &e)
                {
                    extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                        0.0,
                        (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "S")
                            ? cpu_ep.x()
                            : std::numeric_limits<double>::quiet_NaN(),
                        (m_cpu_escape_boundary == "W" || m_cpu_escape_boundary == "E")
                            ? cpu_ep.y()
                            : std::numeric_limits<double>::quiet_NaN());
                }

                // extent_segment end point 超出CPU邊界，y_bound_shift + 10
                if ((m_cpu_escape_boundary == "W" && extent_segment.end().x() > cpu_ep.x()) ||
                    (m_cpu_escape_boundary == "E" && extent_segment.end().x() < cpu_ep.x()) ||
                    (m_cpu_escape_boundary == "N" && extent_segment.end().y() < cpu_ep.y()) ||
                    (m_cpu_escape_boundary == "S" && extent_segment.end().y() > cpu_ep.y()))
                {
                    y_bound_shift += 10;
                    stop = false;
                    break;
                }
                // CPU, N: largest y, E: largest x, S: smallest y, W: smallest x
                if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
                {
                    outtest_coordinate = m_cpu_escape_boundary == "N"
                                             ? std::max(outtest_coordinate, extent_segment.end().y())
                                             : std::min(outtest_coordinate, extent_segment.end().y());
                }
                else
                {
                    outtest_coordinate = m_cpu_escape_boundary == "E"
                                             ? std::max(outtest_coordinate, extent_segment.end().x())
                                             : std::min(outtest_coordinate, extent_segment.end().x());
                }
            }
        }
        // Diagonal segment, extent segment and CPU extend to drill via
        for (auto &ep_pair : comp2->escape_points().at(to_pair_second == 'E' ? 1 : 0))
        {

            auto ep = ep_pair.first;
            auto net_id = ep_pair.second;
            double y_bound = comp2->top_right().y() + y_bound_shift + comp2->tile_height();
            double x_offset = y_bound - ep.y();
            Segment diagonal_segment(
                ep, Coordinate{ep.x() + (to_pair_second == 'E' ? x_offset : -x_offset), y_bound, ep.z()}, net_id);
            rotateSegment(diagonal_segment, comp2->rotation_angle());

            Coordinate cpu_ep = Coordinate{0, 0, 0};
            for (auto &ep : cpu_escape_point)
            {
                if (ep.second == net_id)
                {
                    cpu_ep = ep.first;
                    if (continued)
                    {
                        if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
                        {
                            ep.first.y() = outtest_coordinate;
                        }
                        else
                        {
                            ep.first.x() = outtest_coordinate;
                        }
                    }
                    break;
                }
            }
            try
            {
                if (cpu_ep == Coordinate{0, 0, 0})
                {
                    std::string error_message = "Error: CPU escape point not found, net_id: " + std::to_string(net_id);
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

            // y_bound_shift 超過 CPU, 表示直接從 DDR escape point 拉直線到 CPU escape point
            if (y_bound_shift > y_bound_shift_limit)
            {
                Segment straight_segment = std::move(diagonal_segment);
                if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
                {
                    straight_segment.end() = Coordinate{cpu_ep.x(), straight_segment.start().y(), ep.z()};
                }
                else
                {
                    straight_segment.end() = Coordinate{straight_segment.start().x(), cpu_ep.y(), ep.z()};
                }
                Segment cpu_extend_to_drill_via(
                    cpu_ep, Coordinate{straight_segment.end().x(), straight_segment.end().y(), cpu_ep.z()}, net_id);

                m_area_router->addSegment(straight_segment);
                m_area_router->addSegment(cpu_extend_to_drill_via);
                m_area_router->addVia(Via(straight_segment.end(), cpu_ep.z(), net_id));
                continue;
            }

            Segment extent_segment;
            try
            {
                extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                    (to_pair_second == 'E' ? 45.0 : -45.0),
                    is_west_east ? cpu_ep.x() : std::numeric_limits<double>::quiet_NaN(),
                    is_north_south ? cpu_ep.y() : std::numeric_limits<double>::quiet_NaN());
            }
            catch (const std::invalid_argument &e)
            {
                extent_segment = diagonal_segment.createExtendedSegmentByDegree(
                    0.0,
                    (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "S")
                        ? cpu_ep.x()
                        : std::numeric_limits<double>::quiet_NaN(),
                    (m_cpu_escape_boundary == "W" || m_cpu_escape_boundary == "E")
                        ? cpu_ep.y()
                        : std::numeric_limits<double>::quiet_NaN());
            }

            Segment cpu_extend_to_drill_via(
                cpu_ep, Coordinate{extent_segment.end().x(), extent_segment.end().y(), cpu_ep.z()}, net_id);

            if (continued)
            {
                if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
                {
                    cpu_extend_to_drill_via.end().y() = outtest_coordinate;
                }
                else
                {
                    cpu_extend_to_drill_via.end().x() = outtest_coordinate;
                }
            }

            m_area_router->addSegment(diagonal_segment);
            m_area_router->addSegment(extent_segment);
            m_area_router->addSegment(cpu_extend_to_drill_via);
            m_area_router->addVia(Via(extent_segment.end(), cpu_ep.z(), net_id));
        }
    }
}

std::map<std::pair<int, int>, std::vector<std::pair<int, int>>>
groupDDREscapePoints(std::vector<std::pair<Coordinate, int>> &escape_points)
{
    // Lambda function to calculate the key
    auto getKey = [](const Coordinate &point)
    { return std::make_pair(static_cast<int>(std::floor(point.x())), static_cast<int>(std::floor(point.y()))); };
    // Coordinate map to (layer, net_id)
    std::map<std::pair<int, int>, std::vector<std::pair<int, int>>> grouped_points;
    // 將 escape points 分組
    for (const auto &p : escape_points)
    {
        auto point = p.first;
        auto key = getKey(point);
        grouped_points[key].emplace_back(point.z(), p.second);
    }

    // 輸出結果
#ifdef VERBOSE
    for (const auto &entry : grouped_points)
    {
        std::cout << "Key: (" << entry.first.first << ", " << entry.first.second << ")" << std::endl;
        for (const auto &point : entry.second)
        {
            std::cout << "  (" << point.first << ", " << point.second << ")" << std::endl;
        }
    }
#endif

    return grouped_points;
}

void reorderCPUEscapePoints(std::vector<std::pair<Coordinate, int>> &cpu_ep, std::string turn_direction)
{
    if (turn_direction == "N")
    {
        std::sort(cpu_ep.begin(), cpu_ep.end(), [](auto a, auto b) { return a.first.y() > b.first.y(); });
    }
    else if (turn_direction == "E")
    {
        std::sort(cpu_ep.begin(), cpu_ep.end(), [](auto a, auto b) { return a.first.x() > b.first.x(); });
    }
    else if (turn_direction == "S")
    {
        std::sort(cpu_ep.begin(), cpu_ep.end(), [](auto a, auto b) { return a.first.y() < b.first.y(); });
    }
    else if (turn_direction == "W")
    {
        std::sort(cpu_ep.begin(), cpu_ep.end(), [](auto a, auto b) { return a.first.x() < b.first.x(); });
    }
#ifdef VERBOSE
    // for (const auto &ep : cpu_ep)
    // {
    //     std::cout << "CPU escape point: (" << ep.first.x() << ", " << ep.first.y() << ", " << ep.first.z()
    //               << ") Net ID: " << ep.second << std::endl;
    // }
#endif
}
// switch net_id all from from_layer to to_layer
void switchAllLayers(DataManager &datamanager, int net_id, int from_layer, int to_layer)
{
    // print net_id, from_layer, to_layer
#ifdef VERBOSE
    // std::cout << "net_id: " << net_id << " from_layer: " << from_layer << " to_layer: " << to_layer << std::endl;
#endif
    for (auto &p_comp : datamanager.components())
    {
        auto &comp = p_comp.second;
        for (auto &seg : comp->router()->segments())
        {
            if (seg.net_id() == net_id && seg.layer() == from_layer)
            {
                seg.setLayer(to_layer);
            }
        }
        for (auto &via : comp->router()->vias())
        {
            if (via.net_id() == net_id && via.layer() == from_layer)
            {
                via.layer() = to_layer;
            }
        }
        for (auto &ep : comp->escape_points().at(0))
        {
            if (ep.second == net_id && ep.first.z() == from_layer)
            {
                ep.first.z() = to_layer;
            }
        }
        for (auto &ep : comp->escape_points().at(1))
        {
            if (ep.second == net_id && ep.first.z() == from_layer)
            {
                ep.first.z() = to_layer;
            }
        }
    }
    // area router
    for (auto &seg : datamanager.area_router()->segments())
    {
        if (seg.net_id() == net_id && seg.layer() == from_layer)
        {
            seg.setLayer(to_layer);
        }
    }
}

void switchDDREscapeLayers(DataManager &datamanager,
                           std::vector<std::pair<Coordinate, int>> &cpu_ep,
                           std::map<std::pair<int, int>, std::vector<std::pair<int, int>>> &&group)
{
    // 如果在同一個 group，他的 layer order 應在要在 cpu escape point 的 order是一致的
    // 例如 net1, net2 在同 group, net 1 在 layer 1, net2 在 layer 0
    // 可是 cpu escape point order 是 x, x, x, x, 1, x, x, x, 2, x, x, x, x
    // 表示 net1應該要在layer 0, net2 要在 layer 1
    // 我應該要確保 net_id 他的 layer order 在 cpu_ep 中是由小到大，讓他的layer order也是由小到大
    for (auto &entry : group)
    {
        auto &layer_netIds = entry.second;
        std::vector<int> layers;
        for (const auto &ln : layer_netIds)
        {
            layers.push_back(ln.first);
        }
        sort(layers.begin(), layers.end()); // 收集 layers 並把他由大到小排序
        std::vector<int> netIds;
        for (const auto &ln : layer_netIds)
        {
            netIds.push_back(ln.second);
        }
        // sort netIds by their order in cpu_ep
        std::sort(netIds.begin(),
                  netIds.end(),
                  [&cpu_ep](int a, int b)
                  {
                      auto it_a = std::find_if(cpu_ep.begin(), cpu_ep.end(), [a](auto p) { return p.second == a; });
                      auto it_b = std::find_if(cpu_ep.begin(), cpu_ep.end(), [b](auto p) { return p.second == b; });
                      return std::distance(cpu_ep.begin(), it_a) < std::distance(cpu_ep.begin(), it_b);
                  });

        // sort layer_netIds by their layer
        std::sort(layer_netIds.begin(), layer_netIds.end(), [](auto a, auto b) { return a.first < b.first; });

        // 如果跟原本 groups (layer, net) 不一樣，就要更新成新的 layer order
        for (size_t i = 0; i < netIds.size(); i++)
        {
            if (layer_netIds[i].second != netIds[i])
            {
                for (size_t j = 0; j < netIds.size(); j++)
                {
                    if (layer_netIds[j].second == netIds[i])
                    {
                        switchAllLayers(datamanager, netIds[i], layer_netIds[j].first, layers[i]);
                        // debug print layers, layer_netIds, netIds
#ifdef VERBOSE
                        // std::cout << "switchDDREscapeLayers: " << std::endl;
                        // std::cout << "Layers: ";
                        // for (auto l : layers)
                        // {
                        //     std::cout << l << " ";
                        // }
                        // std::cout << std::endl;
                        // std::cout << "Layer_netIds: ";
                        // for (auto ln : layer_netIds)
                        // {
                        //     std::cout << "(" << ln.first << ", " << ln.second << ") ";
                        // }
                        // std::cout << std::endl;
                        // std::cout << "NetIds: ";
                        // for (auto n : netIds)
                        // {
                        //     std::cout << n << " ";
                        // }
                        // std::cout << std::endl;
#endif
                    }
                }
            }
        }
    }
}

int getCPUEscapeBoundaryIndex(std::string cpu_escape_boundary)
{
    if (cpu_escape_boundary == "N")
    {
        return 0;
    }
    else if (cpu_escape_boundary == "E")
    {
        return 1;
    }
    else if (cpu_escape_boundary == "S")
    {
        return 2;
    }
    else if (cpu_escape_boundary == "W")
    {
        return 3;
    }
    return -1;
}

void DataManager::createGrid(const std::vector<std::pair<Coordinate, int>> &cpu_ep,
                             const std::vector<std::pair<Coordinate, int>> &ddr_ep,
                             const double &pitch)
{
    // find out which layers are in ddr_ep, create corresponding grid for each layer
    std::set<int> layers;
    for (const auto &ep : ddr_ep)
    {
        layers.insert(ep.first.z());
    }
    // traverse cpu_ep and ddr_ep to find out the bottom left and top right corner of the grid
    double min_x = std::numeric_limits<double>::max();
    double min_y = std::numeric_limits<double>::max();
    double max_x = std::numeric_limits<double>::lowest();
    double max_y = std::numeric_limits<double>::lowest();
    for (const auto &ep : cpu_ep)
    {
        min_x = std::min(min_x, ep.first.x());
        min_y = std::min(min_y, ep.first.y());
        max_x = std::max(max_x, ep.first.x());
        max_y = std::max(max_y, ep.first.y());
    }
    for (const auto &ep : ddr_ep)
    {
        min_x = std::min(min_x, ep.first.x());
        min_y = std::min(min_y, ep.first.y());
        max_x = std::max(max_x, ep.first.x());
        max_y = std::max(max_y, ep.first.y());
    }

    for (const auto &layer : layers)
    {
        // m_grids[layer] =
        // std::make_shared<A_Star::Grid>(Coordinate{min_x, min_y, layer}, Coordinate{max_x, max_y, layer}, pitch);
        m_grids[layer] =
            std::make_shared<A_Star::Grid>(Coordinate{0, 0, layer}, Coordinate{20000.0, 20000.0, layer}, pitch);
    }
}

void DataManager::addPointsPath2Segments(A_Star::Grid &grid,
                                         std::vector<A_Star::Point> &point_path,
                                         const int net_id,
                                         const int layer,
                                         const Coordinate &start,
                                         const Coordinate &end)
{
    // remove the head and tail of point_path for not align with start and end
    point_path.erase(point_path.begin());
    point_path.pop_back();
    auto segments = grid.points2segments(point_path, net_id, layer);
    // add on grid segments
    for (const auto &seg : segments)
    {
        m_area_router->addSegment(seg);
    }
    // add start to first point and last point to end
    // add start to first point(DDR escape point to first point of the path)
    std::vector<Segment> path_to_start = Segment::generatePath(start, segments.front().start(), net_id);
    for (const auto &seg : path_to_start)
    {
        m_area_router->addSegment(seg);
    }
    // add last point to end(last point of the path to CPU escape point)
    std::vector<Segment> path_to_end =
        Segment::generatePath(segments.back().end(), Coordinate(end.x(), end.y(), layer), net_id); // end.z() = 0
    for (const auto &seg : path_to_end)
    {
        m_area_router->addSegment(seg);
    }
}

bool DataManager::CPU2DDR_A_Star(const std::vector<std::pair<Coordinate, int>> &cpu_ep,
                                 const std::vector<std::pair<Coordinate, int>> &ddr_ep,
                                 const A_Star::Point &parent_direction,
                                 const int &max_routing_attempts)
{
    // ddr_ep is start point, cpu_ep is end point using net_id to find the pair
    // and the using layer is depends on ddr_ep layer
    std::unordered_map<int, RouteCandidate> route_information; // (net_id, route candidate)
    std::unordered_map<int, std::deque<RouteCandidate>> route_candidates; // (layer, deque<route candidates>)
    std::unordered_set<int> layers; // store all layers, later will route layer by layer
    std::unordered_map<int, A_Star::PathInfo> paths; // store all paths, (net_id, path)
    int num_routes = 0;
    for (const auto &d_ep : ddr_ep)
    {
        const auto &start = d_ep.first;
        const auto &s_net_id = d_ep.second;
        const auto &layer = d_ep.first.z();
        layers.insert(layer);
        for (const auto &c_ep : cpu_ep)
        {
            const auto &end = c_ep.first;
            const auto &e_net_id = c_ep.second;
            if (s_net_id != e_net_id)
            {
                continue;
            }
            route_information[s_net_id] = RouteCandidate{start, end, s_net_id, layer};
            route_candidates[layer].emplace_back(RouteCandidate{start, end, s_net_id, layer});
            break;
        }
    }
    for (const auto &layer : layers)
    {
        auto grid = m_grids[layer];
        while (!route_candidates[layer].empty())
        {
            num_routes++;
#ifdef VERBOSE
#endif
            if (num_routes % 75 == 0)
                std::cout << "num of routes: " << num_routes << std::endl;
            if (num_routes > max_routing_attempts)
            {
                return false;
            }
#ifdef VERBOSE
            // std::cout << "Routing net_id: " << route_candidates[layer].front().net_id
            //           << " Layer: " << route_candidates[layer].front().layer
            //           << " # of waiting: " << route_candidates[layer].size() << std::endl;
#endif
            auto rc = route_candidates[layer].front();
            route_candidates[layer].pop_front();
            auto start = rc.start;
            auto end = rc.end;
            auto net_id = rc.net_id;

            // have been routed, need rip-up the old path
            if (paths.count(net_id))
            {
                grid->ripUpPath(paths[net_id].points_path);
            }

            auto point_path = grid->a_star_search(start, end, parent_direction);
            if (point_path.size() == 0)
            {
                continue;
            }
            // overlap with other path, add to rip-up list and add history cost
            for (const auto &p : paths)
            {
                const auto &p_info = p.second;
                if (p_info.layer != layer)
                    continue;
                if (p_info.net_id == net_id)
                    continue;
                if (grid->isOverlap(p_info.points_path, point_path))
                {
                    // If not in deque, add it to deque
                    bool exist = false;
                    for (const auto &dq : route_candidates[layer])
                    {
                        if (dq.net_id == p_info.net_id)
                        {
                            exist = true;
                            break;
                        }
                    }
                    if (exist)
                    {
                        continue;
                    }
#ifdef VERBOSE
                    // std::cout << net_id << " is Overlapped with net_id: " << p_info.net_id << std::endl;

#endif
                    route_candidates[layer].emplace_back(route_information[p_info.net_id]);
                    grid->addHistoryCost(grid->overlapPath(p_info.points_path, point_path));
                }
                if (grid->isCrossing(p_info.points_path, point_path))
                {
                    // If not in deque, add it to deque
                    bool exist = false;
                    for (const auto &dq : route_candidates[layer])
                    {
                        if (dq.net_id == p_info.net_id)
                        {
                            exist = true;
                            break;
                        }
                    }
                    if (exist)
                    {
                        continue;
                    }
#ifdef VERBOSE
                    // std::cout << net_id << " is Crossing with net_id: " << p_info.net_id << std::endl;

#endif
                    route_candidates[layer].emplace_back(route_information[p_info.net_id]);
                    // grid->addHistoryCost(grid->crossingPath(p_info.points_path, point_path));
                    grid->addHistoryCost(p_info.points_path);
                }
            }
            grid->addPathCost(point_path);
            paths[net_id] = A_Star::PathInfo{start, end, net_id, layer, point_path};
#ifdef VERBOSE
            // debug 可以畫出每round的路徑
            // if (num_routes % 75 == 0) {
            //     // copy the m_area_router
            //     std::shared_ptr<Router> saved_area_router = std::make_shared<Router>();
            //     for (const auto & s : m_area_router->segments()) {
            //         saved_area_router->addSegment(s);
            //     }
            //     for (const auto & v : m_area_router->vias()) {
            //         saved_area_router->addVia(v);
            //     }

            //     for (auto &p_path : paths)
            //     {
            //         auto &PathInfo = p_path.second;
            //         auto grid = m_grids[PathInfo.layer];
            //         addPointsPath2Segments(
            //             *grid, PathInfo.points_path, PathInfo.net_id, PathInfo.layer, PathInfo.start, PathInfo.end);
            //     }
            //     GDTWriter gdt_writer(*this);
            //     gdt_writer.debugging(num_routes);
            //     gdt_writer.gdt2gds("");
            //     gdt_writer.cleanFiles();
            //     std::cout << "num_routes: " << num_routes << std::endl;
            //     // restore the m_area_router
            //     m_area_router->segments().clear();
            //     m_area_router->vias().clear();
            //     for (const auto & s : saved_area_router->segments()) {
            //         m_area_router->addSegment(s);
            //     }
            //     for (const auto & v : saved_area_router->vias()) {
            //         m_area_router->addVia(v);
            //     }
            // }
#endif
        }
    }
    for (auto &p_path : paths)
    {
        auto &PathInfo = p_path.second;
        auto grid = m_grids[PathInfo.layer];
        addPointsPath2Segments(
            *grid, PathInfo.points_path, PathInfo.net_id, PathInfo.layer, PathInfo.start, PathInfo.end);
    }
    utils::printlog("# of A* routes: " + std::to_string(num_routes));
    return true;
}

bool reverseDDRorder(const std::string &extend_direction, const std::string &turn_direction)
{
    if (extend_direction == "N" && turn_direction == "W")
        return true;
    else if (extend_direction == "E" && turn_direction == "N")
        return true;
    else if (extend_direction == "S" && turn_direction == "E")
        return true;
    else if (extend_direction == "W" && turn_direction == "S")
        return true;
    else
        return false;
}

void DataManager::extendCPUEscapePoint(const double &outtest_coordinate,
                                       std::vector<std::pair<Coordinate, int>> &cpu_escape_point)
{
    Coordinate cpu_ep = Coordinate{0, 0, 0};
    for (auto &ep : cpu_escape_point)
    {
        int ned_id = ep.second;
        cpu_ep = ep.first;
        if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
        {
            m_area_router->addSegment(Segment{cpu_ep, Coordinate{cpu_ep.x(), outtest_coordinate, cpu_ep.z()}, ned_id});
            ep.first.y() = outtest_coordinate;
        }
        else
        {
            m_area_router->addSegment(Segment{cpu_ep, Coordinate{cpu_ep.x(), outtest_coordinate, cpu_ep.z()}, ned_id});
            ep.first.x() = outtest_coordinate;
        }
    }
}

void DataManager::turnCPUEscapePoint(const double &spacing,
                                     std::vector<std::pair<Coordinate, int>> &cpu_ep,
                                     std::vector<std::pair<Coordinate, int>> &ddr_ep,
                                     double &outtest_coordinate)
{
#ifdef VERBOSE
    // print out extend direction and spacing
    std::cout << "function turnCPUEscapePoint: " << std::endl;
    std::cout << "extend direction: " << m_cpu_escape_boundary << std::endl;
    std::cout << "spacing: " << spacing << std::endl;
#endif
    // group ddr_ep by their layer
    // use <layer, net_id> to find the extend order
    std::map<int, int> layer_count; // count the layer appearance
    std::map<int, std::pair<int, int>> grouped_ddr_ep; // net_id -> (order, layer)
    for (auto &ep : ddr_ep)
    {
        const auto &point = ep.first;
        const auto &net_id = ep.second;

        layer_count[point.z()]++;
        grouped_ddr_ep[net_id] = std::make_pair(layer_count[point.z()], point.z());
    }

    double upper_bound = 0.0, lower_bound = 0.0; // E/W upper bound/lower bound is for top/bottom, N/S is for right/left
    // get getCPUComponent
    std::shared_ptr<Component> cpu_component = getCPUComponent();
    if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "S")
    {
        upper_bound = cpu_component->top_right().x() + spacing;
        lower_bound = cpu_component->bottom_left().x() - spacing;
    }
    else if (m_cpu_escape_boundary == "E" || m_cpu_escape_boundary == "W")
    {
        upper_bound = cpu_component->top_right().y() + spacing;
        lower_bound = cpu_component->bottom_left().y() - spacing;
    }
    else
    {
        throw std::runtime_error("Error: CPU escape point extend direction not found");
    }

    // extend CPU escape point by the order of ddr_ep
    int count = 0;
    for (auto &ep : cpu_ep)
    {
        count++;
        double x_offset = 0;
        double y_offset = 0;
        const auto &order = grouped_ddr_ep[ep.second].first;
        const auto &layer = grouped_ddr_ep[ep.second].second;
#ifdef VERBOSE
        // print out the net_id, order, layer
        std::cout << "net_id: " << ep.second << " order: " << order << " layer: " << layer << std::endl;
#endif
        if (m_cpu_escape_boundary == "N")
        {
            y_offset = spacing * order;
        }
        else if (m_cpu_escape_boundary == "E")
        {
            x_offset = spacing * order;
        }
        else if (m_cpu_escape_boundary == "S")
        {
            y_offset = -spacing * order;
        }
        else if (m_cpu_escape_boundary == "W")
        {
            x_offset = -spacing * order;
        }
        else
        {
            throw std::runtime_error("Error: CPU escape point extend direction not found");
        }

        Segment extend_segment =
            Segment(ep.first, Coordinate{ep.first.x() + x_offset, ep.first.y() + y_offset, ep.first.z()}, ep.second);

        m_area_router->addSegment(extend_segment);
        m_area_router->addVia(
            Via(Coordinate{ep.first.x() + x_offset, ep.first.y() + y_offset, ep.first.z()}, layer, ep.second));
        ep.first = Coordinate{extend_segment.end()};

        if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "W")
        {
            outtest_coordinate = m_cpu_escape_boundary == "N" ? std::max(outtest_coordinate, extend_segment.end().y())
                                                              : std::min(outtest_coordinate, extend_segment.end().y());
        }
        else
        {
            outtest_coordinate = m_cpu_escape_boundary == "E" ? std::max(outtest_coordinate, extend_segment.end().x())
                                                              : std::min(outtest_coordinate, extend_segment.end().x());
        }
        // Segment extend_segment2;
        // if (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "S")
        // {
        //     // extend_segment2 =
        //     //     extend_segment.createExtendedSegmentByDegree(90, lower_bound,
        //     //     std::numeric_limits<double>::quiet_NaN());
        //     // extend_segment2 = extend_segment.createExtendedSegmentByDegree(
        //     //     270, upper_bound, std::numeric_limits<double>::quiet_NaN());
        // }
        // else if (m_cpu_escape_boundary == "E" || m_cpu_escape_boundary == "W")
        // {
        //     // extend_segment2 =
        //     //     extend_segment.createExtendedSegmentByDegree(90, std::numeric_limits<double>::quiet_NaN(),
        //     //     lower_bound);
        //     // extend_segment2 =
        //     // extend_segment.createExtendedSegmentByDegree(270, std::numeric_limits<double>::quiet_NaN(),
        //     // lower_bound);
        // }
        // extend_segment2.start().z() = extend_segment2.end().z() = layer;
        // extend_segment2.net_id() = ep.second;
        // m_area_router->addSegment(extend_segment2);
        // ep.first = Coordinate{extend_segment2.end()}; // 先讓他保持還是在 0，layer 從 ddr_ep 取
    }
}

void DataManager::markExistingObstacles()
{
    // Obstacles
    for (const auto o : m_obstacles)
    {
        if (m_grids.count(o.layer()))
        {
            m_grids[o.layer()]->addObstacle(o);
        }
    }
    // Segments
    for (auto &comp_pair : m_components)
    {
        auto &comp = comp_pair.second;
        for (auto &seg : comp->router()->segments())
        {
            if (m_grids.count(seg.layer()))
            {
                m_grids[seg.layer()]->addObstacle(seg);
            }
        }
    }
    for (auto &seg : m_area_router->segments())
    {
        if (m_grids.count(seg.layer()))
        {
            m_grids[seg.layer()]->addObstacle(seg);
        }
    }
    // Vias
    for (auto &comp_pair : m_components)
    {
        auto &comp = comp_pair.second;
        for (auto &via : comp->router()->vias())
        {
            for (int l = 0; l <= via.layer(); l++)
            {
                if (m_grids.count(l))
                {
                    m_grids[l]->addObstacle(via);
                }
            }
        }
    }
    for (auto &via : m_area_router->vias())
    {
        for (int l = 0; l <= via.layer(); l++)
        {
            if (m_grids.count(l))
            {
                m_grids[l]->addObstacle(via);
            }
        }
    }
    // data signals
    for (const auto &ds : m_data_signals)
    {
        for (const auto &s : ds)
        {
            if (m_grids.count(s.layer()))
            {
                m_grids[s.layer()]->addObstacle(s);
            }
        }
    }
}

void DataManager::DDR2DDRAreaRouting()
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
}

void DataManager::CPU2DDRAreaRouting()
{
    for (auto it = m_cpu2ddr_edges.begin(); it != m_cpu2ddr_edges.end(); ++it)
    {
        auto p = *it;
        bool continued = !(std::next(it) == m_cpu2ddr_edges.end());
        auto from_pair = std::get<0>(p); // get the first component pair
        auto to_pair = std::get<1>(p); // get the second component pair
        bool fly_by = std::get<2>(p);
        auto t_topology_layer = std::get<3>(p);
        auto &comp1 = m_components[from_pair.first];
        std::string turn_direction = std::string(1, from_pair.second);

        // cpu escape points
        // A m_cpu_escape_boundary is "N" or "E" or "S" or "W" to get the exact cpu_escape_points
        int cpu_escape_boundary_idx = getCPUEscapeBoundaryIndex(m_cpu_escape_boundary);
        auto &cpu_escape_point = comp1->cpu_escape_points().at(cpu_escape_boundary_idx);
        if (fly_by)
        {
            auto &comp2 = m_components[to_pair.first];
            auto &ddr_escape_point = comp2->escape_points().at(to_pair.second == 'E' ? 1 : 0);
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

            comp2->rotateAll(true);
            // sort comp2->escape_points() from top to bottom (a.y < b.y)
            if (to_pair.second == 'E')
            {
                std::sort(ddr_escape_point.begin(),
                          ddr_escape_point.end(),
                          [](auto a, auto b) { return a.first.y() > b.first.y(); });
            }
            else
            {
                std::sort(ddr_escape_point.begin(),
                          ddr_escape_point.end(),
                          [](auto a, auto b) { return a.first.y() < b.first.y(); });
            }
            if (reverseDDRorder(m_cpu_escape_boundary, turn_direction))
            {
                std::reverse(ddr_escape_point.begin(), ddr_escape_point.end());
            }
            comp2->rotateAll(false);

            // DDR expend
            if (to_pair.second == 'E' || to_pair.second == 'W')
            {
                // reorder CPU escape points by the direction of from_pair
                reorderCPUEscapePoints(cpu_escape_point, turn_direction);
                // group ddr escape points by their layer
                auto tmp_group = groupDDREscapePoints(ddr_escape_point);
                // switch net_id all from from_layer to to_layer
                switchDDREscapeLayers(*this, cpu_escape_point, std::move(tmp_group));
                const auto &pitch = (m_wire_spacing + m_wire_width) * std::sqrt(2);
                double outtest_coordinate = (m_cpu_escape_boundary == "N" || m_cpu_escape_boundary == "E")
                                                ? std::numeric_limits<double>::lowest()
                                                : std::numeric_limits<double>::max(); // CPU, N: largest y, E: largest
                                                                                      // x, S: smallest y, W: smallest x
                turnCPUEscapePoint(pitch * 3, cpu_escape_point, ddr_escape_point, outtest_coordinate);

                global_routing_manager->writeADREscapePoints(
                    this, cpu_escape_point, ddr_escape_point); // for Area Global Routing

                createGrid(cpu_escape_point, ddr_escape_point, pitch);
                markExistingObstacles();
                A_Star::Point parent_direction;
                A_Star::parentLookupTable(parent_direction, std::string(1, to_pair.second), comp2->rotation_angle());
                bool is_success = CPU2DDR_A_Star(cpu_escape_point, ddr_escape_point, parent_direction);
                if (!is_success)
                {
                    throw std::runtime_error("A_star Exceed the max routing attempts.");
                }
                if (continued)
                {
                    extendCPUEscapePoint(outtest_coordinate, cpu_escape_point);
                }
            }
        }
        else
        {
            if (comp1->cpu_escape_boundary() == std::string(1, from_pair.second))
            {
                // comp2 is ddr2dde_edge idx
                auto ddr2ddr_edge = m_ddr2ddr_edges.at(std::stoi(to_pair.first));
                auto comp2 = m_components[ddr2ddr_edge.first.first];
                auto comp3 = m_components[ddr2ddr_edge.second.first];
                double peak_height = comp1->tile_height() / 2;
                // area_wire_top_y, and area_wire_bottom_y is to find the segment between comp2 and comp3
                double area_wire_top_y = std::max(comp2->escape_points().at(1).at(0).first.y(),
                                                  comp3->escape_points().at(0).at(0).first.y());
                double area_wire_bottom_y = std::min(comp2->escape_points().at(1).at(0).first.y(),
                                                     comp3->escape_points().at(0).at(0).first.y());
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
                std::vector<Segment> area_segments;
                if (ddr2ddr_edge.first.second == 'E' && ddr2ddr_edge.second.second == 'W')
                {
                    for (auto &s : m_area_router->segments())
                    {
                        if (s.start().y() <= area_wire_top_y && s.end().y() >= area_wire_bottom_y)
                        {
                            area_segments.push_back(s);
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
                    area_wirelength = area_segments.at(0).length();
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
                        for (auto &s : area_segments)
                        {
                            if (s.isInclude(std::numeric_limits<double>::quiet_NaN(), current_y) &&
                                s.net_id() == cgep.second)
                            {
                                m_area_router->removeSegment(s);
                                current_x = s.findCoordinate(std::numeric_limits<double>::quiet_NaN(), current_y);
                                if (s.start().y() < s.end().y())
                                {
                                    std::swap(s.start(), s.end());
                                }
                                Coordinate first_bend_point(current_x, current_y + 1.5 * peak_height, s.start().z());
                                Coordinate second_bend_point(current_x, current_y - 1.5 * peak_height, s.start().z());
                                Segment tmp_s(s.end(), second_bend_point, s.net_id());
                                s.end() = first_bend_point;
                                Segment first_bend = s.createExtendedSegmentByDegree(
                                    135, current_x - peak_height, std::numeric_limits<double>::quiet_NaN());

                                Segment second_bend = tmp_s.createExtendedSegmentByDegree(
                                    -135, current_x - peak_height, std::numeric_limits<double>::quiet_NaN());
                                Segment connect(first_bend.end(), second_bend.end(), s.net_id());
                                m_area_router->addSegment(s);
                                m_area_router->addSegment(first_bend);
                                m_area_router->addSegment(second_bend);
                                m_area_router->addSegment(tmp_s);
                                m_area_router->addSegment(connect);
                                m_area_router->addVia(
                                    Via(Coordinate(current_x - peak_height, current_y, s.end().z()), 0, s.net_id()));
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
                                Segment extent_segment(Coordinate{current_x - peak_height, current_y, 0},
                                                       diagonal_segment.end(),
                                                       s.net_id());
                                m_area_router->addSegment(extent_segment);
                            }
                        }
                        current_y += wire_spacing;
                    }
                }
            }
            else
            {
                // comp2 is ddr2dde_edge idx
                auto ddr2ddr_edge = m_ddr2ddr_edges.at(std::stoi(to_pair.first));
                auto comp2 = m_components[ddr2ddr_edge.first.first];
                auto comp3 = m_components[ddr2ddr_edge.second.first];

                double peak_height = comp1->tile_height() / (2 * sqrt(2));
                // area_wire_top_y, and area_wire_bottom_y is to find the segment between comp2 and comp3
                double area_wire_top_y = std::max(comp2->escape_points().at(1).at(0).first.y(),
                                                  comp3->escape_points().at(0).at(0).first.y());
                double area_wire_bottom_y = std::min(comp2->escape_points().at(1).at(0).first.y(),
                                                     comp3->escape_points().at(0).at(0).first.y());
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
                std::vector<Segment> area_segments;
                if (ddr2ddr_edge.first.second == 'E' && ddr2ddr_edge.second.second == 'W')
                {
                    for (auto &s : m_area_router->segments())
                    {
                        if (s.start().y() <= area_wire_top_y && s.end().y() >= area_wire_bottom_y)
                        {
                            area_segments.push_back(s);
                        }
                    }
                }
                // find out CPU the escape_points in group_name and specific layer
                std::vector<std::pair<Coordinate, int>> cpu_group_escape_points;
                for (auto &ep : cpu_escape_point)
                {
                    if (m_groups_nets[group_name].count(ep.second))
                    {
                        for (auto net : m_netlists.nets())
                        {
                            if (net->net_id() == ep.second)
                            {
                                if (net->group_layer()[group_name] == t_topology_layer)
                                {
                                    cpu_group_escape_points.push_back(ep);
                                }
                            }
                        }
                    }
                }
                double area_wirelength = 0;
                double wire_spacing = 0;
                if (from_pair.second == 'W')
                {
                    // from_pair.second == 'W', order is from bottom to top
                    area_wirelength = std::abs(area_segments.at(0).start().y() - area_segments.at(0).end().y());
                    area_wire_top_y = std::max(area_segments.at(0).start().y(), area_segments.at(0).end().y());
                    area_wire_bottom_y = std::min(area_segments.at(0).start().y(), area_segments.at(0).end().y());
                    peak_height = comp1->tile_height() / (2 * std::sqrt(2));
                    wire_spacing = (comp1->tile_height() / 2) * std::sqrt(2);
                    wire_spacing = 20;
                    while (ceil((area_wirelength - 2 * peak_height) / wire_spacing) < cpu_group_escape_points.size())
                    {
                        wire_spacing -= 1.0;
                        if (wire_spacing < (m_wire_spacing + m_wire_width))
                        {
                            throw std::runtime_error("Error: wire_spacing < m_wire_spacing + m_wire_width");
                        }
                    }
                    double start_y =
                        (area_wirelength - (cpu_group_escape_points.size() - 1) * wire_spacing - 2 * peak_height) / 2;
                    double current_y = start_y + area_wire_bottom_y;
                    double current_x = 0.0;
                    // double cpu_x_shift = 0.0, cpu_x_increment = 5.0;
                    // if (current_y < cpu_group_escape_points.at(0).first.y())
                    // {
                    //     cpu_x_shift = 0.0;
                    //     cpu_x_increment = 5.0;
                    // }
                    // else
                    // {
                    //     cpu_x_shift = cpu_x_increment * (cpu_group_escape_points.size() - 1);
                    //     cpu_x_increment = -5.0;
                    // }
                    // find segments include current_y and net_id
                    for (auto &cgep : cpu_group_escape_points)
                    {
                        for (auto &s : area_segments)
                        {
                            if (s.isInclude(std::numeric_limits<double>::quiet_NaN(), current_y) &&
                                s.net_id() == cgep.second)
                            {
                                m_area_router->removeSegment(s);
                                current_x = s.findCoordinate(std::numeric_limits<double>::quiet_NaN(), current_y);
                                if (s.start().y() < s.end().y())
                                {
                                    std::swap(s.start(), s.end());
                                }
                                double diagonal = deq(s.slope(), 1, 1e3) ? sqrt(2) : 1;
                                peak_height = comp1->tile_height() / (2 * diagonal);
                                Coordinate first_bend_point(
                                    s.findCoordinate(std::numeric_limits<double>::quiet_NaN(),
                                                     current_y + ((1.5 * peak_height) / diagonal)),
                                    current_y + ((1.5 * peak_height) / diagonal),
                                    s.start().z());
                                Coordinate second_bend_point(
                                    s.findCoordinate(std::numeric_limits<double>::quiet_NaN(),
                                                     current_y - ((1.5 * peak_height) / diagonal)),
                                    current_y - ((1.5 * peak_height) / diagonal),
                                    s.start().z());
                                Segment tmp_s(s.end(), second_bend_point, s.net_id());
                                s.end() = first_bend_point;
                                double tmp_degree = 45;
                                Segment first_bend =
                                    s.createExtendedSegmentByDegreeAndLength(tmp_degree, peak_height * sqrt(2));
                                tmp_degree = -45;
                                Segment second_bend =
                                    tmp_s.createExtendedSegmentByDegreeAndLength(tmp_degree, peak_height * sqrt(2));
                                Segment connect(first_bend.end(), second_bend.end(), s.net_id());
                                m_area_router->addSegment(s);
                                m_area_router->addSegment(first_bend);
                                m_area_router->addSegment(second_bend);
                                m_area_router->addSegment(tmp_s);
                                m_area_router->addSegment(connect);
                                if (deq(s.slope(), 1, 1e3))
                                {
                                    // 拉到 CPU 左邊 2.5 CPU寬度
                                    double CPU_width = comp1->top_right().x() - comp1->bottom_left().x();
                                    m_area_router->addVia(Via(Coordinate(current_x + (peak_height / diagonal),
                                                                         current_y - (peak_height / diagonal),
                                                                         s.end().z()),
                                                              0,
                                                              s.net_id()));
                                    m_area_router->addSegment(
                                        Segment(Coordinate(current_x + (peak_height / diagonal),
                                                           current_y - (peak_height / diagonal),
                                                           0),
                                                Coordinate(comp1->bottom_left().x() - 2.5 * CPU_width,
                                                           current_y - (peak_height / diagonal),
                                                           0),
                                                s.net_id()));
                                }
                                else
                                {
                                    double CPU_width = comp1->top_right().x() - comp1->bottom_left().x();
                                    m_area_router->addVia(Via(
                                        Coordinate(current_x + peak_height, current_y, s.end().z()), 0, s.net_id()));
                                    m_area_router->addSegment(
                                        Segment(Coordinate(current_x + peak_height, current_y, 0),
                                                Coordinate(comp1->bottom_left().x() - 2.5 * CPU_width, current_y, 0),
                                                s.net_id()));
                                }
                                break;
                            }
                        }
                        // for (auto &s : comp1->router()->segments())
                        // {
                        //     if (s.isOverlap(cgep.first))
                        //     {
                        //         double rotate_angle = 0;
                        //         bool from_end = s.end() == cgep.first;
                        //         if (from_end)
                        //         {
                        //             s.end().x() -= cpu_x_shift;
                        //             cpu_x_shift += cpu_x_increment;
                        //         }
                        //         else
                        //         {
                        //             s.start().x() -= cpu_x_shift;
                        //             cpu_x_shift += cpu_x_increment;
                        //         }
                        //         if (cgep.first.y() > current_y)
                        //         {
                        //             rotate_angle = -135;
                        //         }
                        //         else
                        //         {
                        //             rotate_angle = 135;
                        //         }
                        //         Segment diagonal_segment = s.createExtendedSegmentByDegree(
                        //             rotate_angle, std::numeric_limits<double>::quiet_NaN(), current_y, from_end);
                        //         m_area_router->addSegment(diagonal_segment);
                        //         Segment extent_segment(Coordinate{current_x - peak_height, current_y, 0},
                        //                                diagonal_segment.end(),
                        //                                s.net_id());
                        //         m_area_router->addSegment(extent_segment);
                        //     }
                        // }
                        current_y += wire_spacing;
                    }
                }
            }
        }
    }
}

void DataManager::AreaRouting()
{
    storeGroupLayer();
    distributeLayerByGroup(); // case4(none fly by cases) should not use this
    DDR2DDRAreaRouting();
    sumEscapeLength();
    CPU2DDRAreaRouting();
}

void DataManager::analyzeWirelength()
{
    // traverse all components's router segments and calculate every net's wirelength
    // also calculate the longest and shortest wirelength and their net_id
    double longest_wirelength = 0;
    double shortest_wirelength = std::numeric_limits<double>::max();
    int longest_net_id = -1;
    int shortest_net_id = -1;
    for (auto n : m_netlists.nets())
    {
        n->final_wirelength() = 0;
        for (auto comp_pair : m_components)
        {
            auto comp = comp_pair.second;
            for (auto &s : comp->router()->segments())
            {
                if (s.net_id() == n->net_id())
                {
                    n->final_wirelength() += s.length();
                }
            }
        }
        for (auto &s : m_area_router->segments())
        {
            if (s.net_id() == n->net_id())
            {
                n->final_wirelength() += s.length();
            }
        }
        if (n->final_wirelength() > longest_wirelength)
        {
            longest_wirelength = n->final_wirelength();
            longest_net_id = n->net_id();
        }
        if (n->final_wirelength() < shortest_wirelength)
        {
            shortest_wirelength = n->final_wirelength();
            shortest_net_id = n->net_id();
        }
    }
    // log longest and shortest wirelength
    // print every net's wirelength
    for (auto n : m_netlists.nets())
    {
        utils::printlog("Net_id: " + std::to_string(n->net_id()) +
                        " wirelength: " + std::to_string(n->final_wirelength()));
    }
    utils::printlog("Longest wirelength: " + std::to_string(longest_wirelength) +
                    " net_id: " + std::to_string(longest_net_id));
    utils::printlog("Shortest wirelength: " + std::to_string(shortest_wirelength) +
                    " net_id: " + std::to_string(shortest_net_id));
}

void DataManager::checkAndCorrectPinSegments()
{
    for (auto &comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        for (auto &s : comp->router()->segments())
        {
            for (auto &net : m_netlists.nets())
            {
                bool find = false;
                if (net->net_id() == s.net_id())
                {
                    for (auto &pin : net->pins())
                    {
                        if (s.start().isCloseTo(pin->coordinate(), 1.0))
                        {
                            s.start() = pin->coordinate();
                            find = true;
                            break;
                        }
                        else if (s.end().isCloseTo(pin->coordinate(), 1.0))
                        {
                            s.end() = pin->coordinate();
                            find = true;
                            break;
                        }
                    }
                }
                if (find)
                {
                    break;
                }
            }
        }
    }
}

std::pair<int, int> DataManager::findCell(const double &x, const double &y)
{
    // 計算相對於左下角的偏移
    double left_bottom_x = m_GR_Left_Bottom.first;
    double left_bottom_y = m_GR_Left_Bottom.second;
    double relative_x = x - left_bottom_x;
    double relative_y = y - left_bottom_y;

    // 計算在哪個格子，因為學姊的 col j 代表
    int i = std::floor(relative_x / m_GR_cell_width);
    int j = std::floor(relative_y / m_GR_cell_height);

    // 返回 pair<i, j>
    return std::make_pair(i, j);
}

std::shared_ptr<Component> DataManager::getCPUComponent()
{
    for (auto &comp_pair : m_components)
    {
        auto comp = comp_pair.second;
        if (comp->is_cpu())
        {
            return comp;
        }
    }
    return nullptr;
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
                double diagonal_short_segments = 30.0;
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
                                s.start().y() = s.start().y() - diagonal_factor * diagonal_short_segments;
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * diagonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * diagonal_short_segments;
                                }
                                Segment diagonal(s.start(), other_s.start(), s.net_id());
                                m_segments.push_back(diagonal);
                            }
                            else
                            {
                                s.start().y() = s.start().y() + diagonal_factor * diagonal_short_segments;
                                if (other_s.start().x() > other_s.end().x())
                                {
                                    other_s.start().x() =
                                        other_s.start().x() - diagonal_factor * diagonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * diagonal_short_segments;
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
                                        other_s.start().x() - diagonal_factor * diagonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * diagonal_short_segments;
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
                                        other_s.start().x() - diagonal_factor * diagonal_short_segments;
                                }
                                else
                                {
                                    other_s.start().x() =
                                        other_s.start().x() + diagonal_factor * diagonal_short_segments;
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
                                s.start().y() = s.start().y() - diagonal_factor * diagonal_short_segments;
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
                                s.start().y() = s.start().y() + diagonal_factor * diagonal_short_segments;
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