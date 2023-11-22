#ifndef GRAPH_HPP
#define GRAPH_HPP

#include "component_data.hpp"
enum class PinType
{
    Regular,
    Missing
};

enum class TileType
{
    Regular,
    Via
};

class Node
{
private:
    int m_id;
    int m_capacity;
    std::shared_ptr<Tile> m_source_tile;

public:
    // Constructor
    Node()
        : m_capacity(-1)
    {
    }
    Node(int id, int capacity, std::shared_ptr<Tile> source_tile)
        : m_id(id)
        , m_capacity(capacity)
        , m_source_tile(source_tile)
    {
    }
    // Access for id
    const int &id() const { return m_id; }
    int &id() { return m_id; }

    // Access for capacity
    const int &capacity() const { return m_capacity; }
    int &capacity() { return m_capacity; }

    // Access for source_tile
    const std::shared_ptr<Tile> &source_tile() const { return m_source_tile; }
    std::shared_ptr<Tile> &source_tile() { return m_source_tile; }
};

class PinNode : public Node
{
private:
    PinType type;
    PinNodePosition position;
    std::shared_ptr<Pin> m_source_pin;

public:
    // Constructor with Node constructor
    PinNode(PinType type,
            PinNodePosition position,
            std::shared_ptr<Pin> source_pin,
            int id,
            int capacity,
            std::shared_ptr<Tile> source_tile)
        : Node(id, capacity, source_tile)
        , type(type)
        , position(position)
        , m_source_pin(source_pin)
    {
    }
};

class TileNode : public Node
{
private:
    TileType type;
    TileNodePosition position;

public:
    TileNode(TileType type, TileNodePosition position)
        : type(type)
        , position(position)
    {
    }
};

class GraphManager
{
private:
    std::shared_ptr<DataManager> m_data_manager;

public:
    // Constructor
    explicit GraphManager(std::shared_ptr<DataManager> data_manager)
        : m_data_manager(data_manager)
    {
    }
    // Access for data_manager
    const DataManager &data_manager() const { return *m_data_manager; }
    DataManager &data_manager() { return *m_data_manager; }

    void initialNodes();
};

#endif // GRAPH_HPP