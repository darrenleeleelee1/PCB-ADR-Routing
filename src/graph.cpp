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
void GraphManager::add_v(Graph &g, TileNode &tile_node, std::string name)
{
    tile_node.N() = add_vertex(g);
    tile_node.S() = add_vertex(g);
    tile_node.E() = add_vertex(g);
    tile_node.W() = add_vertex(g);
    tile_node.C() = add_vertex(g);
    tile_node.d_C() = add_vertex(g);
    m_vertex_names[tile_node.N()] = "N" + name;
    m_vertex_names[tile_node.S()] = "S" + name;
    m_vertex_names[tile_node.E()] = "E" + name;
    m_vertex_names[tile_node.W()] = "W" + name;
    m_vertex_names[tile_node.C()] = "C" + name;
    m_vertex_names[tile_node.d_C()] = "dC" + name;
}

GraphManager::GraphManager(DataManager &data_manager, Component &component, int expand, size_t maximum_layer)
{
    m_data_manager = &data_manager;
    m_component = &component;
    int maximum_via_count = 1; // One via per row(column) of one layer
    int num_pin_rows = component.rows();
    int num_pin_columns = component.columns();
    int num_tile_rows = component.rows() + 1 + (!m_component->is_verticle_stack() ? expand : 0);
    int num_tile_columns = component.columns() + 1 + (m_component->is_verticle_stack() ? expand : 0);
    int num_layers = std::min(maximum_layer, data_manager.layers().size());
    int base_tile_row_idx = (!m_component->is_verticle_stack() ? expand : 0);
    int base_tile_column_idx = (m_component->is_verticle_stack() ? expand : 0);
    // Create the graph
    g = Graph();
    // Create the source and sink
    // Pin array is rows * columns
    m_v = std::vector<std::vector<Traits::vertex_descriptor>>(num_pin_rows,
                                                              std::vector<Traits::vertex_descriptor>(num_pin_columns));
    // Tiles are (rows + 1 * columns + 1) * 6
    m_tiles = std::vector<std::vector<TileNode>>(num_tile_rows, std::vector<TileNode>(num_tile_columns));
    m_rows = std::vector<std::vector<Traits::vertex_descriptor>>(num_tile_rows,
                                                                 std::vector<Traits::vertex_descriptor>(num_layers));
    m_d_rows = std::vector<std::vector<Traits::vertex_descriptor>>(num_tile_rows,
                                                                   std::vector<Traits::vertex_descriptor>(num_layers));
    // Columns are (columns + 1) * layers * 2
    m_columns = std::vector<std::vector<Traits::vertex_descriptor>>(num_tile_columns,
                                                                    std::vector<Traits::vertex_descriptor>(num_layers));
    m_d_columns = std::vector<std::vector<Traits::vertex_descriptor>>(
        num_tile_columns, std::vector<Traits::vertex_descriptor>(num_layers));
    // All the vertex are
    // [num_pin_rows * num_pin_columns + (num_tile_rows * num_tile_columns * 6) + (num_tile_rows * num_layers * 2) + 2]
    m_vertex_names =
        std::vector<std::string>((num_pin_rows * num_pin_columns) + (num_tile_rows * num_tile_columns * 6) +
                                 (num_tile_rows * num_layers * 2) + (num_tile_columns * num_layers * 2) + 2);
    add_v(g, s, "s");
    add_v(g, t, "t");

    for (int i = 0; i < num_pin_rows; ++i)
    {
        for (int j = 0; j < num_pin_columns; ++j)
        {
            add_v(g, m_v.at(i).at(j), "v" + std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; ++j)
        {
            add_v(g, m_tiles.at(i).at(j), std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (size_t j = 0; j < maximum_layer; ++j)
        {
            add_v(g, m_rows.at(i).at(j), "r" + std::to_string(i) + "_" + std::to_string(j));
            add_v(g, m_d_rows.at(i).at(j), "dr" + std::to_string(i) + "_" + std::to_string(j));
        }
    }
    for (int i = 0; i < num_tile_columns; ++i)
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
    for (int i = 0; i < num_pin_rows; ++i)
    {
        for (int j = 0; j < num_pin_columns; ++j)
        {
            int shift_i = base_tile_row_idx + i;
            int shift_j = base_tile_column_idx + j;
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i).at(shift_j).E(), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i + 1).at(shift_j).S(), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i).at(shift_j + 1).N(), 1, 0);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i + 1).at(shift_j + 1).W(), 1, 0);
        }
    }
    // Periphery tiles to periphery tiles and intra-edges
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; ++j)
        {
            // intra-edges
            add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i).at(j).C(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i).at(j).C(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j).C(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j).C(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).C(), m_tiles.at(i).at(j).d_C(), 1, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).N(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).S(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).E(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).W(), INF, 0);
            // periphery tiles to periphery tiles

            if (i > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i - 1).at(j).N(), 1, 1);
            if (j > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j - 1).E(), 1, 1);
            if (i < component.rows())
                add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i + 1).at(j).S(), 1, 1);
            if (j < component.columns())
                add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j + 1).W(), 1, 1);
        }
    }
    // Center tiles to rows and columns
    // Note layer start from 1
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; ++j)
        {
            for (size_t k = 1; k < maximum_layer; ++k)
            {
                add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_rows.at(i).at(k), 1, 0);
            }
        }
    }
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; ++j)
        {
            for (size_t k = 1; k < maximum_layer; ++k)
            {
                add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_columns.at(j).at(k), 1, 0);
            }
        }
    }
    // Row and Columns to dummy
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (size_t j = 1; j < maximum_layer; ++j)
        {
            for (int cap = 1; cap <= (1 + maximum_via_count * 2); cap += 2)
                add_edge_with_capacity(m_rows.at(i).at(j), m_d_rows.at(i).at(j), 1, cap);
        }
    }
    for (int i = 0; i < num_tile_columns; ++i)
    {
        for (size_t j = 1; j < maximum_layer; ++j)
        {
            for (int cap = 1; cap <= (1 + maximum_via_count * 2); cap += 2)
                add_edge_with_capacity(m_columns.at(i).at(j), m_d_columns.at(i).at(j), 1, cap);
        }
    }
    // Source to Pins
    for (int i = 0; i < num_pin_rows; ++i)
    {
        for (int j = 0; j < num_pin_columns; ++j)
        {
            if (component.pin_arr().at(i).at(j))
            {
                add_edge_with_capacity(s, m_v.at(i).at(j), 1, 0);
            }
        }
    }
    // Decide Rows to target or columns to target
    if (m_component->is_cpu())
        return;
    else if (!m_component->is_verticle_stack())
    {
        for (int i = 0; i < num_tile_rows; ++i)
        {
            for (size_t j = 1; j < maximum_layer; ++j)
            {
                add_edge_with_capacity(m_d_rows.at(i).at(j), t, maximum_via_count, 0);
            }
        }
    }
    else if (m_component->is_verticle_stack())
    {
        for (int i = 0; i < num_tile_columns; ++i)
        {
            for (size_t j = 1; j < maximum_layer; ++j)
            {
                add_edge_with_capacity(m_d_columns.at(i).at(j), t, maximum_via_count, 0);
            }
        }
    }
}
long GraphManager::minCostMaxFlow()
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

