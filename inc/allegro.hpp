#ifndef ALLEGRO_HPP
#define ALLEGRO_HPP
#include "component_data.hpp"
#include <filesystem>
#include <fstream>
#include <string>
class CLPWriter
{
private:
    DataManager &m_data_manager;
    std::string m_root_path = "outputs/clp_files/";
    std::string m_output_path = "outputs/";
    std::vector<std::string> m_clp_files;
    std::string coordinate2string(const double &x, const double &y);
    std::string signature();
    std::string formatWireWidth(double wire_width) const;
    std::string addVia(const Via &via, const std::string &netName);
    std::string addSegment(const Segment &seg, const double &wire_width);
    std::string clpShow();

public:
    // Constructor
    explicit CLPWriter(DataManager &data_manager)
        : m_data_manager(data_manager)
    {
        std::filesystem::create_directories("outputs/clp_files");
    }
    // Destructor
    ~CLPWriter()
    {
        // remove GDT_files directory
        std::filesystem::remove_all("outputs/clp_files");
    }
    // Methods
    void DDR2DDR();
    void areaRouting();
    void moveClps(std::string prefix);
};

#endif // ALLEGRO_HPP