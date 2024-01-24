#ifndef GRAPH_HPP
#define GRAPH_HPP
// clang-format off
#include "component_data.hpp"
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/successive_shortest_path_nonnegative_weights.hpp>
#include <boost/graph/find_flow_cost.hpp>
#include <vector>
using namespace boost;
#define INF 1e9
typedef adjacency_list_traits<vecS, vecS, directedS> Traits;
typedef adjacency_list<vecS, vecS, directedS, no_property,
        property<edge_capacity_t, long,
            property<edge_residual_capacity_t, long,
                property<edge_reverse_t, Traits::edge_descriptor,
                    property<edge_weight_t, long>>>>> Graph;
// clang-format on
class GraphManager
{
private:
    DataManager *m_data_manager;
    Component *m_component;
    Graph g;
    property_map<Graph, edge_capacity_t>::type capacity;
    property_map<Graph, edge_weight_t>::type weight;
    property_map<Graph, edge_residual_capacity_t>::type residual_capacity;
    property_map<Graph, edge_reverse_t>::type rev;

    Traits::vertex_descriptor s, t;
    std::vector<std::vector<Traits::vertex_descriptor>> m_v;
    std::vector<std::vector<Traits::vertex_descriptor>> m_tiles_N;
    std::vector<std::vector<Traits::vertex_descriptor>> m_tiles_S;
    std::vector<std::vector<Traits::vertex_descriptor>> m_tiles_E;
    std::vector<std::vector<Traits::vertex_descriptor>> m_tiles_W;
    std::vector<std::vector<Traits::vertex_descriptor>> m_tiles_C;
    std::vector<std::vector<Traits::vertex_descriptor>> m_d_tiles_C;
    std::vector<std::vector<Traits::vertex_descriptor>> m_rows;
    std::vector<std::vector<Traits::vertex_descriptor>> m_d_rows;
    std::vector<std::vector<Traits::vertex_descriptor>> m_columns;
    std::vector<std::vector<Traits::vertex_descriptor>> m_d_columns;
    std::vector<std::string> m_vertex_names;
    // Private Methods
    void add_v(Graph &g, Traits::vertex_descriptor &v, std::string name);

public:
    // Constructor
    GraphManager() = default;
    GraphManager(DataManager &data_manager,
                 Component &component,
                 int maximum_via_count = 1,
                 size_t maximum_layer = 3,
                 int threshold = 175); // 175 for case 4, 5, 6
    ~GraphManager() = default;

    void minCostMaxFlow(Router &router);
};
#endif // GRAPH_HPP