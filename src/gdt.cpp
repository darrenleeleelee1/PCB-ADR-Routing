#include "gdt.hpp"
#include "math.hpp"
#include <cmath>
#include <ctime>
#include <iomanip>
/*
datatype = net id
datatype 255 = obstacle
datatype 254 = via
*/
std::string generateSquarePoints(Coordinate center, double width = 5)
{
    std::vector<double> points;
    points.push_back(center.x() - width / 2);
    points.push_back(center.y() - width / 2);
    points.push_back(center.x() + width / 2);
    points.push_back(center.y() - width / 2);
    points.push_back(center.x() + width / 2);
    points.push_back(center.y() + width / 2);
    points.push_back(center.x() - width / 2);
    points.push_back(center.y() + width / 2);

    std::ostringstream result_stream;
    for (size_t i = 0; i < points.size(); ++i)
    {
        result_stream << std::fixed << std::setprecision(4) << points.at(i) << " ";
    }

    return result_stream.str();
}
std::string generateRectanglePoints(Coordinate bottom_left, Coordinate top_right)
{
    std::vector<double> points;
    points.push_back(bottom_left.x());
    points.push_back(bottom_left.y());
    points.push_back(top_right.x());
    points.push_back(bottom_left.y());
    points.push_back(top_right.x());
    points.push_back(top_right.y());
    points.push_back(bottom_left.x());
    points.push_back(top_right.y());

    std::ostringstream result_stream;
    for (size_t i = 0; i < points.size(); ++i)
    {
        result_stream << std::fixed << std::setprecision(4) << points.at(i) << " ";
    }

    return result_stream.str();
}
std::string generateLinePoints(Coordinate start, Coordinate end, double width = 3)
{
    double dx = end.x() - start.x();
    double dy = end.y() - start.y();

    double length = sqrt(dx * dx + dy * dy);
    double ux = -dy / length;
    double uy = dx / length;

    std::vector<double> points;
    points.push_back(start.x() + ux * (width / 2));
    points.push_back(start.y() + uy * (width / 2));
    points.push_back(end.x() + ux * (width / 2));
    points.push_back(end.y() + uy * (width / 2));
    points.push_back(end.x() - ux * (width / 2));
    points.push_back(end.y() - uy * (width / 2));
    points.push_back(start.x() - ux * (width / 2));
    points.push_back(start.y() - uy * (width / 2));

    std::ostringstream result_stream;
    for (size_t i = 0; i < points.size(); ++i)
    {
        result_stream << std::fixed << std::setprecision(4) << points.at(i) << " ";
    }

    return result_stream.str();
}
std::string generateCirclePoints(Coordinate center, double radius = 7.0, int num_points = 32)
{
    std::vector<double> points;
    for (int i = 0; i < num_points; ++i)
    {
        double angle = (2.0 * M_PI * i) / num_points;
        double x = center.x() + radius * cos(angle);
        double y = center.y() + radius * sin(angle);
        points.push_back(x);
        points.push_back(y);
    }

    std::ostringstream result_stream;
    for (size_t i = 0; i < points.size(); ++i)
    {
        result_stream << std::fixed << std::setprecision(4) << points.at(i) << " ";
    }

    return result_stream.str();
}

void GDTWriter::pins()
{
    // mkdir GDT_files if not exists
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back(__func__);

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib '" << __func__ << "' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins'\n";
    // pins
    for (auto comp_pair : m_data_manager.components())
    {
        auto &comp = comp_pair.second;
        for (auto &pin : comp->pins())
        {
            file << "b{0 dt" << pin->net_id() << " xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
            file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                 << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
        }
    }
    file << "}\n}\n";
    file.close();
}

