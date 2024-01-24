#include "graph.hpp"
#include "component_data.hpp"
#include <cmath>
#include <regex>
#ifdef VERBOSE
#include <iostream>
#endif
void GraphManager::add_v(Graph &g, Traits::vertex_descriptor &v, std::string name)
{
    v = add_vertex(g);
    m_vertex_names[v] = name;
}
GraphManager::GraphManager(
    DataManager &data_manager, Component &component, int maximum_via_count, size_t maximum_layer, int threshold)
{
    m_data_manager = &data_manager;
    m_component = &component;
    maximum_layer = std::min(maximum_layer, data_manager.layers().size());
    // Create the graph
    g = Graph();
    // Create the source and sink
    // Pin array is rows * columns
    m_v = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows(), std::vector<Traits::vertex_descriptor>(component.columns()));
    // Tiles are (rows + 1 * columns + 1) * 6
    m_tiles_N = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    m_tiles_S = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    m_tiles_E = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    m_tiles_W = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    m_tiles_C = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    m_d_tiles_C = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(component.columns() + 1));
    // Rows are (rows + 1) * layers * 2
    m_rows = std::vector<std::vector<Traits::vertex_descriptor>>(component.rows() + 1,
                                                                 std::vector<Traits::vertex_descriptor>(maximum_layer));
    m_d_rows = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.rows() + 1, std::vector<Traits::vertex_descriptor>(maximum_layer));
    // Columns are (columns + 1) * layers * 2
    m_columns = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.columns() + 1, std::vector<Traits::vertex_descriptor>(maximum_layer));
    m_d_columns = std::vector<std::vector<Traits::vertex_descriptor>>(
        component.columns() + 1, std::vector<Traits::vertex_descriptor>(maximum_layer));
    // All the vertex are [ rows * columns + (rows + 1 * columns + 1) * 6 + rows * layers + columns * layers + 2]
    m_vertex_names = std::vector<std::string>(
        component.rows() * component.columns() + (component.rows() + 1) * (component.columns() + 1) * 6 +
        (component.rows() + 1) * maximum_layer * 2 + (component.columns() + 1) * maximum_layer * 2 + 2);
    add_v(g, s, "s");
    add_v(g, t, "t");

    for (int i = 0; i < component.rows(); ++i)
    {
        for (int j = 0; j < component.columns(); ++j)
        {
            add_v(g, m_v.at(i).at(j), "v" + std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (int j = 0; j < component.columns() + 1; ++j)
        {
            add_v(g, m_tiles_N.at(i).at(j), "N" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_tiles_S.at(i).at(j), "S" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_tiles_E.at(i).at(j), "E" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_tiles_W.at(i).at(j), "W" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_tiles_C.at(i).at(j), "C" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_d_tiles_C.at(i).at(j), "dC" + std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (size_t j = 0; j < maximum_layer; ++j)
        {
            add_v(g, m_rows.at(i).at(j), "r" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_d_rows.at(i).at(j), "dr" + std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < component.columns() + 1; ++i)
    {
        for (size_t j = 0; j < maximum_layer; ++j)
        {
            add_v(g, m_columns.at(i).at(j), "c" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_d_columns.at(i).at(j), "dc" + std::to_string(i) + "_" + std::to_string(j));
        }
    }

    capacity = get(edge_capacity, g);
    weight = get(edge_weight, g);
    residual_capacity = get(edge_residual_capacity, g);
    rev = get(edge_reverse, g);

    auto add_edge_with_capacity = [&](Traits::vertex_descriptor u, Traits::vertex_descriptor v, long cap, long cost) {
        auto e = add_edge(u, v, g).first;
        auto rev_e = add_edge(v, u, g).first;
        capacity[e] = cap;
        weight[e] = cost;
        rev[e] = rev_e;
        capacity[rev_e] = 0;
        weight[rev_e] = -cost;
        rev[rev_e] = e;
    };
    // Pin Array to periphery tiles
    for (int i = 0; i < component.rows(); ++i)
    {
        for (int j = 0; j < component.columns(); ++j)
        {
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles_E.at(i).at(j), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles_N.at(i + 1).at(j), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles_S.at(i).at(j + 1), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles_W.at(i + 1).at(j + 1), 1, 0);
        }
    }
    // Periphery tiles to periphery tiles and intra-edges
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (int j = 0; j < component.columns() + 1; ++j)
        {
            // intra-edges
            add_edge_with_capacity(m_tiles_N.at(i).at(j), m_tiles_C.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_tiles_S.at(i).at(j), m_tiles_C.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_tiles_E.at(i).at(j), m_tiles_C.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_tiles_W.at(i).at(j), m_tiles_C.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_tiles_C.at(i).at(j), m_d_tiles_C.at(i).at(j), 1, 0);
            add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_tiles_N.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_tiles_S.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_tiles_E.at(i).at(j), INF, 0);
            add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_tiles_W.at(i).at(j), INF, 0);
            // periphery tiles to periphery tiles

            if (i > 0)
                add_edge_with_capacity(m_tiles_S.at(i).at(j), m_tiles_N.at(i - 1).at(j), 1, 1);
            if (j > 0)
                add_edge_with_capacity(m_tiles_W.at(i).at(j), m_tiles_E.at(i).at(j - 1), 1, 1);
            if (i < component.rows())
                add_edge_with_capacity(m_tiles_N.at(i).at(j), m_tiles_S.at(i + 1).at(j), 1, 1);
            if (j < component.columns())
                add_edge_with_capacity(m_tiles_E.at(i).at(j), m_tiles_W.at(i).at(j + 1), 1, 1);
        }
    }
    // Center tiles to rows and columns
    // Note layer start from 1
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (int j = 0; j < component.columns() + 1; ++j)
        {
            for (size_t k = 1; k < maximum_layer; ++k)
            {
                add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_rows.at(i).at(k), 1, 0);
            }
        }
    }
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (int j = 0; j < component.columns() + 1; ++j)
        {
            for (size_t k = 1; k < maximum_layer; ++k)
            {
                add_edge_with_capacity(m_d_tiles_C.at(i).at(j), m_columns.at(j).at(k), 1, 0);
            }
        }
    }
    // Row and Columns to dummy
    for (int i = 0; i < component.rows() + 1; ++i)
    {
        for (size_t j = 1; j < maximum_layer; ++j)
        {
            for (int cap = 1; cap <= (1 + maximum_via_count * 2); cap += 2)
                add_edge_with_capacity(m_rows.at(i).at(j), m_d_rows.at(i).at(j), 1, cap);
        }
    }
    for (int i = 0; i < component.columns() + 1; ++i)
    {
        for (size_t j = 1; j < maximum_layer; ++j)
        {
            for (int cap = 1; cap <= (1 + maximum_via_count * 2); cap += 2)
                add_edge_with_capacity(m_columns.at(i).at(j), m_d_columns.at(i).at(j), 1, cap);
        }
    }
    // Source to Pins
    for (int i = 0; i < component.rows(); ++i)
    {
        for (int j = 0; j < component.columns(); ++j)
        {
            if (component.pin_arr().at(i).at(j))
            {
                add_edge_with_capacity(s, m_v.at(i).at(j), 1, 0);
            }
        }
    }
    // Decide Rows to target or columns to target
    bool horiontal_stack = false, vertical_stack = false;
    for (auto &comp_pair : data_manager.components())
    {
        auto &comp = comp_pair.second;
        if (comp->comp_name() == component.comp_name())
            continue;
        if (std::abs(std::ceil(comp->bottom_left().x()) - std::ceil(component.bottom_left().x())) < threshold &&
            std::abs(std::ceil(comp->top_right().x()) - std::ceil(component.top_right().x())) < threshold)
        {
            vertical_stack = true;
        }
        if (std::abs(std::ceil(comp->bottom_left().y()) - std::ceil(component.bottom_left().y())) < threshold &&
            std::abs(std::ceil(comp->top_right().y()) - std::ceil(component.top_right().y())) < threshold)
        {
            horiontal_stack = true;
        }
    }
    if (vertical_stack && horiontal_stack)
        std::runtime_error("Error: Component " + component.comp_name() + " is both vertical and horizontal stacked");
    else if (horiontal_stack)
    {
        for (int i = 0; i < component.rows() + 1; ++i)
        {
            for (size_t j = 1; j < maximum_layer; ++j)
            {
                add_edge_with_capacity(m_d_rows.at(i).at(j), t, maximum_via_count, 0);
            }
        }
    }
    else if (vertical_stack)
    {
        for (int i = 0; i < component.columns() + 1; ++i)
        {
            for (size_t j = 1; j < maximum_layer; ++j)
            {
                add_edge_with_capacity(m_d_columns.at(i).at(j), t, maximum_via_count, 0);
            }
        }
    }
    else
    {
#ifdef VERBOSE
        std::cout << component.comp_name() << " is CPU.\n";
#endif
    }
}
void GraphManager::minCostMaxFlow(Router &router)
{
    // Calculate minimum cost maximum flow
    successive_shortest_path_nonnegative_weights(g, s, t);
    long cost = find_flow_cost(g);
    long total_flow = 0;
    graph_traits<Graph>::out_edge_iterator out_ei, out_e_end;
    for (tie(out_ei, out_e_end) = out_edges(vertex(s, g), g); out_ei != out_e_end; ++out_ei)
    {
        total_flow += capacity[*out_ei] - residual_capacity[*out_ei];
    }

    std::regex vertex_pattern("v([0-9])_([0-9])");
    std::regex tile_pattern("([NSEW])([0-9])_([0-9])");
    std::regex d_tile_pattern("dC([0-9])_([0-9])");
    std::regex row_pattern("r([0-9])_([0-9])");
    std::regex column_pattern("c([0-9])_([0-9])");
    std::smatch match_source, match_target;
    Coordinate tile_bottom_left = Coordinate(m_component->bottom_left().x() - (m_component->tile_width() / 2),
                                             m_component->bottom_left().y() - (m_component->tile_height() / 2),
                                             m_component->bottom_left().z());
    // Display flow on each edge
    graph_traits<Graph>::edge_iterator ei, ei_end;
    for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    {
        long flow = capacity[*ei] - residual_capacity[*ei];
        if (flow > 0)
        {
            std::string source_name = m_vertex_names[source(*ei, g)];
            std::string target_name = m_vertex_names[target(*ei, g)];
            // vertex to tile
            if (std::regex_match(source_name, match_source, vertex_pattern) &&
                std::regex_match(target_name, match_target, tile_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_i = std::stoi(match_target[2].str());
                int t_j = std::stoi(match_target[3].str());
                auto &pin_arr = m_component->pin_arr();
                router.addSegment(Segment{pin_arr.at(s_i).at(s_j)->coordinate(),
                                          Coordinate{tile_bottom_left.x() + (t_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (t_i * m_component->tile_height()),
                                                     tile_bottom_left.z()}});
            }
            // tile to tile
            if (std::regex_match(source_name, match_source, tile_pattern) &&
                std::regex_match(target_name, match_target, tile_pattern))
            {
                int s_i = std::stoi(match_source[2].str());
                int s_j = std::stoi(match_source[3].str());
                int t_i = std::stoi(match_target[2].str());
                int t_j = std::stoi(match_target[3].str());
                router.addSegment(Segment{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     tile_bottom_left.z()},
                                          Coordinate{tile_bottom_left.x() + (t_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (t_i * m_component->tile_height()),
                                                     tile_bottom_left.z()}});
            }
            // dummy center tile to row or column
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, row_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_j = std::stoi(match_target[2].str());
                router.addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                             tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                             tile_bottom_left.z()},
                                  t_j});
            }
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, column_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_j = std::stoi(match_target[2].str());
                router.addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                             tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                             tile_bottom_left.z()},
                                  t_j});
            }
        }

#ifdef VERBOSE
        if (flow > 0) // Show only edges with flow
            std::cout << "Edge from " << m_vertex_names[source(*ei, g)] << " to " << m_vertex_names[target(*ei, g)]
                      << " with flow " << flow << std::endl;
#endif
    }

#ifdef VERBOSE
    // Display total flow and cost
    std::cout << "Total Flow: " << total_flow << std::endl;
    std::cout << "Total Cost: " << cost << std::endl;
#endif
}