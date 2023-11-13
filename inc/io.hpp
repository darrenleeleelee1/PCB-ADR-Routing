#ifndef IO_HPP
#define IO_HPP

#include "component_data.hpp"
#include <fstream>
#include <string>

class ADRParser
{
public:
    explicit ADRParser(const std::string &filename);
    ~ADRParser();

    void parse();

private:
    std::ifstream file;
    std::unordered_map<std::string, Component> components;
    // Helper functions if needed
};

#endif // IO_HPP