void GDTWriter::preprocess()
{
    // mkdir GDT_files if not exists
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back(__func__);

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib '" << __func__ << "' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins'\n";
    // pins
    for (auto comp_pair : m_data_manager.components())
    {
        auto &comp = comp_pair.second;
        for (int i = comp->pin_arr().size() - 1; i >= 0; --i)
        {
            for (size_t j = 0; j < comp->pin_arr().at(i).size(); ++j)
            {
                if (comp->pin_arr().at(i).at(j))
                {
                    auto pin = comp->pin_arr().at(i).at(j);
                    file << "b{0 dt" << pin->net_id() << " xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate missing_pin(j * comp->tile_width() + comp->bottom_left().x(),
                                           i * comp->tile_height() + comp->bottom_left().y(),
                                           0);
                    file << "b{0 dt255 xy(" << generateCirclePoints(missing_pin) << ")}\n";
                }
            }
        }
    }
    // obstacles
    for (auto obs : m_data_manager.obstacles())
    {
        file << "b{244 dt" << obs.layer() << " xy(" << generateRectanglePoints(obs.bottom_left(), obs.top_right())
             << ")}\n";
    }
    // tiling
    double tile_size = 300.0;
    int columns = std::ceil(
        (m_data_manager.pcb_bounding_box().at(1).x() - m_data_manager.pcb_bounding_box().at(0).x()) / tile_size);
    int rows = std::ceil((m_data_manager.pcb_bounding_box().at(1).y() - m_data_manager.pcb_bounding_box().at(0).y()) /
                         tile_size);
    for (int i = -1; i < rows + 1; ++i)
    {
        for (int j = -1; j < columns + 1; ++j)
        {
            Coordinate bottom_left(j * tile_size + m_data_manager.pcb_bounding_box().at(0).x(),
                                   i * tile_size + m_data_manager.pcb_bounding_box().at(0).y(),
                                   0);
            Coordinate top_right((j + 1) * tile_size + m_data_manager.pcb_bounding_box().at(0).x(),
                                 (i + 1) * tile_size + m_data_manager.pcb_bounding_box().at(0).y(),
                                 0);
            file << "b{243 dt243 xy(" << generateRectanglePoints(bottom_left, top_right) << ")}\n";
        }
    }
    file << "}\n}\n";
    file.close();
}

void GDTWriter::routing()
{
    // mkdir GDT_files if not exists
    std::string file_name = m_root_path + "DDR2DDR";
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back("DDR2DDR");

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib 'preprocessed' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins and wires'\n";
    for (auto comp_pair : m_data_manager.components())
    {
        auto &comp = comp_pair.second;
        for (int i = comp->pin_arr().size() - 1; i >= 0; --i)
        {
            for (size_t j = 0; j < comp->pin_arr().at(i).size(); ++j)
            {
                if (comp->pin_arr().at(i).at(j))
                {
                    auto pin = comp->pin_arr().at(i).at(j);
                    file << "b{0 dt" << pin->net_id() << " xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate zero_degree_bottom_left_x =
                        math::rotateCoordinate(comp->bottom_left(), -comp->rotation_angle());

                    Coordinate missing_pin(j * comp->tile_width() + zero_degree_bottom_left_x.x(),
                                           i * comp->tile_height() + zero_degree_bottom_left_x.y(),
                                           0);

                    missing_pin = math::rotateCoordinate(missing_pin, comp->rotation_angle());
                    file << "b{0 dt255 xy(" << generateCirclePoints(missing_pin) << ")}\n";
                }
            }
        }
    }
    for (auto comp_pair : m_data_manager.components())
    {
        auto comp = comp_pair.second;
        auto router = comp->router();
        for (auto &seg : router->segments())
        {
            file << "b{" << seg.start().z() << " dt" << seg.net_id() << " xy("
                 << generateLinePoints(seg.start(), seg.end()) << ")}\n";
        }
        for (auto &via : router->vias())
        {
            for (int k = via.coordinate().z(); k <= via.layer(); k++)
            {
                file << "b{" << k << " dt" << via.net_id() << " xy(" << generateSquarePoints(via.coordinate())
                     << ")}\n";
            }
        }
    }
    file << "}\n}\n";
    file.close();
}
void GDTWriter::areaRouting()
{
    // mkdir GDT_files if not exists
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back(__func__);

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib 'preprocessed' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins and wires'\n";
    for (auto comp_pair : m_data_manager.components())
    {
        auto &comp = comp_pair.second;
        for (int i = comp->pin_arr().size() - 1; i >= 0; --i)
        {
            for (size_t j = 0; j < comp->pin_arr().at(i).size(); ++j)
            {
                if (comp->pin_arr().at(i).at(j))
                {
                    auto pin = comp->pin_arr().at(i).at(j);
                    file << "b{0 dt" << pin->net_id() << " xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate zero_degree_bottom_left_x =
                        math::rotateCoordinate(comp->bottom_left(), -comp->rotation_angle());

                    Coordinate missing_pin(j * comp->tile_width() + zero_degree_bottom_left_x.x(),
                                           i * comp->tile_height() + zero_degree_bottom_left_x.y(),
                                           0);

                    missing_pin = math::rotateCoordinate(missing_pin, comp->rotation_angle());
                    file << "b{0 dt255 xy(" << generateCirclePoints(missing_pin) << ")}\n";
                }
            }
        }
    }

    for (auto comp_pair : m_data_manager.components())
    {
        auto comp = comp_pair.second;
        auto router = comp->router();
        for (auto &seg : router->segments())
        {
            file << "b{" << seg.start().z() << " dt" << seg.net_id() << " xy("
                 << generateLinePoints(seg.start(), seg.end()) << ")}\n";
        }
        for (auto &via : router->vias())
        {
            for (int k = via.coordinate().z(); k <= via.layer(); k++)
            {
                file << "b{" << k << " dt" << via.net_id() << " xy(" << generateSquarePoints(via.coordinate())
                     << ")}\n";
            }
        }
    }

    auto router = m_data_manager.area_router();
    for (auto &seg : router->segments())
    {
        file << "b{" << seg.start().z() << " dt" << seg.net_id() << " xy(" << generateLinePoints(seg.start(), seg.end())
             << ")}\n";
    }
    for (auto &via : router->vias())
    {
        for (int k = via.coordinate().z(); k <= via.layer(); k++)
        {
            file << "b{" << k << " dt" << via.net_id() << " xy(" << generateSquarePoints(via.coordinate()) << ")}\n";
        }
    }
    file << "}\n}\n";
    file.close();
}

