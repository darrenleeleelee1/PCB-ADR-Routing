#include "io.hpp"
#include "log.hpp"
using namespace utils;

int main(int argc, char const *argv[])
{
    std::cout << std::boolalpha;
    printlog("--------------------------------------------------------");
    printlog("          ADR Signal for PCB Routing Project            ");
    printlog("--------------------------------------------------------");

    std::unique_ptr<DataManager> data_manager = std::make_unique<DataManager>();
    ParserManager manager(std::move(data_manager));

    // manager.addParser(std::make_unique<ADRParser>("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.adr"));
    manager.addParser(std::make_unique<ADRParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/easy.adr"));
    manager.addParser(std::make_unique<LayerParser>("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.layer"));

    manager.run();
    manager.splitingTiles();

#ifdef VERBOSE
    manager.data_manager().printDataManager(0);
#endif

    printlog("--------------------------------------------------------");
    printlog("                     Terminated...                      ");
    printlog("--------------------------------------------------------");
    return 0;
}