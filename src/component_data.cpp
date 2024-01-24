#include "component_data.hpp"
// Find the corner points of the component
std::pair<Coordinate, Coordinate> Component::findBoundingBox()
{
    double min_x = std::numeric_limits<double>::max();
    double min_y = std::numeric_limits<double>::max();
    double max_x = std::numeric_limits<double>::lowest();
    double max_y = std::numeric_limits<double>::lowest();

    for (const auto &pin : m_pins)
    {
        min_x = std::min(min_x, pin->coordinate().x());
        min_y = std::min(min_y, pin->coordinate().y());
        max_x = std::max(max_x, pin->coordinate().x());
        max_y = std::max(max_y, pin->coordinate().y());
    }

    Coordinate bottom_left{min_x, min_y, 0};
    Coordinate top_right{max_x, max_y, 0};

    return {bottom_left, top_right};
}
double Component::calculateTileWidth(double y_tolerance)
{
    // Tolerance is for y difference that is considered to be the same row
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1 != pin2)
            {
                double y_diff = std::abs(pin1->coordinate().y() - pin2->coordinate().y());
                if (y_diff > y_tolerance)
                { // Check if y difference is within tolerance
                    double x_offset = std::abs(pin1->coordinate().x() - pin2->coordinate().x());
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

double Component::calculateTileHeight(double x_tolerance)
{
    // Tolerance is for x difference that is considered to be the same row
    double min_offset = std::numeric_limits<double>::max();
    for (const auto &pin1 : m_pins)
    {
        for (const auto &pin2 : m_pins)
        {
            if (pin1 != pin2)
            {
                double x_diff = std::abs(pin1->coordinate().x() - pin2->coordinate().x());
                if (x_diff > x_tolerance)
                { // Check if x difference is within tolerance
                    double y_offset = std::abs(pin1->coordinate().y() - pin2->coordinate().y());
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
void Component::createPinArr()
{
    // Find the corner points of the component
    auto [bottom_left, top_right] = findBoundingBox();
    m_bottom_left = bottom_left;
    m_top_right = top_right;
    // Calculate the tile width and height
    double tile_width = calculateTileWidth();
    double tile_height = calculateTileHeight();
    m_tile_width = tile_width;
    m_tile_height = tile_height;

    // Calculate the number of rows and columns
    int rows = static_cast<int>(std::round((m_top_right.y() - m_bottom_left.y()) / tile_height)) + 1;
    int columns = static_cast<int>(std::round((m_top_right.x() - m_bottom_left.x()) / tile_width)) + 1;
    m_rows = rows;
    m_columns = columns;

    // Initialize the pin_arr
    m_pin_arr =
        std::vector<std::vector<std::shared_ptr<Pin>>>(rows, std::vector<std::shared_ptr<Pin>>(columns, nullptr));

    // Fill the pin_arr
    for (const auto &pin : m_pins)
    {
        int row = static_cast<int>(std::round((pin->coordinate().y() - m_bottom_left.y()) / tile_height));
        int column = static_cast<int>(std::round((pin->coordinate().x() - m_bottom_left.x()) / tile_width));
        m_pin_arr.at(row).at(column) = pin;
    }
#ifdef VERBOSE
    // std::cout << "Pin Arr: " << std::endl;
    // for (int i = m_pin_arr.size() - 1; i >= 0; --i)
    // {
    //     for (size_t j = 0; j < m_pin_arr.at(i).size(); ++j)
    //     {
    //         if (m_pin_arr.at(i).at(j))
    //         {
    //             std::cout << m_pin_arr.at(i).at(j)->net_name() << " ";
    //         }
    //         else
    //         {
    //             std::cout << "NULL ";
    //         }
    //     }
    //     std::cout << std::endl;
    // }
#endif
}

void DataManager::createNetlist(int count)
{
    if (!m_netlists.count(count))
    {
        m_netlists[count] = Netlist();
    }
    else
    {
        throw std::runtime_error("Error: Netlist " + std::to_string(count) + " already exists");
    }
}
void DataManager::addCompPin(std::string comp_name, std::shared_ptr<Pin> pin)
{
    if (m_components.count(comp_name))
    {
        m_components[comp_name]->addPin(pin);
    }
    else
    {
        m_components[comp_name] = std::make_shared<Component>(comp_name);
    }
}
void DataManager::preprocess()
{
    for (auto &comp : m_components)
    {
        comp.second->createPinArr();
    }
}