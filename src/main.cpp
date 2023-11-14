#include "io.hpp"
#include "log.hpp"
using namespace utils;

int main(int argc, char const *argv[])
{
    std::cout << std::boolalpha;
    printlog("--------------------------------------------------------");
    printlog("          ADR Signal for PCB Routing Project            ");
    printlog("--------------------------------------------------------");

    ADRParser adr_parser("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.adr");
    LayerParser layer_parser("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.layer");

    std::unique_ptr<DataManager> data_manager = std::make_unique<DataManager>();
    ParserManager manager(std::move(data_manager));

    manager.run(adr_parser);
    manager.run(layer_parser);
#ifdef VERBOSE
    manager.data_manager().printDataManager(1);
#endif

    printlog("--------------------------------------------------------");
    printlog("                     Terminated...                      ");
    printlog("--------------------------------------------------------");
    return 0;
}