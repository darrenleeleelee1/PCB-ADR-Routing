#include "component_data.hpp"
#include "graph.hpp"
#include "io.hpp"
#include "log.hpp"
using namespace utils;

int main(int argc, char const *argv[])
{
    std::cout << std::boolalpha;
    printlog("--------------------------------------------------------");
    printlog("          ADR Signal for PCB Routing Project            ");
    printlog("--------------------------------------------------------");

    std::shared_ptr<DataManager> data_manager = std::make_shared<DataManager>();

    // Parser order is matter, Orders: OrderParser, ADRParser, LayerParser
    ParserManager parser_manager(data_manager);

    // OrderParser
    // parser_manager.addParser(std::make_unique<OrderParser>("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.odr"));
    parser_manager.addParser(std::make_unique<OrderParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/baby.odr"));

    // ADRParser
    // parser_manager.addParser(std::make_unique<ADRParser>("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.adr"));
    parser_manager.addParser(std::make_unique<ADRParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/baby.adr"));

    // LayerParser
    // parser_manager.addParser(std::make_unique<LayerParser>("/DATA/darren/PCB/PCB-ADR-Routing/case/2/2.layer"));
    parser_manager.addParser(std::make_unique<LayerParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/baby.layer"));

    parser_manager.run();

    data_manager->initialComponents();

    GraphManager graph_manager(data_manager);
    graph_manager.buildGraph();

#ifdef VERBOSE
    parser_manager.data_manager().printDataManager(0);
    graph_manager.outputVerticesToJson("/DATA/darren/PCB/PCB-ADR-Routing/outputs/vertices.json");
#endif

    printlog("--------------------------------------------------------");
    printlog("                     Terminated...                      ");
    printlog("--------------------------------------------------------");
    return 0;
}