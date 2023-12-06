#ifndef GRAPH_HPP
#define GRAPH_HPP

#include "component_data.hpp"
// clang-format off
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/successive_shortest_path_nonnegative_weights.hpp>
#include <boost/graph/find_flow_cost.hpp>
// clang-format on
#ifdef VERBOSE
#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
using json = nlohmann::json;
#endif

class VertexProperties
{
private:
    Coordinate m_coordinate;

public:
    // Constructor
    VertexProperties() = default;
    VertexProperties(Coordinate coordinate)
        : m_coordinate(coordinate)
    {
    }
    virtual ~VertexProperties() = default;

    // Access for coordinate
    const Coordinate &coordinate() const { return m_coordinate; }
    Coordinate &coordinate() { return m_coordinate; }
};

// PinVertex
class PinVertex : public VertexProperties
{
private:
    std::string m_name;

public:
    // Constructor
    PinVertex() = default;
    PinVertex(Coordinate coordinate, std::string name)
        : VertexProperties(coordinate)
        , m_name(name)
    {
    }

    // Access for name
    const std::string &name() const { return m_name; }
    std::string &name() { return m_name; }
};

// TileVertex
class TileVertex : public VertexProperties
{
private:
    TileNodePosition m_type;

public:
    // Constructor
    TileVertex() = default;
    TileVertex(Coordinate coordinate, TileNodePosition type)
        : VertexProperties(coordinate)
        , m_type(type)
    {
    }

    // Access for type
    const TileNodePosition &type() const { return m_type; }
    TileNodePosition &type() { return m_type; }
};

class GraphManager
{
private:
    std::shared_ptr<DataManager> m_data_manager;
    // clang-format off
    typedef boost::adjacency_list_traits<boost::vecS, boost::vecS,
         boost::directedS> Traits;
    typedef boost::adjacency_list<boost::vecS, boost::vecS,
        boost::directedS, std::shared_ptr<VertexProperties>,
        boost::property<boost::edge_capacity_t, long,
            boost::property<boost::edge_residual_capacity_t, long,
                boost::property<boost::edge_reverse_t, Traits::edge_descriptor,
                    boost::property<boost::edge_weight_t, long>>>>> Graph;
    // clang-format on

    Graph m_g;
    std::vector<Traits::vertex_descriptor> m_vertices;
    std::vector<Traits::edge_descriptor> m_edges;
    boost::property_map<Graph, boost::edge_capacity_t>::type m_edge_capacity = get(boost::edge_capacity, m_g);
    boost::property_map<Graph, boost::edge_weight_t>::type m_edge_weight = get(boost::edge_weight, m_g);
    boost::property_map<Graph, boost::edge_residual_capacity_t>::type m_edge_residual_capacity =
        get(boost::edge_residual_capacity, m_g);
    boost::property_map<Graph, boost::edge_reverse_t>::type m_edge_reverse = get(boost::edge_reverse, m_g);

public:
    // Constructor
    explicit GraphManager(std::shared_ptr<DataManager> data_manager)
        : m_data_manager(data_manager)
    {
    }
    // Access for data_manager
    const DataManager &data_manager() const { return *m_data_manager; }
    DataManager &data_manager() { return *m_data_manager; }

    // Access for graph
    const Graph &graph() const { return m_g; }
    Graph &graph() { return m_g; }

    // Methods for building graph
    void buildGraph();
#ifdef VERBOSE
    void outputVerticesToJson(const std::string &filePath);
#endif
};

#endif // GRAPH_HPP