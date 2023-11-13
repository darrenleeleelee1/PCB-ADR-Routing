#include "io.hpp"
#include <iostream>
int main(int argc, char const *argv[])
{
    try
    {
        ADRParser parser("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.adr");
        parser.parse();
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error: " << e.what() << std::endl;
    }

    return 0;
}