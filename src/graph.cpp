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
Graph GraphManager::reverseGraph(Graph &g)
{
    Graph rg;
    graph_traits<Graph>::edge_iterator ei, ei_end;
    for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    {
        long flow = capacity[*ei] - residual_capacity[*ei];
        if (flow > 0) // Show only edges with flow
        {
            Traits::vertex_descriptor u = source(*ei, g);
            Traits::vertex_descriptor v = target(*ei, g);
            auto e = add_edge(v, u, rg).first;
            auto rev_e = add_edge(u, v, rg).first;
            capacity[e] = flow;
            weight[e] = -weight[*ei];
            rev[e] = rev_e;
            capacity[rev_e] = 0;
            weight[rev_e] = weight[*ei];
            rev[rev_e] = e;
        }
    }
    return rg;
}

void GraphManager::fixFlowResults()
{
    graph_traits<Graph>::edge_iterator ei, ei_end;
    for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    {
        int flow = capacity[*ei] - residual_capacity[*ei];
        if (flow > 0)
        {
            stored_capacity_and_residual[*ei] =
                std::make_pair(capacity[*ei], residual_capacity[*ei]); // 记录原始的容量和残余容量
            residual_capacity[rev[*ei]] = 0; // 确保反向边的残余容量设置正确
            capacity[*ei] = 0; // 固定流量结果，防止后续计算修改
        }
    }
}

void GraphManager::restoreFlowResults()
{
    for (const auto &pair : stored_capacity_and_residual)
    {
        capacity[pair.first] = pair.second.first;
        residual_capacity[pair.first] = pair.second.second;
    }
}

void GraphManager::addSource2Pins(Component &component, std::unordered_set<int> &pinset)

// For DDR2DDR
{
    int num_pin_rows = component.pin_arr().size();
    int num_pin_columns = component.pin_arr().at(0).size();
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
    // Source to Pins
    for (int i = 0; i < num_pin_rows; ++i)
    {
        for (int j = 0; j < num_pin_columns; ++j)
        {
            if (component.pin_arr().at(i).at(j))
            {
                if (pinset.count(component.pin_arr().at(i).at(j)->net_id()))
                {

                    add_edge_with_capacity(s, m_v.at(i).at(j), 1, 0);
                }
            }
        }
    }
}
void GraphManager::DDR2DDRInit(DataManager &data_manager, Component &component, int expand, size_t maximum_layer)
{
    if (component.is_cpu())
    {
        throw std::runtime_error("Component is CPU but calling DDR2DDRInit");
    }
    m_data_manager = &data_manager;
    m_component = &component;
    int maximum_via_count = 1; // One via per row(column) of one layer
    int num_pin_rows = component.rows();
    int num_pin_columns = component.columns();
    int num_tile_rows = component.rows() + 1 + (!m_component->is_vertical_stack() ? expand : 0);
    int num_tile_columns = component.columns() + 1 + (m_component->is_vertical_stack() ? expand : 0);
    int num_layers = std::min(maximum_layer, data_manager.layers().size());
    int base_tile_row_idx = (!m_component->is_vertical_stack() ? expand : 0);
    int base_tile_column_idx = (m_component->is_vertical_stack() ? expand : 0);
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

            int top_right_cost = 1, top_left_cost = 1;
            int bot_right_cost = 1, bot_left_cost = 1;

            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i).at(shift_j).E(), 1, bot_left_cost);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i + 1).at(shift_j).S(), 1, top_left_cost);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i).at(shift_j + 1).N(), 1, bot_right_cost);
            add_edge_with_capacity(m_v.at(i).at(j), m_tiles.at(shift_i + 1).at(shift_j + 1).W(), 1, top_right_cost);
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

            int bloat_tile_cost = 1;
            // bloat_tile_cost = (j <= 3) ? 10 : 1;

            if (i > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i - 1).at(j).N(), 1, 1 * bloat_tile_cost);
            if (j > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j - 1).E(), 1, 1 * bloat_tile_cost);
            if (i < component.rows())
                add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i + 1).at(j).S(), 1, 1 * bloat_tile_cost);
            if (j < component.columns())
                add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j + 1).W(), 1, 1 * bloat_tile_cost);
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
            {
                add_edge_with_capacity(m_rows.at(i).at(j), m_d_rows.at(i).at(j), 1, 1);
            }
        }
    }
    for (int i = 0; i < num_tile_columns; ++i)
    {
        for (size_t j = 1; j < maximum_layer; ++j)
        {
            for (int cap = 1; cap <= (1 + maximum_via_count * 2); cap += 2)
            {
                add_edge_with_capacity(m_columns.at(i).at(j), m_d_columns.at(i).at(j), 1, 1);
            }
        }
    }
    // Decide Rows to target or columns to target
    if (m_component->is_cpu())
        return;
    else if (!m_component->is_vertical_stack())
    {
        for (int i = 0; i < num_tile_rows; ++i)
        {
            for (size_t j = 1; j < maximum_layer; ++j)
            {
                add_edge_with_capacity(m_d_rows.at(i).at(j), t, maximum_via_count, 0);
            }
        }
    }
    else if (m_component->is_vertical_stack())
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
// For CPU2DDR
void GraphManager::CPU2DDRInit(DataManager &data_manager,
                               Component &component,
                               double wire_spacing,
                               double wire_width,
                               double bump_ball_radius,
                               std::string escape_boundry)
{
    if (!component.is_cpu())
    {
        throw std::runtime_error("Component is not CPU but calling CPU2DDR constructor");
    }
    m_data_manager = &data_manager;
    m_component = &component;
    int num_pin_rows = component.rows();
    int num_pin_columns = component.columns();
    int num_tile_rows = component.rows() + 1;
    int num_tile_columns = component.columns() + 1;
    int base_tile_row_idx = 0;
    int base_tile_column_idx = 0;
    double tile_height_with_bump_ball = component.tile_height() - 2 * bump_ball_radius;
    double tile_width_with_bump_ball = component.tile_width() - 2 * bump_ball_radius;
    int o_hor_cap = std::floor(tile_height_with_bump_ball / (wire_spacing + wire_width));
    int o_ver_cap = std::floor(tile_width_with_bump_ball / (wire_spacing + wire_width));
    int o_cap = std::min(o_hor_cap, o_ver_cap);
    int d_cap = std::floor((std::sqrt(tile_height_with_bump_ball * tile_height_with_bump_ball +
                                      tile_width_with_bump_ball * tile_width_with_bump_ball)) /
                           (wire_spacing + wire_width));
#ifdef VERBOSE
    // std::cout << "o_cap: " << o_cap << std::endl;
    // std::cout << "d_cap: " << d_cap << std::endl;
    // std::cout << "d_cap - 2 * std::floor(o_cap / 2): " << d_cap - 2 * std::floor(o_cap / 2) << std::endl;
#endif
    // Create the graph
    // Create the graph
    g = Graph();
    // Create the source and sink

    // Pin array is rows * columns
    m_v = std::vector<std::vector<Traits::vertex_descriptor>>(num_pin_rows,
                                                              std::vector<Traits::vertex_descriptor>(num_pin_columns));
    // Tiles are (rows + 1 * columns + 1) * 6
    m_tiles = std::vector<std::vector<TileNode>>(num_tile_rows, std::vector<TileNode>(num_tile_columns));
    // All the vertex are
    // [num_pin_rows * num_pin_columns + (num_tile_rows * num_tile_columns * 6) + (num_tile_rows * num_layers * 2) + 2]
    m_vertex_names =
        std::vector<std::string>((num_pin_rows * num_pin_columns) + (num_tile_rows * num_tile_columns * 6) + 2);

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
            add_edge_with_capacity(
                m_tiles.at(i).at(j).C(), m_tiles.at(i).at(j).d_C(), d_cap - 2 * std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).N(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).S(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).E(), INF, 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).d_C(), m_tiles.at(i).at(j).W(), INF, 0);

            add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i).at(j).W(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i).at(j).E(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j).N(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j).S(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i).at(j).E(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i).at(j).W(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j).S(), std::floor(o_cap / 2), 0);
            add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j).N(), std::floor(o_cap / 2), 0);
            // periphery tiles to periphery tiles

            if (i > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).S(), m_tiles.at(i - 1).at(j).N(), o_cap, 1);
            if (j > 0)
                add_edge_with_capacity(m_tiles.at(i).at(j).W(), m_tiles.at(i).at(j - 1).E(), o_cap, 1);
            if (i < component.rows())
                add_edge_with_capacity(m_tiles.at(i).at(j).N(), m_tiles.at(i + 1).at(j).S(), o_cap, 1);
            if (j < component.columns())
                add_edge_with_capacity(m_tiles.at(i).at(j).E(), m_tiles.at(i).at(j + 1).W(), o_cap, 1);
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
    // Tiles to Target and Pins to Target
    for (auto character : escape_boundry)
    {
        switch (character)
        {
        case 'N':
            for (int i = 0; i < num_tile_columns; ++i)
            {
                add_edge_with_capacity(m_tiles.at(num_tile_rows - 1).at(i).N(), t, o_cap, 0);
            }
            for (int i = 0; i < num_pin_columns; ++i)
            {
                if (component.pin_arr().at(num_pin_rows - 1).at(i))
                {
                    add_edge_with_capacity(m_v.at(num_pin_rows - 1).at(i), t, 1, 0);
                }
            }
            break;
        case 'S':
            for (int i = 0; i < num_tile_columns; ++i)
            {
                add_edge_with_capacity(m_tiles.at(0).at(i).S(), t, o_cap, 0);
            }
            for (int i = 0; i < num_pin_columns; ++i)
            {
                if (component.pin_arr().at(0).at(i))
                {
                    add_edge_with_capacity(m_v.at(0).at(i), t, 1, 0);
                }
            }
            break;
        case 'E':
            for (int i = 0; i < num_tile_rows; ++i)
            {
                add_edge_with_capacity(m_tiles.at(i).at(num_tile_columns - 1).E(), t, o_cap, 0);
            }
            for (int i = 0; i < num_pin_rows; ++i)
            {
                if (component.pin_arr().at(i).at(num_pin_columns - 1))
                {
                    add_edge_with_capacity(m_v.at(i).at(num_pin_columns - 1), t, 1, 0);
                }
            }
            break;
        case 'W':
            for (int i = 0; i < num_tile_rows; ++i)
            {
                add_edge_with_capacity(m_tiles.at(i).at(0).W(), t, o_cap, 0);
            }
            for (int i = 0; i < num_pin_rows; ++i)
            {
                if (component.pin_arr().at(i).at(0))
                {
                    add_edge_with_capacity(m_v.at(i).at(0), t, 1, 0);
                }
            }
            break;
        default: throw std::runtime_error("Invalid escape boundry character");
        }
    }
}

