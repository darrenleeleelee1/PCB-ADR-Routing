#include "gdt.hpp"
#include <cmath>
#include <ctime>
#include <iomanip>
std::string generateSquarePoints(Coordinate center, double width = 3)
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

void GDTWriter::preprocess()
{
    // mkdir GDT_files if not exists
    std::string file_name = m_root_path + "preprocess";
    std::ofstream file(file_name, std::ios::trunc);
    m_gdt_files.push_back("preprocess");

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
                    file << "b{0 xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate missing_pin(j * comp->tile_width() + comp->bottom_left().x(),
                                           i * comp->tile_height() + comp->bottom_left().y(),
                                           0);
                    file << "b{0 xy(" << generateCirclePoints(missing_pin) << ")}\n";
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

void GDTWriter::DDR2DDR(Router &router)
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
                    file << "b{0 xy(" << generateCirclePoints(pin->coordinate()) << ")}\n";
                    file << "t{255 tt" << pin->net_id() << " mc m2 xy(" << pin->coordinate().x() << ", "
                         << pin->coordinate().y() << ") '" << pin->net_id() << "'}\n";
                }
                else
                {
                    Coordinate missing_pin(j * comp->tile_width() + comp->bottom_left().x(),
                                           i * comp->tile_height() + comp->bottom_left().y(),
                                           0);
                    file << "b{0 xy(" << generateCirclePoints(missing_pin) << ")}\n";
                }
            }
        }
    }
    for (auto &seg : router.segments())
    {
        file << "b{" << seg.start().z() << " xy(" << generateLinePoints(seg.start(), seg.end()) << ")}\n";
    }
    for (auto &via : router.vias())
    {
        for (int k = via.coordinate().z(); k <= via.layer(); k++)
        {
            file << "b{" << k << " xy(" << generateSquarePoints(via.coordinate(), 9.0) << ")}\n";
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
