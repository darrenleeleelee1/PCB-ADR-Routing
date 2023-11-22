#include "component_data.hpp"

std::pair<Coordinate, Coordinate> Component::findExtremePoints() const
{
    double min_x = std::numeric_limits<double>::max();
    double min_y = std::numeric_limits<double>::max();
    double max_x = std::numeric_limits<double>::lowest();
    double max_y = std::numeric_limits<double>::lowest();

    for (const auto &pair : m_pins)
    {
        auto &pin = pair.second;
        min_x = std::min(min_x, pin->coordinate().x());
        min_y = std::min(min_y, pin->coordinate().y());
        max_x = std::max(max_x, pin->coordinate().x());
        max_y = std::max(max_y, pin->coordinate().y());
    }

    Coordinate bottom_left{min_x, min_y, 0};
    Coordinate top_right{max_x, max_y, 0};

    return {bottom_left, top_right};
}

double Component::calculateMinNonZeroXOffset(double y_tolerance) const
{
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1.first != pin2.first)
            {
                double y_diff = std::abs(pin1.second->coordinate().y() - pin2.second->coordinate().y());
                if (y_diff <= y_tolerance)
                { // Check if y difference is within tolerance
                    double x_offset = std::abs(pin1.second->coordinate().x() - pin2.second->coordinate().x());
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

double Component::calculateMinNonZeroYOffset(double x_tolerance) const
{
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1.first != pin2.first)
            {
                double x_diff = std::abs(pin1.second->coordinate().x() - pin2.second->coordinate().x());
                if (x_diff <= x_tolerance)
                { // Check if x difference is within tolerance
                    double y_offset = std::abs(pin1.second->coordinate().y() - pin2.second->coordinate().y());
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

void Component::splitingTiles(size_t num_layers)
{
    // Calculate the number of tiles in x and y direction
    auto extreme_points = findExtremePoints();

    double tile_width = calculateMinNonZeroXOffset();
    double tile_height = calculateMinNonZeroYOffset();
    double tolerance_width = tile_width / 5.0;
    double tolerance_height = tile_height / 5.0;

    // Adjust extreme points to include the peripheral layer
    Coordinate adjusted_bottom_left = extreme_points.first;
    adjusted_bottom_left.x() -= tile_width;
    adjusted_bottom_left.y() -= tile_height;

    Coordinate adjusted_top_right = extreme_points.second;
    adjusted_top_right.x() += tile_width;
    adjusted_top_right.y() += tile_height;

    // Calculate new bounding rectangle width, height
    double bounding_width = adjusted_top_right.x() - adjusted_bottom_left.x();
    double bounding_height = adjusted_top_right.y() - adjusted_bottom_left.y();

    int num_tiles_x = std::ceil(bounding_width / tile_width);
    int num_tiles_y = std::ceil(bounding_height / tile_height);

    // Initialize the tiles vector, tiles[num_layers][num_tiles_x][num_tiles_y]
    m_tiles.resize(num_layers);
    for (auto &layer : m_tiles)
    {
        layer.resize(num_tiles_x);
        for (auto &column : layer)
        {
            column.resize(num_tiles_y);
        }
    }

    for (size_t k = 0; k < num_layers; ++k)
    {
        for (int i = 0; i < num_tiles_x; ++i)
        {
            for (int j = 0; j < num_tiles_y; ++j)
            {
                // Calculate the corners of the tile
                double x = adjusted_bottom_left.x() + i * tile_width;
                double y = adjusted_bottom_left.y() + j * tile_height;
                Coordinate bottom_left{x, y, static_cast<int>(k)};
                Coordinate bottom_right{x + tile_width, y, static_cast<int>(k)};
                Coordinate top_left{x, y + tile_height, static_cast<int>(k)};
                Coordinate top_right{x + tile_width, y + tile_height, static_cast<int>(k)};

                m_tiles[k][i][j] = std::make_shared<Tile>(bottom_left, tile_width, tile_height);

                if (k == 0)
                {
                    // Assigning corner pins
                    for (const auto &pin_pair : m_pins)
                    {
                        auto pin = pin_pair.second;
                        if (pin->coordinate().isCloseTo(bottom_left, tolerance_width))
                            m_tiles[k][i][j]->setPin(PinNodePosition::BottomLeft, pin);
                        else if (pin->coordinate().isCloseTo(bottom_right, tolerance_width))
                            m_tiles[k][i][j]->setPin(PinNodePosition::BottomRight, pin);
                        else if (pin->coordinate().isCloseTo(top_left, tolerance_height))
                            m_tiles[k][i][j]->setPin(PinNodePosition::TopLeft, pin);
                        else if (pin->coordinate().isCloseTo(top_right, tolerance_height))
                            m_tiles[k][i][j]->setPin(PinNodePosition::TopRight, pin);
                    }
                }
            }
        }
    }
}

#ifdef VERBOSE

void Component::printTiles() const
{
    // Adjust extreme points to include the peripheral layer
    Coordinate adjusted_bottom_left = findExtremePoints().first;
    adjusted_bottom_left.x() -= calculateMinNonZeroXOffset();
    adjusted_bottom_left.y() -= calculateMinNonZeroYOffset();
    std::cout << "Tiles start from: " << adjusted_bottom_left.printCoordinate() << std::endl;
    for (size_t k = 0; k < m_tiles.size(); ++k)
    {
        std::cout << "Layer " << k << ":" << std::endl;
        for (size_t i = 0; i < m_tiles[k].size(); ++i)
        {
            for (size_t j = 0; j < m_tiles[k][i].size(); ++j)
            {
                const auto &tile = m_tiles[k][i][j];
                if (tile)
                {
                    std::cout << "Tile [" << i << "][" << j
                              << "] Bottom Left: " << tile->bottom_left().printCoordinate() << std::endl;

                    // Loop through all pin positions
                    for (int pos = static_cast<int>(PinNodePosition::BottomLeft);
                         pos <= static_cast<int>(PinNodePosition::TopLeft);
                         ++pos)
                    {
                        auto pin = tile->getPin(static_cast<PinNodePosition>(pos));
                        if (pin)
                        {
                            std::string position;
                            switch (static_cast<PinNodePosition>(pos))
                            {
                            case BottomLeft: position = "BottomLeft"; break;
                            case BottomRight: position = "BottomRight"; break;
                            case TopRight: position = "TopRight"; break;
                            case TopLeft: position = "TopLeft"; break;
                            default: position = "Unknown"; break;
                            }
                            std::cout << position << " - " << pin->name() << std::endl;
                        }
                    }
                }
            }
        }
        break; // Only print the first layer
    }
}

void Component::printComponent() const
{
    std::cout << "Component Name: " << m_name << std::endl;
    std::cout << "Pins:" << std::endl;
    for (const auto &pair : m_pins)
    {
        std::cout << "Pin Name: " << pair.first << " " << pair.second->coordinate().printCoordinate() << std::endl;
    }
    std::cout << "Minimum Non-Zero X Offset(Tile Width): " << calculateMinNonZeroXOffset() << std::endl;
    std::cout << "Minimum Non-Zero Y Offset(Tile Height): " << calculateMinNonZeroYOffset() << std::endl;
    auto extreme_points = findExtremePoints();
    std::cout << "Bottom Left: " << extreme_points.first.printCoordinate() << std::endl;
    std::cout << "Top Right: " << extreme_points.second.printCoordinate() << std::endl;
    std::cout << "Bounding Box Width: " << extreme_points.second.x() - extreme_points.first.x() << std::endl;
    std::cout << "Bounding Box Height: " << extreme_points.second.y() - extreme_points.first.y() << std::endl;
}
#endif

#ifdef VERBOSE
void DataManager::printDataManager(int verbose) const
{
    std::cout << "Number of Nets: " << m_netlist.num_nets() << std::endl;
    std::cout << "Number of Components: " << m_components.size() << std::endl;
    if (verbose > 0)
    {
        for (auto i : m_components)
        {
            i.second->printComponent();
        }
    }
    std::cout << "Number of Layers: " << m_layers.size() << std::endl;
    if (verbose > 0)
    {
        for (auto i : m_layers)
        {
            std::cout << "Layer Name: " << i.first << " Layer Number: " << i.second << std::endl;
        }
    }
    for (auto i : m_components)
    {
        std::cout << i.first << ":\t";
        std::cout << "Number of of Tiles(Width * Height): " << i.second->tiles().at(0).size() << " * "
                  << i.second->tiles().at(0).at(0).size() << std::endl;
    }
    if (verbose > 0)
    {
        for (auto i : m_components)
        {
            std::cout << "Component Name: " << i.first << std::endl;
            i.second->printTiles();
        }
    }
}
#endif