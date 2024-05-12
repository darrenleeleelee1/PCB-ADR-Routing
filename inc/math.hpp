#ifndef MATH_HPP
#define MATH_HPP
#include "component_data.hpp"
#include <filesystem>
#include <fstream>
namespace math
{
Coordinate rotateCoordinate(const Coordinate &point, const double &angle);

class ILP
{
private:
    std::string ILP_script_path = "/DATA/darren/PCB/PCB-ADR-Routing/scripts/ILP_solver.py";
    std::string processing_dir = "outputs/ILP_files/";
    // Constructor
    explicit ILP()
    {
        std::filesystem::create_directories(processing_dir);
        if (!std::filesystem::exists(ILP_script_path))
        {
            throw std::runtime_error("ILP_script_path not found at " + ILP_script_path);
        }
    }
    // Destructor
    ~ILP()
    {
        // remove GDT_files directory
        // std::filesystem::remove_all(processing_dir);
    }

public:
};
} // namespace math
#endif // MATH_HPP