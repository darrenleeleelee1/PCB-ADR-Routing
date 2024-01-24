#include "gdt.hpp"
#include <cmath>
#include <ctime>
#include <filesystem>
#include <iomanip>
std::string generateRectanglePoints(Coordinate start, Coordinate end, double width = 3)
{
    // 計算 start 到 end 的向量
    double dx = end.x() - start.x();
    double dy = end.y() - start.y();

    // 計算垂直於這個向量的單位向量
    double length = sqrt(dx * dx + dy * dy);
    double ux = -dy / length;
    double uy = dx / length;

    // 計算矩形的四個頂點
    std::vector<double> points;
    points.push_back(start.x() + ux * (width / 2));
    points.push_back(start.y() + uy * (width / 2));
    points.push_back(end.x() + ux * (width / 2));
    points.push_back(end.y() + uy * (width / 2));
    points.push_back(end.x() - ux * (width / 2));
    points.push_back(end.y() - uy * (width / 2));
    points.push_back(start.x() - ux * (width / 2));
    points.push_back(start.y() - uy * (width / 2));

    // 將點轉換成字串
    std::ostringstream result_stream;
    for (size_t i = 0; i < points.size(); ++i)
    {
        result_stream << std::fixed << std::setprecision(4) << points.at(i) << " ";
    }

    return result_stream.str();
}
std::string generateCirclePoints(double center_x, double center_y, double radius = 7.0, int num_points = 32)
{
    std::vector<double> points;

    for (int i = 0; i < num_points; ++i)
    {
        double angle = (2.0 * M_PI * i) / num_points;
        double x = center_x + radius * cos(angle);
        double y = center_y + radius * sin(angle);
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

void GDTWriter::preprocess()
{
    // mkdir GDT_files if not exists
    std::filesystem::create_directory("GDT_files");
    std::ofstream file("GDT_files/preprocess.gdt", std::ios::trunc);

    std::time_t current_time = std::time(nullptr);
    struct std::tm *time_info;
    char formatted_time[20]; // 20 characters are enough to hold "YYYY-MM-DD HH:MM:SS\0"

    time_info = std::localtime(&current_time);
    std::strftime(formatted_time, sizeof(formatted_time), "%Y-%m-%d %H:%M:%S", time_info);

    std::string formatted_time_str(formatted_time);

    file << "gds2{5\n";
    file << "m=" << formatted_time_str << " a=" << formatted_time_str << "\nlib 'preprocessed' 0.001 1e-09\n";
    file << "cell{c=" << formatted_time_str << " m=" << formatted_time_str << " 'pins'\n";
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
                    file << "b{0 xy(" << generateCirclePoints(pin->coordinate().x(), pin->coordinate().y()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate missing_pin(j * comp->tile_width() + comp->bottom_left().x(),
                                           i * comp->tile_height() + comp->bottom_left().y(),
                                           0);
                    file << "b{0 xy(" << generateCirclePoints(missing_pin.x(), missing_pin.y()) << ")}\n";
                }
            }
        }
    }
    /*
    for (auto netlist : m_data_manager.netlists())
    {
        for (auto net : netlist.second.nets())
        {
            for (auto pin : net->pins())
            {
                file << "b{0 xy(" << generateCirclePoints(pin->coordinate().x(), pin->coordinate().y()) << ")}\n";
                file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                     << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
            }
        }
    }
    */
    file << "}\n}\n";
    file.close();
}

void GDTWriter::via_assignment(Router &router)
{
    // mkdir GDT_files if not exists
    std::filesystem::create_directory("GDT_files");
    std::ofstream file("GDT_files/via_assignment.gdt", std::ios::trunc);

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
                    file << "b{0 xy(" << generateCirclePoints(pin->coordinate().x(), pin->coordinate().y()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate missing_pin(j * comp->tile_width() + comp->bottom_left().x(),
                                           i * comp->tile_height() + comp->bottom_left().y(),
                                           0);
                    file << "b{0 xy(" << generateCirclePoints(missing_pin.x(), missing_pin.y()) << ")}\n";
                }
            }
        }
    }
    for (auto &seg : router.segments())
    {
        file << "b{" << seg.start().z() << " xy(" << generateRectanglePoints(seg.start(), seg.end()) << ")}\n";
    }
    for (auto &via : router.vias())
    {
        for (int k = via.coordinate().z(); k <= via.layer(); k++)
        {
            file << "b{" << k << " xy(" << generateCirclePoints(via.coordinate().x(), via.coordinate().y(), 8.0)
                 << ")}\n";
            file << "b{" << k << " xy(" << generateCirclePoints(via.coordinate().x(), via.coordinate().y(), 4.0)
                 << ")}\n";
        }
    }
    file << "}\n}\n";
    file.close();
}