void GDTWriter::areaRoutingWithGrid()
{
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back(__func__);

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib 'preprocessed' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins and wires'\n";
    for (auto comp_pair : m_data_manager.components())
    {
        auto &comp = comp_pair.second;
        for (int i = comp->pin_arr().size() - 1; i >= 0; --i)
        {
            for (size_t j = 0; j < comp->pin_arr().at(i).size(); ++j)
            {
                if (comp->pin_arr().at(i).at(j))
                {
                    auto pin = comp->pin_arr().at(i).at(j);
                    file << "b{0 dt" << pin->net_id() << " xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate zero_degree_bottom_left_x =
                        math::rotateCoordinate(comp->bottom_left(), -comp->rotation_angle());

                    Coordinate missing_pin(j * comp->tile_width() + zero_degree_bottom_left_x.x(),
                                           i * comp->tile_height() + zero_degree_bottom_left_x.y(),
                                           0);

                    missing_pin = math::rotateCoordinate(missing_pin, comp->rotation_angle());
                    file << "b{0 dt255 xy(" << generateCirclePoints(missing_pin) << ")}\n";
                }
            }
        }
    }

    for (auto comp_pair : m_data_manager.components())
    {
        auto comp = comp_pair.second;
        auto router = comp->router();
        for (auto &seg : router->segments())
        {
            file << "b{" << seg.start().z() << " dt" << seg.net_id() << " xy("
                 << generateLinePoints(seg.start(), seg.end()) << ")}\n";
        }
        for (auto &via : router->vias())
        {
            for (int k = via.coordinate().z(); k <= via.layer(); k++)
            {
                file << "b{" << k << " dt" << via.net_id() << " xy(" << generateSquarePoints(via.coordinate())
                     << ")}\n";
            }
        }
    }

    auto router = m_data_manager.area_router();
    for (auto &seg : router->segments())
    {
        file << "b{" << seg.start().z() << " dt" << seg.net_id() << " xy(" << generateLinePoints(seg.start(), seg.end())
             << ")}\n";
    }
    for (auto &via : router->vias())
    {
        for (int k = via.coordinate().z(); k <= via.layer(); k++)
        {
            file << "b{" << k << " dt" << via.net_id() << " xy(" << generateSquarePoints(via.coordinate()) << ")}\n";
        }
    }
    // grid std::unordered_map<int, std::shared_ptr<A_Star::Grid>> m_grids;
    for (const auto &grid_map : m_data_manager.grids())
    {
        const auto &layer = grid_map.first;
        const auto &grid = grid_map.second;
        // mark the obstacle girids with bottom_left and top_right and grid_width
        Coordinate bottom_left = grid->bottome_left;
        double grid_width = grid->grid_witdh;
        for (int i = 0; i < grid->rows; ++i)
        {
            for (int j = 0; j < grid->cols; ++j)
            {
                if (grid->grid.at(i).at(j) == 1)
                {
                    Coordinate start(bottom_left.x() + i * grid_width, bottom_left.y() + j * grid_width, 0);
                    Coordinate end(bottom_left.x() + (i + 1) * grid_width, bottom_left.y() + (j + 1) * grid_width, 0);
                    file << "b{" << layer << " dt244 xy(" << generateRectanglePoints(start, end) << ")}\n";
                }
            }
        }
    }

    file << "}\n}\n";
    file.close();
}

void GDTWriter::gdt2gds(std::string prefix)
{
    std::string command;
    std::string gdt_file_path, gds_file_path;
    for (auto file : m_gdt_files)
    {
        gdt_file_path = m_root_path + file;
        gds_file_path = m_output_path + prefix + "_" + file + ".gds";
        command = m_gdt2gds_path + " " + gdt_file_path + " " + gds_file_path + "\n";
        system(command.c_str());
    }
}
