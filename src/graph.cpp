#include "graph.hpp"
void GraphManager::buildGraph()
{
    std::vector<int> pos_vec;

    for (auto &comp : m_data_manager->components())
    {
        for (size_t k = 0; k < comp->tiles().size(); ++k)
        // Building pin vertex
        // From bottom left tile to top right tile(go up first then go right)
        {
            comp->pin_start_idx().at(k) = m_vertices.size();
            for (size_t i = 0; i < comp->tiles().at(k).size(); ++i)
            {
                for (size_t j = 0; j < comp->tiles().at(k).at(i).size(); ++j)
                {
                    auto tile = comp->tiles().at(k).at(i).at(j);
                    pos_vec.clear();
                    pos_vec.push_back(static_cast<int>(PinNodePosition::TopLeft));
                    if (j == 0)
                    {
                        pos_vec.push_back(static_cast<int>(PinNodePosition::BottomLeft));
                    }

                    for (auto pos : pos_vec)
                    {
                        auto pin = tile->getPin(static_cast<PinNodePosition>(pos));
                        if (pin)
                        {
                            auto v = boost::add_vertex(m_g);
                            m_vertices.emplace_back(v);
                            m_g[v] = std::make_shared<PinVertex>(tile->getPinCornerCoordinate(pos), pin->name());
                        }
                        else
                        {
                            auto v = boost::add_vertex(m_g);
                            m_vertices.emplace_back(v);
                            m_g[v] = std::make_shared<VertexProperties>(tile->getPinCornerCoordinate(pos));
                        }
                    }
                }
                // For the last tile in the column, we need to add the right pin
                if (i == comp->tiles().at(k).size() - 1)
                {
                    for (size_t j = 0; j < comp->tiles().at(k).at(i).size(); ++j)
                    {
                        auto tile = comp->tiles().at(k).at(i).at(j);
                        pos_vec.clear();
                        pos_vec.push_back(static_cast<int>(PinNodePosition::TopRight));
                        if (j == 0)
                        {
                            pos_vec.push_back(static_cast<int>(PinNodePosition::BottomRight));
                        }
                        for (auto pos : pos_vec)
                        {
                            auto pin = tile->getPin(static_cast<PinNodePosition>(pos));
                            if (pin)
                            {
                                auto v = boost::add_vertex(m_g);
                                m_vertices.emplace_back(v);
                                m_g[v] = std::make_shared<PinVertex>(tile->getPinCornerCoordinate(pos), pin->name());
                            }
                            else
                            {
                                auto v = boost::add_vertex(m_g);
                                m_vertices.emplace_back(v);
                                m_g[v] = std::make_shared<VertexProperties>(tile->getPinCornerCoordinate(pos));
                            }
                        }
                    }
                }
            }
            comp->tile_start_idx().at(k) = m_vertices.size();
            // Building tile vertex
            for (size_t i = 0; i < comp->tiles().at(k).size(); ++i)
            {
                for (size_t j = 0; j < comp->tiles().at(k).at(i).size(); ++j)
                {
                    auto tile = comp->tiles().at(k).at(i).at(j);
                    auto pin = tile->getPin(static_cast<PinNodePosition>(PinNodePosition::TopLeft));

                    for (size_t pos = static_cast<size_t>(TileNodePosition::North);
                         pos <= static_cast<size_t>(TileNodePosition::Center);
                         ++pos)
                    {
                        auto v = boost::add_vertex(m_g);
                        m_vertices.emplace_back(v);
                        if (pin && pos == static_cast<size_t>(TileNodePosition::Center))
                        {
                            m_g[v] =
                                std::make_shared<TileVertex>(tile->getTileVertexCoordinate(pos), TileNodePosition::Via);
                        }
                        else
                        {
                            m_g[v] = std::make_shared<TileVertex>(tile->getTileVertexCoordinate(pos),
                                                                  static_cast<TileNodePosition>(pos));
                        }
                    }
                }
            }
        }
    }

#ifdef VERBOSE
    // for (auto v_i = vertices(m_g).first; v_i != vertices(m_g).second; ++v_i)
    // {
    //     auto vertex = m_g[*v_i];

    //     if (auto pv = std::dynamic_pointer_cast<PinVertex>(vertex))
    //     {
    //         std::cout << "PinVertex: " << vertex->coordinate().x() << ", " << vertex->coordinate().y() << ", "
    //                   << pv->name() << std::endl;
    //     }
    //     else if (auto tv = std::dynamic_pointer_cast<TileVertex>(vertex))
    //     {
    //         std::cout << "TileVertex: " << static_cast<int>(tv->type()) << std::endl;
    //     }
    //     else
    //     {
    //         // std::cout << "VertexProperties: " << vertex->coordinate().x() << ", " << vertex->coordinate().y()
    //         //   << std::endl;
    //     }
    // }

#endif
}

#ifdef VERBOSE
void GraphManager::outputVerticesToJson(const std::string &filePath)
{
    json vertices_json = json::array();
    for (auto comp : m_data_manager->components())
    {
        for (size_t i = comp->pin_start_idx().at(0); i < comp->pin_start_idx().at(1); ++i)
        {
            auto vd = m_vertices.at(i);
            auto vprop = m_g[vd]; // assuming m_g[vd] gives you a shared_ptr to VertexProperties or derived class

            json vertex_json;
            vertex_json["coordinate"] = {{"x", vprop->coordinate().x() * 15}, {"y", vprop->coordinate().y() * 15}};

            if (auto pin_vertex = std::dynamic_pointer_cast<PinVertex>(vprop))
            {
                vertex_json["type"] = "PinVertex";
                vertex_json["name"] = pin_vertex->name();
            }
            else if (auto tile_vertex = std::dynamic_pointer_cast<TileVertex>(vprop))
            {
                vertex_json["type"] = "TileVertex";

                auto tileTypeFirstCharacter = [](TileNodePosition type) {
                    switch (type)
                    {
                    case TileNodePosition::North: return "N";
                    case TileNodePosition::East: return "E";
                    case TileNodePosition::South: return "S";
                    case TileNodePosition::West: return "W";
                    case TileNodePosition::Center: return "C";
                    case TileNodePosition::Via: return "V";
                    default: throw std::invalid_argument("Invalid TileNodePosition");
                    }
                };

                vertex_json["tileType"] = tileTypeFirstCharacter(tile_vertex->type());
            }
            else
            {
                vertex_json["type"] = "VertexProperties";
            }

            vertices_json.push_back(vertex_json);
        }
    }

    std::ofstream file(filePath);
    if (file.is_open())
    {
        file << vertices_json.dump(4); // Writing JSON data to file with 4-space indentation
        file.close();
    }
    else
    {
        std::cerr << "Unable to open file at " << filePath << std::endl;
    }
}
#endif