long GraphManager::minCostMaxFlow()
{
    // Calculate minimum cost maximum flow
    successive_shortest_path_nonnegative_weights(g, s, t); // 直接用於求解最小費用最大流問題。
    // 先用 Edmonds-Karp 求最大流，再用 Cycle Canceling 優化流量成本。
    // edmonds_karp_max_flow(g, s, t);
    // cycle_canceling(g);

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

std::pair<Coordinate, Coordinate> GraphManager::DDR2DDR(std::shared_ptr<Router> router)
{
    std::regex vertex_pattern("v([0-9]{1,2})_([0-9]{1,2})");
    std::regex tile_pattern("([NSEW])([0-9]{1,2})_([0-9]{1,2})");
    std::regex d_tile_pattern("dC([0-9]{1,2})_([0-9]{1,2})");
    std::regex row_pattern("r([0-9]{1,2})_([0-9]{1,2})");
    std::regex column_pattern("c([0-9]{1,2})_([0-9]{1,2})");
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
                router->addSegment(Segment{pin_arr.at(s_i).at(s_j)->coordinate(),
                                           Coordinate{tile_bottom_left.x() + (t_j * m_component->tile_width()),
                                                      tile_bottom_left.y() + (t_i * m_component->tile_height()),
                                                      tile_bottom_left.z()},
                                           pin_arr.at(s_i).at(s_j)->net_id()});
            }
            // tile to tile
            if (std::regex_match(source_name, match_source, tile_pattern) &&
                std::regex_match(target_name, match_target, tile_pattern))
            {
                int s_i = std::stoi(match_source[2].str());
                int s_j = std::stoi(match_source[3].str());
                int t_i = std::stoi(match_target[2].str());
                int t_j = std::stoi(match_target[3].str());
                router->addSegment(Segment{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                      tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                      tile_bottom_left.z()},
                                           Coordinate{tile_bottom_left.x() + (t_j * m_component->tile_width()),
                                                      tile_bottom_left.y() + (t_i * m_component->tile_height()),
                                                      tile_bottom_left.z()},
                                           -1});
            }
            // dummy center tile to row or column
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, row_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                // int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                router->addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                              tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                              tile_bottom_left.z()},
                                   t_j});
                // // from via tace back to which pin
                // for (auto &s : router->segments())
                // {
                // }
            }
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, column_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                // int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                router->addVia(Via{Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                              tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                              tile_bottom_left.z()},
                                   t_j});
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
                // int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                // set wire bound
                m_component->wire_bound().at(0) = tile_bottom_left.x() - m_component->tile_width();
                m_component->wire_bound().at(1) =
                    tile_bottom_left.x() + (m_component->tile_width() * (m_component->columns() + shift_columns)) +
                    m_component->tile_width();
                if (m_component->neighboors().at(0) && m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend =
                        Coordinate{via_coor.x() - 1.5 * m_data_manager->minimum_segment(), via_coor.y(), via_coor.z()};
                    Coordinate second_bend = Coordinate{first_bend.x() - (m_component->tile_width() / 2),
                                                        first_bend.y() - (m_component->tile_height() / 2),
                                                        first_bend.z()};
                    Coordinate left_bound =
                        Coordinate{tile_bottom_left.x() - m_component->tile_width(), second_bend.y(), t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, second_bend, -1});
                    router->addSegment(Segment{second_bend, left_bound, -1});

                    first_bend =
                        Coordinate{via_coor.x() + 1.5 * m_data_manager->minimum_segment(), via_coor.y(), via_coor.z()};
                    second_bend = Coordinate{first_bend.x() + (m_component->tile_width() / 2),
                                             first_bend.y() - (m_component->tile_height() / 2),
                                             first_bend.z()};
                    Coordinate right_bound = Coordinate{
                        tile_bottom_left.x() + (m_component->tile_width() * (m_component->columns() + shift_columns)) +
                            m_component->tile_width(),
                        second_bend.y(),
                        t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, second_bend, -1});
                    router->addSegment(Segment{second_bend, right_bound, -1});
                }
                else if (m_component->neighboors().at(0))
                {
                    // left have neighboor
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend = Coordinate{via_coor.x() - (m_component->tile_width() / 2),
                                                       via_coor.y() - (m_component->tile_height() / 2),
                                                       via_coor.z()};
                    Coordinate left_bound = Coordinate{tile_bottom_left.x() - m_component->tile_width(),
                                                       tile_bottom_left.y() + (s_i * m_component->tile_height()) -
                                                           (m_component->tile_height() / 2),
                                                       t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, left_bound, -1});
                }
                else if (m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend = Coordinate{via_coor.x() + (m_component->tile_width() / 2),
                                                       via_coor.y() - (m_component->tile_height() / 2),
                                                       via_coor.z()};
                    Coordinate right_bound = Coordinate{
                        tile_bottom_left.x() + (m_component->tile_width() * (m_component->columns() + shift_columns)) +
                            m_component->tile_width(),
                        tile_bottom_left.y() + (s_i * m_component->tile_height()) - (m_component->tile_height() / 2),
                        t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, right_bound, -1});
                }
            }
            if (std::regex_match(source_name, match_source, d_tile_pattern) &&
                std::regex_match(target_name, match_target, column_pattern))
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                // int t_i = std::stoi(match_target[1].str());
                int t_j = std::stoi(match_target[2].str());
                // set wire bound
                m_component->wire_bound().at(0) = tile_bottom_left.y() +
                                                  (m_component->tile_height() * (m_component->rows() + shift_rows)) +
                                                  m_component->tile_height();
                m_component->wire_bound().at(1) = tile_bottom_left.y() - m_component->tile_height();
                if (m_component->neighboors().at(0) && m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend =
                        Coordinate{via_coor.x(), via_coor.y() + 1.5 * m_data_manager->minimum_segment(), via_coor.z()};
                    Coordinate second_bend = Coordinate{first_bend.x() - (m_component->tile_width() / 2),
                                                        first_bend.y() + (m_component->tile_height() / 2),
                                                        first_bend.z()};
                    Coordinate top_bound = Coordinate{
                        second_bend.x(),
                        tile_bottom_left.y() + (m_component->tile_height() * (m_component->rows() + shift_rows)) +
                            m_component->tile_height(),
                        t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, second_bend, -1});
                    router->addSegment(Segment{second_bend, top_bound, -1});

                    first_bend =
                        Coordinate{via_coor.x(), via_coor.y() - 1.5 * m_data_manager->minimum_segment(), via_coor.z()};
                    second_bend = Coordinate{first_bend.x() - (m_component->tile_width() / 2),
                                             first_bend.y() - (m_component->tile_height() / 2),
                                             first_bend.z()};
                    Coordinate bottom_bound =
                        Coordinate{second_bend.x(), tile_bottom_left.y() - m_component->tile_height(), t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, second_bend, -1});
                    router->addSegment(Segment{second_bend, bottom_bound, -1});
                }
                else if (m_component->neighboors().at(0))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend = Coordinate{via_coor.x() - (m_component->tile_width() / 2),
                                                       via_coor.y() + (m_component->tile_height() / 2),
                                                       via_coor.z()};
                    Coordinate top_bound = Coordinate{
                        first_bend.x(),
                        tile_bottom_left.y() + (m_component->tile_height() * (m_component->rows() + shift_rows)) +
                            m_component->tile_height(),
                        t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, top_bound, -1});
                }
                else if (m_component->neighboors().at(1))
                {
                    Coordinate via_coor = Coordinate{tile_bottom_left.x() + (s_j * m_component->tile_width()),
                                                     tile_bottom_left.y() + (s_i * m_component->tile_height()),
                                                     t_j};
                    Coordinate first_bend = Coordinate{via_coor.x() - (m_component->tile_width() / 2),
                                                       via_coor.y() - (m_component->tile_height() / 2),
                                                       via_coor.z()};
                    Coordinate bottom_bound =
                        Coordinate{first_bend.x(), tile_bottom_left.y() - m_component->tile_height(), t_j};
                    router->addSegment(Segment{via_coor, first_bend, -1});
                    router->addSegment(Segment{first_bend, bottom_bound, -1});
                }
            }
        }
    }

    if (m_component->is_vertical_stack())
    {
        Coordinate top_bound = Coordinate{
            tile_bottom_left.x() + (m_columns.size() * m_component->tile_width()) + (m_component->tile_width() / 2),
            tile_bottom_left.y() + (m_component->tile_height() * (m_component->rows() + shift_rows)) +
                2 * m_component->tile_height(),
            0};
        Coordinate bottom_bound =
            Coordinate{tile_bottom_left.x() + (0 * m_component->tile_width()) + (m_component->tile_width() / 2),
                       tile_bottom_left.y() - 2 * m_component->tile_height(),
                       0};

        return std::make_pair(top_bound, bottom_bound);
    }
    else
    {
        Coordinate left_bound =
            Coordinate{tile_bottom_left.x() - 2 * m_component->tile_width(),
                       tile_bottom_left.y() + (0 * m_component->tile_height()) - (m_component->tile_height() / 2),
                       0};
        Coordinate right_bound = Coordinate{
            tile_bottom_left.x() + (m_component->tile_width() * (m_component->columns() + shift_columns)) +
                2 * m_component->tile_width(),
            tile_bottom_left.y() + (m_rows.size() * m_component->tile_height()) - (m_component->tile_height() / 2),
            0};

        return std::make_pair(left_bound, right_bound);
    }
}
void tileDetailedRoute(std::shared_ptr<Router> router,
                       Component &component,
                       Coordinate tile_bottom_left,
                       char from,
                       char to,
                       int rep_from,
                       int total_from,
                       int rep_to,
                       int total_to,
                       double tile_width,
                       double tile_height)
{
    total_from++;
    total_to++;
    Coordinate tile_top_right =
        Coordinate(tile_bottom_left.x() + tile_width, tile_bottom_left.y() + tile_height, tile_bottom_left.z());
    Coordinate tile_bottom_right = Coordinate(tile_top_right.x(), tile_bottom_left.y(), tile_bottom_left.z());
    Coordinate tile_top_left = Coordinate(tile_bottom_left.x(), tile_top_right.y(), tile_bottom_left.z());
    double alpha = 0.75;
    if ((from == 'n' && to == 'e') || (from == 'e' && to == 'n'))
    {
        double x = tile_width * rep_from / total_from; // n
        double y = tile_height * rep_to / total_to; // e
        double a = alpha * std::min(x, y);

        router->addSegment(Segment{Coordinate{tile_top_right.x() - x, tile_top_right.y(), tile_top_right.z()},
                                   Coordinate{tile_top_right.x() - x, tile_top_right.y() - y + a, tile_top_right.z()},
                                   -1});
        router->addSegment(Segment{Coordinate{tile_top_right.x() - x, tile_top_right.y() - y + a, tile_top_right.z()},
                                   Coordinate{tile_top_right.x() - x + a, tile_top_right.y() - y, tile_top_right.z()},
                                   -1});
        router->addSegment(Segment{Coordinate{tile_top_right.x() - x + a, tile_top_right.y() - y, tile_top_right.z()},
                                   Coordinate{tile_top_right.x(), tile_top_right.y() - y, tile_top_right.z()},
                                   -1});
    }
    else if ((from == 'n' && to == 's') || (from == 's' && to == 'n'))
    {
        double x = tile_width * rep_from / total_from; // n
        double y = tile_width * rep_to / total_to; // s
        double a = std::abs(x - y);
        router->addSegment(
            Segment{Coordinate{tile_top_right.x() - x, tile_top_right.y(), tile_top_right.z()},
                    Coordinate{tile_top_right.x() - x, tile_bottom_right.y() + 2 * a, tile_top_right.z()},
                    -1});
        if (a > 0.0)
        {

            router->addSegment(
                Segment{Coordinate{tile_top_right.x() - x, tile_bottom_right.y() + 2 * a, tile_top_right.z()},
                        Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y() + a, tile_bottom_right.z()},
                        -1});
            router->addSegment(
                Segment{Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y() + a, tile_bottom_right.z()},
                        Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y(), tile_bottom_right.z()},
                        -1});
        }
    }
    else if ((from == 'n' && to == 'w') || (from == 'w' && to == 'n'))
    {
        double x = tile_width * rep_from / total_from; // n
        double y = tile_height * rep_to / total_to; // w
        double a = alpha * std::min(x, y);
        double x_prime = tile_width - x;
        double y_prime = tile_height - y;
        router->addSegment(
            Segment{Coordinate{tile_top_left.x() + x_prime, tile_top_left.y(), tile_top_left.z()},
                    Coordinate{tile_top_left.x() + x_prime, tile_top_left.y() - y_prime + a, tile_top_left.z()},
                    -1});

        router->addSegment(
            Segment{Coordinate{tile_top_left.x() + x_prime, tile_top_left.y() - y_prime + a, tile_top_left.z()},
                    Coordinate{tile_top_left.x() + x_prime - a, tile_top_left.y() - y_prime, tile_top_left.z()},
                    -1});
        router->addSegment(
            Segment{Coordinate{tile_top_left.x() + x_prime - a, tile_top_left.y() - y_prime, tile_top_left.z()},
                    Coordinate{tile_top_left.x(), tile_top_left.y() - y_prime, tile_top_left.z()},
                    -1});
    }
    else if ((from == 'e' && to == 's') || (from == 's' && to == 'e'))
    {
        double x = tile_height * rep_from / total_from; // e
        double y = tile_width * rep_to / total_to; // s
        double a = alpha * std::min(x, y);
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x(), tile_bottom_right.y() + x, tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - y + a, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    -1});
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x() - y + a, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y() + x - a, tile_bottom_right.z()},
                    -1});
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y() + x - a, tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - y, tile_bottom_right.y(), tile_bottom_right.z()},
                    -1});
    }
    else if ((from == 'e' && to == 'w') || (from == 'w' && to == 'e'))
    {
        double x = tile_height * rep_from / total_from; // e
        double x_prime = tile_height - x;
        double y = tile_height * rep_to / total_to; // w
        double y_prime = tile_height - y;
        double a = std::abs(std::min(x, x_prime) - std::min(y, y_prime));
        router->addSegment(Segment{Coordinate{tile_top_right.x(), tile_top_right.y() - x, tile_top_right.z()},
                                   Coordinate{tile_bottom_left.x() + 2 * a, tile_top_right.y() - x, tile_top_right.z()},
                                   -1});
        if (a > 0.0)
        {
            router->addSegment(
                Segment{Coordinate{tile_bottom_left.x() + 2 * a, tile_top_right.y() - x, tile_top_right.z()},
                        Coordinate{tile_bottom_left.x() + a, tile_bottom_left.y() + y, tile_bottom_left.z()},
                        -1});
            router->addSegment(
                Segment{Coordinate{tile_bottom_left.x() + a, tile_bottom_left.y() + y, tile_bottom_left.z()},
                        Coordinate{tile_bottom_left.x(), tile_bottom_left.y() + y, tile_bottom_left.z()},
                        -1});
        }
    }
    else if ((from == 's' && to == 'w') || (from == 'w' && to == 's'))
    {
        double x = tile_height * rep_from / total_from; // s
        double y = tile_width * rep_to / total_to; // w
        double a = alpha * std::min(x, y);
        router->addSegment(
            Segment{Coordinate{tile_bottom_left.x() + x, tile_bottom_left.y(), tile_bottom_left.z()},
                    Coordinate{tile_bottom_left.x() + x, tile_bottom_left.y() + y - a, tile_bottom_left.z()},
                    -1});
        router->addSegment(
            Segment{Coordinate{tile_bottom_left.x() + x, tile_bottom_left.y() + y - a, tile_bottom_left.z()},
                    Coordinate{tile_bottom_left.x() + x - a, tile_bottom_left.y() + y, tile_bottom_left.z()},
                    -1});
        router->addSegment(
            Segment{Coordinate{tile_bottom_left.x() + x - a, tile_bottom_left.y() + y, tile_bottom_left.z()},
                    Coordinate{tile_bottom_left.x(), tile_bottom_left.y() + y, tile_bottom_left.z()},
                    -1});
    }
    else if ((from == '{' && to == 'e') || (from == 'e' && to == '{'))
    {
        double x = tile_height * rep_to / total_to;
        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_top_left.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_top_left.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(Segment{Coordinate{tile_top_left.x(), tile_top_left.y(), tile_top_left.z()},
                                   Coordinate{tile_top_left.x() + x, tile_top_left.y() - x, tile_top_left.z()},
                                   pin->net_id()});
        router->addSegment(Segment{Coordinate{tile_top_left.x() + x, tile_top_left.y() - x, tile_top_left.z()},
                                   Coordinate{tile_top_right.x(), tile_top_right.y() - x, tile_top_right.z()},
                                   pin->net_id()});
    }
    else if ((from == '{' && to == 's') || (from == 's' && to == '{'))
    {
        double x = tile_width * rep_to / total_to;
        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_top_left.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_top_left.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(
            Segment{Coordinate{tile_top_left.x(), tile_top_left.y(), tile_top_left.z()},
                    Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    pin->net_id()});
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y(), tile_bottom_right.z()},
                    pin->net_id()});
    }
    else if ((from == '|' && to == 's') || (from == 's' && to == '|'))
    {
        double x = tile_width * rep_to / total_to;
        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_top_right.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_top_right.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(Segment{Coordinate{tile_top_right.x(), tile_top_right.y(), tile_top_right.z()},
                                   Coordinate{tile_top_right.x() - x, tile_top_right.y() - x, tile_top_right.z()},
                                   pin->net_id()});
        router->addSegment(Segment{Coordinate{tile_top_right.x() - x, tile_top_right.y() - x, tile_top_right.z()},
                                   Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y(), tile_bottom_right.z()},
                                   pin->net_id()});
    }
    else if ((from == '|' && to == 'w') || (from == 'w' && to == '|'))
    {
        double x = tile_height * rep_to / total_to;
        double x_prime = tile_width - x;

        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_top_right.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_top_right.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(
            Segment{Coordinate{tile_top_right.x(), tile_top_right.y(), tile_top_right.z()},
                    Coordinate{tile_top_right.x() - x_prime, tile_top_right.y() - x_prime, tile_top_right.z()},
                    pin->net_id()});
        router->addSegment(
            Segment{Coordinate{tile_top_right.x() - x_prime, tile_top_right.y() - x_prime, tile_top_right.z()},
                    Coordinate{tile_bottom_left.x(), tile_bottom_left.y() + x, tile_bottom_left.z()},
                    pin->net_id()});
    }
    else if ((from == '}' && to == 'n') || (from == 'n' && to == '}'))
    {
        double x = tile_width * rep_from / total_from;

        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_bottom_right.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_bottom_right.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x(), tile_bottom_right.y(), tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    pin->net_id()});
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    Coordinate{tile_top_right.x() - x, tile_top_right.y(), tile_top_right.z()},
                    pin->net_id()});
    }
    else if ((from == '}' && to == 'w') || (from == 'w' && to == '}'))
    {
        double x = tile_height * rep_to / total_to;

        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_bottom_right.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_bottom_right.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x(), tile_bottom_right.y(), tile_bottom_right.z()},
                    Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    pin->net_id()});
        router->addSegment(
            Segment{Coordinate{tile_bottom_right.x() - x, tile_bottom_right.y() + x, tile_bottom_right.z()},
                    Coordinate{tile_bottom_left.x(), tile_bottom_left.y() + x, tile_bottom_left.z()},
                    pin->net_id()});
    }
    else if ((from == '~' && to == 'n') || (from == 'n' && to == '~'))
    {
        double x = tile_width * rep_from / total_from;
        double x_prime = tile_height - x;

        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_bottom_left.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_bottom_left.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(
            Segment{Coordinate{tile_bottom_left.x(), tile_bottom_left.y(), tile_bottom_left.z()},
                    Coordinate{tile_bottom_left.x() + x_prime, tile_bottom_left.y() + x_prime, tile_bottom_left.z()},
                    pin->net_id()});
        router->addSegment(
            Segment{Coordinate{tile_bottom_left.x() + x_prime, tile_bottom_left.y() + x_prime, tile_bottom_left.z()},
                    Coordinate{tile_top_right.x() - x, tile_top_right.y(), tile_top_right.z()},
                    pin->net_id()});
    }
    else if ((from == '~' && to == 'e') || (from == 'e' && to == '~'))
    {
        double x = tile_height * rep_from / total_from;

        // find pin
        std::shared_ptr<Pin> pin = nullptr;
        for (auto &p : component.pins())
        {
            // use fabs to avoid negative zero
            if (std::fabs(p->coordinate().x() - tile_bottom_left.x()) < 5e-1 &&
                std::fabs(p->coordinate().y() - tile_bottom_left.y()) < 5e-1)
            {
                pin = p;
                break;
            }
        }
        if (pin == nullptr)
        {
            throw std::runtime_error("Pin not found");
        }

        router->addSegment(Segment{Coordinate{tile_bottom_left.x(), tile_bottom_left.y(), tile_bottom_left.z()},
                                   Coordinate{tile_bottom_left.x() + x, tile_bottom_left.y() + x, tile_bottom_left.z()},
                                   pin->net_id()});
        router->addSegment(Segment{Coordinate{tile_bottom_left.x() + x, tile_bottom_left.y() + x, tile_bottom_left.z()},
                                   Coordinate{tile_bottom_right.x(), tile_bottom_right.y() + x, tile_bottom_right.z()},
                                   pin->net_id()});
    }
    else
    {
        throw std::runtime_error("Invalid from and to: " + std::string(1, from) + ", " + std::string(1, to));
    }
}
void GraphManager::CPU2DDR(std::shared_ptr<Router> router, Component &component, std::string escape_boundry)
{
    std::regex vertex_pattern("v([0-9]{1,2})_([0-9]{1,2})");
    std::regex tile_pattern("([NSEWC])([0-9]{1,2})_([0-9]{1,2})");
    std::regex d_tile_pattern("dC([0-9]{1,2})_([0-9]{1,2})");
    std::smatch match_source, match_target;
    Coordinate tile_bottom_left = Coordinate(component.bottom_left().x() - component.tile_width(),
                                             component.bottom_left().y() - component.tile_height(),
                                             component.bottom_left().z());
    enum Direction
    {
        N,
        E,
        S,
        W,
        DIRECTION_COUNT
    };
    enum IO
    {
        IN,
        OUT,
        IO_COUNT
    };
    struct tmp_tile
    {
        int direction[DIRECTION_COUNT][IO_COUNT] = {{0}};
        bool pins[4] = {false, false, false, false};
    };

    int num_tile_rows = component.rows() + 1;
    int num_tile_columns = component.columns() + 1;
    std::vector<std::vector<tmp_tile>> v_tmp_tiles(num_tile_rows, std::vector<tmp_tile>(num_tile_columns));
    // Display flow on each edge
    // base index
    // 0 - s, 1 - t
    // 2 vertices
    // # of pin + 2 - tiles
    graph_traits<Graph>::edge_iterator ei, ei_end;
    for (tie(ei, ei_end) = edges(g); ei != ei_end; ++ei)
    {
        long flow = capacity[*ei] - residual_capacity[*ei];
        if (flow > 0)
        {
            std::string source_name = m_vertex_names[source(*ei, g)];
            std::string target_name = m_vertex_names[target(*ei, g)];
            if (std::regex_match(source_name, match_source, tile_pattern) &&
                std::regex_match(target_name, match_target, tile_pattern))
            {
                int s_i = std::stoi(match_source[2].str());
                int s_j = std::stoi(match_source[3].str());
                int t_i = std::stoi(match_target[2].str());
                int t_j = std::stoi(match_target[3].str());
                if (match_source[1].str() == "N" && match_target[1].str() == "S")
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[N][OUT] += flow;
                    v_tmp_tiles.at(t_i).at(t_j).direction[S][IN] += flow;
                }
                if (match_source[1].str() == "S" && match_target[1].str() == "N")
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[S][OUT] += flow;
                    v_tmp_tiles.at(t_i).at(t_j).direction[N][IN] += flow;
                }
                if (match_source[1].str() == "E" && match_target[1].str() == "W")
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[E][OUT] += flow;
                    v_tmp_tiles.at(t_i).at(t_j).direction[W][IN] += flow;
                }
                if (match_source[1].str() == "W" && match_target[1].str() == "E")
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[W][OUT] += flow;
                    v_tmp_tiles.at(t_i).at(t_j).direction[E][IN] += flow;
                }
            }
            if (std::regex_match(source_name, match_source, vertex_pattern) &&
                std::regex_match(target_name, match_target, tile_pattern))
            {
                // int s_i = std::stoi(match_source[1].str());
                // int s_j = std::stoi(match_source[2].str());
                int t_i = std::stoi(match_target[2].str());
                int t_j = std::stoi(match_target[3].str());
                if (match_target[1].str() == "N")
                {
                    v_tmp_tiles.at(t_i).at(t_j).pins[N] = true;
                }
                if (match_target[1].str() == "S")
                {
                    v_tmp_tiles.at(t_i).at(t_j).pins[S] = true;
                }
                if (match_target[1].str() == "E")
                {
                    v_tmp_tiles.at(t_i).at(t_j).pins[E] = true;
                }
                if (match_target[1].str() == "W")
                {
                    v_tmp_tiles.at(t_i).at(t_j).pins[W] = true;
                }
            }
            if (std::regex_match(source_name, match_source, vertex_pattern) && target_name == "t")
            {
                int s_i = std::stoi(match_source[1].str());
                int s_j = std::stoi(match_source[2].str());
                Coordinate pin_bottom_left =
                    Coordinate(component.bottom_left().x(), component.bottom_left().y(), component.bottom_left().z());
                // find pin
                std::shared_ptr<Pin> pin = nullptr;
                for (auto &p : component.pins())
                {
                    if (std::fabs(p->coordinate().x() - (pin_bottom_left.x() + s_j * component.tile_width())) < 5e-1 &&
                        std::fabs(p->coordinate().y() - (pin_bottom_left.y() + s_i * component.tile_height())) < 5e-1)
                    {
                        pin = p;
                        break;
                    }
                }
                if (pin == nullptr)
                {
                    throw std::runtime_error("Pin not found");
                }

                if (escape_boundry.find('N') != std::string::npos)
                {
                    router->addSegment(Segment{Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + (s_i + 1) * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               pin->net_id()});
                }
                else if (escape_boundry.find('S') != std::string::npos)
                {
                    router->addSegment(Segment{Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + (s_i - 1) * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               pin->net_id()});
                }
                else if (escape_boundry.find('E') != std::string::npos)
                {
                    router->addSegment(Segment{Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               Coordinate(pin_bottom_left.x() + (s_j + 1) * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               pin->net_id()});
                }
                else if (escape_boundry.find('W') != std::string::npos)
                {
                    router->addSegment(Segment{Coordinate(pin_bottom_left.x() + s_j * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               Coordinate(pin_bottom_left.x() + (s_j - 1) * component.tile_width(),
                                                          pin_bottom_left.y() + s_i * component.tile_height(),
                                                          pin_bottom_left.z()),
                                               pin->net_id()});
                }
                else
                {
                    throw std::runtime_error("Invalid escape boundry character");
                }
            }
            if (std::regex_match(source_name, match_source, tile_pattern) && target_name == "t")
            {
                int s_i = std::stoi(match_source[2].str());
                int s_j = std::stoi(match_source[3].str());
                if (escape_boundry.find('N') != std::string::npos)
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[N][OUT] += flow;
                }
                else if (escape_boundry.find('S') != std::string::npos)
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[S][OUT] += flow;
                }
                else if (escape_boundry.find('E') != std::string::npos)
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[E][OUT] += flow;
                }
                else if (escape_boundry.find('W') != std::string::npos)
                {
                    v_tmp_tiles.at(s_i).at(s_j).direction[W][OUT] += flow;
                }
                else
                {
                    throw std::runtime_error("Invalid escape boundry character");
                }
            }
        }
    }
    // print v_tmp_tiles
    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; j++)
        {
            int count = 0;
            for (int k = 0; k < DIRECTION_COUNT; ++k)
            {
                for (int l = 0; l < IO_COUNT; ++l)
                {
                    if (l == IN)
                        count += v_tmp_tiles.at(i).at(j).direction[k][l];
                    else
                        count -= v_tmp_tiles.at(i).at(j).direction[k][l];
                }
            }
            for (int k = 0; k < DIRECTION_COUNT; ++k)
            {
                if (v_tmp_tiles.at(i).at(j).pins[k])
                    count++;
            }
#ifdef VERBOSE
            if (count != 0)
            {
                std::cout << "Tile " << i << " " << j << " N_in: " << v_tmp_tiles.at(i).at(j).direction[N][IN]
                          << " N_out: " << v_tmp_tiles.at(i).at(j).direction[N][OUT]
                          << " S_in: " << v_tmp_tiles.at(i).at(j).direction[S][IN]
                          << " S_out: " << v_tmp_tiles.at(i).at(j).direction[S][OUT]
                          << " E_in: " << v_tmp_tiles.at(i).at(j).direction[E][IN]
                          << " E_out: " << v_tmp_tiles.at(i).at(j).direction[E][OUT]
                          << " W_in: " << v_tmp_tiles.at(i).at(j).direction[W][IN]
                          << " W_out: " << v_tmp_tiles.at(i).at(j).direction[W][OUT] << " count: " << count
                          << std::endl;
                // throw run time error
                throw std::runtime_error("Invalid flow count");
            }
#endif
        }
    }

    for (int i = 0; i < num_tile_rows; ++i)
    {
        for (int j = 0; j < num_tile_columns; j++)
        {
            std::vector<char> st;
            char to_c, from_c;
            int rep_N = 1, rep_S = 1, rep_E = 1, rep_W = 1;
            int rep, total;
            Coordinate t_t = tile_bottom_left;
            t_t.x() += j * component.tile_width();
            t_t.y() += i * component.tile_height();
            for (int k = 0; k < DIRECTION_COUNT; ++k)
            {
                if (v_tmp_tiles.at(i).at(j).pins[k])
                {
                    switch (k)
                    {
                    case N:
                        to_c = '{';
                        if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                        {
                            from_c = st.back();
                            from_c += 32;
                            st.pop_back();
                            switch (from_c)
                            {
                            case 'n':
                                rep = rep_N++;
                                total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                break;
                            case 'e':
                                rep = rep_E++;
                                total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                break;
                            case 's':
                                rep = rep_S++;
                                total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                break;
                            case 'w':
                                rep = rep_W++;
                                total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                break;
                            }
                            tileDetailedRoute(router,
                                              component,
                                              t_t,
                                              from_c,
                                              to_c,
                                              rep,
                                              total,
                                              0,
                                              0,
                                              component.tile_width(),
                                              component.tile_height());
                        }
                        else
                            st.push_back(to_c);
                        break;
                    case E:
                        to_c = '|';
                        if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                        {
                            from_c = st.back();
                            from_c += 32;
                            st.pop_back();
                            switch (from_c)
                            {
                            case 'n':
                                rep = rep_N++;
                                total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                break;
                            case 'e':
                                rep = rep_E++;
                                total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                break;
                            case 's':
                                rep = rep_S++;
                                total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                break;
                            case 'w':
                                rep = rep_W++;
                                total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                break;
                            }
                            tileDetailedRoute(router,
                                              component,
                                              t_t,
                                              from_c,
                                              to_c,
                                              rep,
                                              total,
                                              0,
                                              0,
                                              component.tile_width(),
                                              component.tile_height());
                        }
                        else
                            st.push_back(to_c);
                        break;
                    case S:
                        to_c = '}';
                        if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                        {
                            from_c = st.back();
                            from_c += 32;
                            st.pop_back();
                            switch (from_c)
                            {
                            case 'n':
                                rep = rep_N++;
                                total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                break;
                            case 'e':
                                rep = rep_E++;
                                total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                break;
                            case 's':
                                rep = rep_S++;
                                total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                break;
                            case 'w':
                                rep = rep_W++;
                                total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                break;
                            }
                            tileDetailedRoute(router,
                                              component,
                                              t_t,
                                              from_c,
                                              to_c,
                                              rep,
                                              total,
                                              0,
                                              0,
                                              component.tile_width(),
                                              component.tile_height());
                        }
                        else
                            st.push_back(to_c);
                        break;
                    case W:
                        to_c = '~';
                        if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                        {
                            from_c = st.back();
                            from_c += 32;
                            st.pop_back();
                            switch (from_c)
                            {
                            case 'n':
                                rep = rep_N++;
                                total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                break;
                            case 'e':
                                rep = rep_E++;
                                total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                break;
                            case 's':
                                rep = rep_S++;
                                total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                break;
                            case 'w':
                                rep = rep_W++;
                                total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                break;
                            }
                            tileDetailedRoute(router,
                                              component,
                                              t_t,
                                              from_c,
                                              to_c,
                                              rep,
                                              total,
                                              0,
                                              0,
                                              component.tile_width(),
                                              component.tile_height());
                        }
                        else
                            st.push_back(to_c);
                        break;
                    }
                }
                for (int l = 0; l < IO_COUNT; ++l)
                {
                    if (l == IN)
                    {
                        if (v_tmp_tiles.at(i).at(j).direction[k][l] > 0)
                        {
                            switch (k)
                            {
                            case N:
                                for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                                {
                                    to_c = 'n';
                                    if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                                    {
                                        from_c = st.back();
                                        from_c += 32;
                                        st.pop_back();
                                        switch (from_c)
                                        {
                                        case 'n':
                                            rep = rep_N++;
                                            total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                            break;
                                        case 'e':
                                            rep = rep_E++;
                                            total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                            break;
                                        case 's':
                                            rep = rep_S++;
                                            total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                            break;
                                        case 'w':
                                            rep = rep_W++;
                                            total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                            break;
                                        }
                                        tileDetailedRoute(router,
                                                          component,
                                                          t_t,
                                                          from_c,
                                                          to_c,
                                                          rep,
                                                          total,
                                                          rep_N++,
                                                          v_tmp_tiles.at(i).at(j).direction[k][l],
                                                          component.tile_width(),
                                                          component.tile_height());
                                    }
                                    else
                                        st.push_back(to_c);
                                }
                                break;
                            case E:
                                for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                                {
                                    to_c = 'e';
                                    if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                                    {
                                        from_c = st.back();
                                        from_c += 32;
                                        st.pop_back();
                                        switch (from_c)
                                        {
                                        case 'n':
                                            rep = rep_N++;
                                            total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                            break;
                                        case 'e':
                                            rep = rep_E++;
                                            total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                            break;
                                        case 's':
                                            rep = rep_S++;
                                            total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                            break;
                                        case 'w':
                                            rep = rep_W++;
                                            total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                            break;
                                        }
                                        tileDetailedRoute(router,
                                                          component,
                                                          t_t,
                                                          from_c,
                                                          to_c,
                                                          rep,
                                                          total,
                                                          rep_E++,
                                                          v_tmp_tiles.at(i).at(j).direction[k][l],
                                                          component.tile_width(),
                                                          component.tile_height());
                                    }
                                    else
                                        st.push_back(to_c);
                                }
                                break;
                            case S:
                                for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                                {
                                    to_c = 's';
                                    if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                                    {
                                        from_c = st.back();
                                        from_c += 32;
                                        st.pop_back();
                                        switch (from_c)
                                        {
                                        case 'n':
                                            rep = rep_N++;
                                            total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                            break;
                                        case 'e':
                                            rep = rep_E++;
                                            total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                            break;
                                        case 's':
                                            rep = rep_S++;
                                            total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                            break;
                                        case 'w':
                                            rep = rep_W++;
                                            total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                            break;
                                        }
                                        tileDetailedRoute(router,
                                                          component,
                                                          t_t,
                                                          from_c,
                                                          to_c,
                                                          rep,
                                                          total,
                                                          rep_S++,
                                                          v_tmp_tiles.at(i).at(j).direction[k][l],
                                                          component.tile_width(),
                                                          component.tile_height());
                                    }
                                    else
                                        st.push_back(to_c);
                                }
                                break;
                            case W:
                                for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                                {
                                    to_c = 'w';
                                    if (!st.empty() && (st.back() >= 'E' && st.back() <= 'W'))
                                    {
                                        from_c = st.back();
                                        from_c += 32;
                                        st.pop_back();
                                        switch (from_c)
                                        {
                                        case 'n':
                                            rep = rep_N++;
                                            total = v_tmp_tiles.at(i).at(j).direction[N][OUT];
                                            break;
                                        case 'e':
                                            rep = rep_E++;
                                            total = v_tmp_tiles.at(i).at(j).direction[E][OUT];
                                            break;
                                        case 's':
                                            rep = rep_S++;
                                            total = v_tmp_tiles.at(i).at(j).direction[S][OUT];
                                            break;
                                        case 'w':
                                            rep = rep_W++;
                                            total = v_tmp_tiles.at(i).at(j).direction[W][OUT];
                                            break;
                                        }
                                        tileDetailedRoute(router,
                                                          component,
                                                          t_t,
                                                          from_c,
                                                          to_c,
                                                          rep,
                                                          total,
                                                          rep_W++,
                                                          v_tmp_tiles.at(i).at(j).direction[k][l],
                                                          component.tile_width(),
                                                          component.tile_height());
                                    }
                                    else
                                        st.push_back(to_c);
                                }
                                break;
                            }
                        }
                    }
                    else
                    {
                        switch (k)
                        {
                        case N:
                            for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                            {
                                to_c = 'N';
                                if (!st.empty() && (st.back() >= 'e' && st.back() <= '~'))
                                {
                                    from_c = st.back();
                                    st.pop_back();
                                    to_c += 32;
                                    switch (from_c)
                                    {
                                    case 'n':
                                        rep = rep_N++;
                                        total = v_tmp_tiles.at(i).at(j).direction[N][IN];
                                        break;
                                    case 'e':
                                        rep = rep_E++;
                                        total = v_tmp_tiles.at(i).at(j).direction[E][IN];
                                        break;
                                    case 's':
                                        rep = rep_S++;
                                        total = v_tmp_tiles.at(i).at(j).direction[S][IN];
                                        break;
                                    case 'w':
                                        rep = rep_W++;
                                        total = v_tmp_tiles.at(i).at(j).direction[W][IN];
                                        break;
                                    }
                                    tileDetailedRoute(router,
                                                      component,
                                                      t_t,
                                                      from_c,
                                                      to_c,
                                                      rep,
                                                      total,
                                                      rep_N++,
                                                      v_tmp_tiles.at(i).at(j).direction[k][l],
                                                      component.tile_width(),
                                                      component.tile_height());
                                }
                                else
                                    st.push_back(to_c);
                            }
                            break;
                        case E:
                            for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                            {
                                to_c = 'E';
                                if (!st.empty() && (st.back() >= 'e' && st.back() <= '~'))
                                {
                                    from_c = st.back();
                                    st.pop_back();
                                    to_c += 32;
                                    switch (from_c)
                                    {
                                    case 'n':
                                        rep = rep_N++;
                                        total = v_tmp_tiles.at(i).at(j).direction[N][IN];
                                        break;
                                    case 'e':
                                        rep = rep_E++;
                                        total = v_tmp_tiles.at(i).at(j).direction[E][IN];
                                        break;
                                    case 's':
                                        rep = rep_S++;
                                        total = v_tmp_tiles.at(i).at(j).direction[S][IN];
                                        break;
                                    case 'w':
                                        rep = rep_W++;
                                        total = v_tmp_tiles.at(i).at(j).direction[W][IN];
                                        break;
                                    }
                                    tileDetailedRoute(router,
                                                      component,
                                                      t_t,
                                                      from_c,
                                                      to_c,
                                                      rep,
                                                      total,
                                                      rep_E++,
                                                      v_tmp_tiles.at(i).at(j).direction[k][l],
                                                      component.tile_width(),
                                                      component.tile_height());
                                }
                                else
                                    st.push_back(to_c);
                            }
                            break;
                        case S:
                            for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                            {
                                to_c = 'S';
                                if (!st.empty() && (st.back() >= 'e' && st.back() <= '~'))
                                {
                                    from_c = st.back();
                                    st.pop_back();
                                    to_c += 32;
                                    switch (from_c)
                                    {
                                    case 'n':
                                        rep = rep_N++;
                                        total = v_tmp_tiles.at(i).at(j).direction[N][IN];
                                        break;
                                    case 'e':
                                        rep = rep_E++;
                                        total = v_tmp_tiles.at(i).at(j).direction[E][IN];
                                        break;
                                    case 's':
                                        rep = rep_S++;
                                        total = v_tmp_tiles.at(i).at(j).direction[S][IN];
                                        break;
                                    case 'w':
                                        rep = rep_W++;
                                        total = v_tmp_tiles.at(i).at(j).direction[W][IN];
                                        break;
                                    }
                                    tileDetailedRoute(router,
                                                      component,
                                                      t_t,
                                                      from_c,
                                                      to_c,
                                                      rep,
                                                      total,
                                                      rep_S++,
                                                      v_tmp_tiles.at(i).at(j).direction[k][l],
                                                      component.tile_width(),
                                                      component.tile_height());
                                }
                                else
                                    st.push_back(to_c);
                            }
                            break;
                        case W:
                            for (int m = 0; m < v_tmp_tiles.at(i).at(j).direction[k][l]; ++m)
                            {
                                to_c = 'W';
                                if (!st.empty() && (st.back() >= 'e' && st.back() <= '~'))
                                {
                                    from_c = st.back();
                                    st.pop_back();
                                    to_c += 32;
                                    switch (from_c)
                                    {
                                    case 'n':
                                        rep = rep_N++;
                                        total = v_tmp_tiles.at(i).at(j).direction[N][IN];
                                        break;
                                    case 'e':
                                        rep = rep_E++;
                                        total = v_tmp_tiles.at(i).at(j).direction[E][IN];
                                        break;
                                    case 's':
                                        rep = rep_S++;
                                        total = v_tmp_tiles.at(i).at(j).direction[S][IN];
                                        break;
                                    case 'w':
                                        rep = rep_W++;
                                        total = v_tmp_tiles.at(i).at(j).direction[W][IN];
                                        break;
                                    }
                                    tileDetailedRoute(router,
                                                      component,
                                                      t_t,
                                                      from_c,
                                                      to_c,
                                                      rep,
                                                      total,
                                                      rep_W++,
                                                      v_tmp_tiles.at(i).at(j).direction[k][l],
                                                      component.tile_width(),
                                                      component.tile_height());
                                }
                                else
                                    st.push_back(to_c);
                            }
                            break;
                        }
                    }
                }
            }
            if (!st.empty())
            {
#ifdef VERBOSE
                std::cout << "Tile " << i << " " << j << "\n";
                throw std::runtime_error("Testing");
#endif
            }
        }
    }
}