#ifdef VERBOSE
    // Display flow on each edge
    // graph_traits<Graph>::edge_iterator ei, ei_end;
    // for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    // {
    //     long flow = capacity[*ei] - residual_capacity[*ei];
    //     if (flow > 0) // Show only edges with flow
    //         std::cout << "Edge from " << m_vertex_names[source(*ei, g)] << " to " << m_vertex_names[target(*ei, g)]
    //                   << " with flow " << flow << std::endl;
    // }
    // Display total flow and cost
    std::cout << m_component->comp_name() << std::endl;
    std::cout << "Total Flow: " << total_flow << std::endl;
    std::cout << "Total Cost: " << cost << std::endl;
#endif
    return total_flow;
}
void GraphManager::via_assignment(Router &router)
{
    std::regex vertex_pattern("v([0-9])_([0-9])");
    std::regex tile_pattern("([NSEW])([0-9])_([0-9])");
    std::regex d_tile_pattern("dC([0-9])_([0-9])");
    std::regex row_pattern("r([0-9])_([0-9])");
    std::regex column_pattern("c([0-9])_([0-9])");
    std::smatch match_source, match_target;
    int shift_rows = m_rows.size() - m_v.size() - 1;
    int shift_columns = m_columns.size() - m_v.at(0).size() - 1;
    Coordinate tile_bottom_left = Coordinate(
        m_component->bottom_left().x() - (m_component->tile_width() / 2) - (shift_columns * m_component->tile_width()),
        m_component->bottom_left().y() - (m_component->tile_height() / 2) - (shift_rows * m_component->tile_height()),
        m_component->bottom_left().z());
    std::unordered_map<int, int> row_or_col_via_count;
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
                int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                router.addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                             tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                             tile_bottom_left.z()},
                                  t_j});
                // Count the row's vias
                // if (row_or_col_via_count.find(t_i) == row_or_col_via_count.end())
                //     row_or_col_via_count[t_i] = 1;
                // else
                //     row_or_col_via_count[t_i]++;
            }
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, column_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                router.addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                             tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                             tile_bottom_left.z()},
                                  t_j});
                // Count the column's vias
                // if (row_or_col_via_count.find(t_i) == row_or_col_via_count.end())
                //     row_or_col_via_count[t_i] = 1;
                // else
                //     row_or_col_via_count[t_i]++;
            }
        }
    }
    // After via assignment, assign edges to boundry
    for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    {
        long flow = capacity[*ei] - residual_capacity[*ei];
        if (flow > 0)
        {
            std::string source_name = m_vertex_names[source(*ei, g)];
            std::string target_name = m_vertex_names[target(*ei, g)];
            // dummy center tile to row or column
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, row_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                if (m_component->neighboors().at(0))
                {
                    // left have neighboor
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate left_pin_coor = Coordinate{
                        tile_bottom_left.x() + (s_j * m_component->tile_width()) - (m_component->tile_width() / 2),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) - (m_component->tile_height() / 2),
                        t_j};
                    Coordinate left_bound = Coordinate{tile_bottom_left.x() - m_component->tile_width(),
                                                       tile_bottom_left.y() + (s_i * m_component->tile_height()) -
                                                           (m_component->tile_height() / 2),
                                                       t_j};
                    router.addSegment(Segment{via_coor, left_pin_coor});
                    router.addSegment(Segment{left_pin_coor, left_bound});
                }
                if (m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate right_pin_coor = Coordinate{
                        tile_bottom_left.x() + (s_j * m_component->tile_width()) + (m_component->tile_width() / 2),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) - (m_component->tile_height() / 2),
                        t_j};
                    Coordinate right_bound = Coordinate{
                        tile_bottom_left.x() + (m_component->tile_width() * (m_component->columns() + shift_columns)) +
                            m_component->tile_width(),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) - (m_component->tile_height() / 2),
                        t_j};
                    router.addSegment(Segment{via_coor, right_pin_coor});
                    router.addSegment(Segment{right_pin_coor, right_bound});
                }
            }
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, column_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                if (m_component->neighboors().at(0))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate top_pin_coor = Coordinate{
                        tile_bottom_left.x() + (s_j * m_component->tile_width()) + (m_component->tile_width() / 2),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) + (m_component->tile_height() / 2),
                        t_j};
                    Coordinate top_bound = Coordinate{
                        tile_bottom_left.x() + (s_j * m_component->tile_width()) + (m_component->tile_width() / 2),
                        tile_bottom_left.y() + (m_component->tile_height() * (m_component->rows() + shift_rows)) +
                            m_component->tile_height(),
                        t_j};
                    router.addSegment(Segment{via_coor, top_pin_coor});
                    router.addSegment(Segment{top_pin_coor, top_bound});
                }
                if (m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate bottom_pin_coor = Coordinate{
                        tile_bottom_left.x() + (s_j * m_component->tile_width()) + (m_component->tile_width() / 2),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) - (m_component->tile_height() / 2),
                        t_j};
                    Coordinate bottom_bound = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()) +
                                                             (m_component->tile_width() / 2),
                                                         tile_bottom_left.y() - m_component->tile_height(),
                                                         t_j};
                    router.addSegment(Segment{via_coor, bottom_pin_coor});
                    router.addSegment(Segment{bottom_pin_coor, bottom_bound});
                }
            }
        }
    }
}