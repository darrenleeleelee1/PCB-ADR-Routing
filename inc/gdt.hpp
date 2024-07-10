#ifndef GDT_HPP
#define GDT_HPP

#include "component_data.hpp"
#include <filesystem>
#include <fstream>
#include <string>
class GDTWriter
{
private:
    DataManager &m_data_manager;
    std::string m_root_path = "outputs/GDT_files/";
    std::string m_output_path = "outputs/";
    std::string m_gdt2gds_path = "/DATA/darren/PCB/PCB-ADR-Routing/tools/gdt2gds";
    std::vector<std::string> m_gdt_files;
    static int writer_count;

public:
    // Constructor
    explicit GDTWriter(DataManager &data_manager)
        : m_data_manager(data_manager)
    {
        m_root_path = "outputs/GDT_files" + std::to_string(writer_count) + "/";
    writer_count++;
        std::filesystem::create_directories(m_root_path);
        if (!std::filesystem::exists(m_gdt2gds_path))
        {
            throw std::runtime_error("gdt2gds not found at " + m_gdt2gds_path);
        }
    }
    // Destructor
    ~GDTWriter()
    {
        // remove GDT_files directory
        std::filesystem::remove_all(m_root_path);
    }
    // Methods
    void cleanFiles() {
        m_gdt_files.clear();
    }
    void pins();
    void preprocess();
    void routing();
    void areaRouting();
    void debugging(const int & loop_count);
    void areaRoutingWithGrid();
    void gdt2gds(const std::string & prefix);
};

#endif // GDT_HPP