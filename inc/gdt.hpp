#ifndef GDT_HPP
#define GDT_HPP

#include "component_data.hpp"
#include <fstream>
#include <string>

class GDTWriter
{
private:
    DataManager &m_data_manager;

public:
    // Constructor
    explicit GDTWriter(DataManager &data_manager)
        : m_data_manager(data_manager)
    {
    }
    // Methods
    void preprocess();
    void via_assignment(Router &router);
};

#endif // GDT_HPP