#ifndef GRAPH_HPP
#define GRAPH_HPP
// clang-format off
#include "component_data.hpp"
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/successive_shortest_path_nonnegative_weights.hpp>
#include <boost/graph/cycle_canceling.hpp>
#include <boost/graph/edmonds_karp_max_flow.hpp>
#include <boost/graph/find_flow_cost.hpp>
#include <boost/graph/depth_first_search.hpp>
#include <vector>
#include <map>
using namespace boost;
#define INF 1e9
typedef adjacency_list_traits<vecS, vecS, directedS> Traits;
typedef adjacency_list<vecS, vecS, directedS, no_property,
        property<edge_capacity_t, long,
            property<edge_residual_capacity_t, long,
                property<edge_reverse_t, Traits::edge_descriptor,
                    property<edge_weight_t, long>>>>> Graph;
// clang-format on
class TileNode
{
private:
    Traits::vertex_descriptor m_N;
    Traits::vertex_descriptor m_S;
    Traits::vertex_descriptor m_E;
    Traits::vertex_descriptor m_W;
    Traits::vertex_descriptor m_C;
    Traits::vertex_descriptor m_d_C;

public:
    TileNode() = default;
    TileNode(Traits::vertex_descriptor N,
             Traits::vertex_descriptor S,
             Traits::vertex_descriptor E,
             Traits::vertex_descriptor W,
             Traits::vertex_descriptor C,
             Traits::vertex_descriptor d_C)
        : m_N(N)
        , m_S(S)
        , m_E(E)
        , m_W(W)
        , m_C(C)
        , m_d_C(d_C)
    {
    }
    ~TileNode() = default;
    // Accessor
    const Traits::vertex_descriptor &N() const { return m_N; }
    Traits::vertex_descriptor &N() { return m_N; }
    const Traits::vertex_descriptor &S() const { return m_S; }
    Traits::vertex_descriptor &S() { return m_S; }
    const Traits::vertex_descriptor &E() const { return m_E; }
    Traits::vertex_descriptor &E() { return m_E; }
    const Traits::vertex_descriptor &W() const { return m_W; }
    Traits::vertex_descriptor &W() { return m_W; }
    const Traits::vertex_descriptor &C() const { return m_C; }
    Traits::vertex_descriptor &C() { return m_C; }
    const Traits::vertex_descriptor &d_C() const { return m_d_C; }
    Traits::vertex_descriptor &d_C() { return m_d_C; }
};
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
    std::vector<std::vector<TileNode>> m_tiles;
    std::vector<std::vector<Traits::vertex_descriptor>> m_rows;
    std::vector<std::vector<Traits::vertex_descriptor>> m_d_rows;
    std::vector<std::vector<Traits::vertex_descriptor>> m_columns;
    std::vector<std::vector<Traits::vertex_descriptor>> m_d_columns;
    std::vector<std::string> m_vertex_names;
    std::map<adjacency_list_traits<vecS, vecS, directedS>::edge_descriptor, std::pair<int, int>>
        stored_capacity_and_residual;
    // Private Methods
    void add_v(Graph &g, Traits::vertex_descriptor &v, std::string name);
    void add_v(Graph &g, TileNode &tile_node, std::string name);
    Graph reverseGraph(Graph &g);

public:
    // Constructor
    GraphManager() = default;
    ~GraphManager() = default;
    void fixFlowResults();
    void restoreFlowResults();
    void addSource2Pins(Component &component, std::unordered_set<int> &pinset);
    void DDR2DDRInit(DataManager &data_manager, Component &component, int expand, size_t maximum_layer);
    void CPU2DDRInit(DataManager &data_manager,
                     Component &component,
                     double wire_spacing,
                     double wire_width,
                     double bump_ball_radius,
                     std::string escape_boundary);
    long minCostMaxFlow();
    std::pair<Coordinate, Coordinate> DDR2DDR(std::shared_ptr<Router> router);
    void CPU2DDR(std::shared_ptr<Router> router, Component &component, std::string cpu_escape_boundary);
};

#endif // GRAPH_HPP