#include "component_data.hpp"
#include <algorithm>
#include <cmath>
#include <queue>
#include <string>
#include <unordered_map>
#include <vector>
class UnionFind
{
private:
    std::unordered_map<Component *, Component *> parent;

public:
    Component *find(Component *c)
    {
        if (parent.find(c) == parent.end() || parent[c] == c)
        {
            return c;
        }
        return parent[c] = find(parent[c]);
    }

    void unite(Component *a, Component *b)
    {
        Component *rootA = find(a);
        Component *rootB = find(b);
        if (rootA != rootB)
        {
            parent[rootA] = rootB;
        }
    }
};

struct Edge
{
    Component *a;
    Component *b;
    double distance;
};

double distanceBetweenComponent(const Component *a, const Component *b)
{
    double dx = a->bottom_left().x() - b->bottom_left().x();
    double dy = a->bottom_left().y() - b->bottom_left().y();
    return sqrt(dx * dx + dy * dy);
}

std::vector<Edge> kruskalMST(const std::vector<Edge> &edges)
{
    UnionFind uf;
    std::vector<Edge> mst;

    std::vector<Edge> sortedEdges = edges;
    std::sort(
        sortedEdges.begin(), sortedEdges.end(), [](const Edge &a, const Edge &b) { return a.distance < b.distance; });

    for (const Edge &edge : sortedEdges)
    {
        if (uf.find(edge.a) != uf.find(edge.b))
        {
            uf.unite(edge.a, edge.b);
            mst.push_back(edge);
        }
    }

    return mst;
}
