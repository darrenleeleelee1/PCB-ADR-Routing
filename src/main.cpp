#include "gdt.hpp"
#include "graph.hpp"
#include "io.hpp"
#include "log.hpp"
#define GDT
int main(int argc, char const *argv[])
{
    std::cout << std::boolalpha;
    utils::printlog("--------------------------------------------------------");
    utils::printlog("          ADR Signal for PCB Routing Project            ");
    utils::printlog("--------------------------------------------------------");

    // argv[1] is case path
    std::string case_path = argv[1]; // /DATA/darren/PCB/PCB-ADR-Routing/case/
    // argv[2] is case number
    std::string case_number = argv[2];

    std::string ADR_Path = case_path + case_number + "/" + case_number + ".adr";
    std::string Layer_Path = case_path + case_number + "/" + case_number + ".layer";

    std::shared_ptr<DataManager> data_manager = std::make_shared<DataManager>();

    // Parser order is matter, Orders: ADRParser, LayerParser
    ParserManager parser_manager(data_manager);

    // ADRParser
    parser_manager.addParser(std::make_unique<ADRParser>(ADR_Path));
    // parser_manager.addParser(std::make_unique<ADRParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/baby.adr"));
    // LayerParser
    parser_manager.addParser(std::make_unique<LayerParser>(Layer_Path));
    // parser_manager.addParser(std::make_unique<LayerParser>("/DATA/darren/PCB/PCB-ADR-Routing/outputs/baby.layer"));
    if (parser_manager.run())
    {
        utils::printlog("Successfully parsed.");
    }

    data_manager->preprocess();

#ifdef GDT
    GDTWriter gdt_writer(*data_manager);
    gdt_writer.preprocess();
#endif
    std::shared_ptr<Router> router = std::make_shared<Router>();

    for (auto comp : data_manager->components())
    {
        std::shared_ptr<GraphManager> graph_manager = std::make_shared<GraphManager>(*data_manager, *comp.second);
        graph_manager->minCostMaxFlow(*router);
    }
#ifdef GDT
    gdt_writer.via_assignment(*router);
#endif
    utils::printlog("--------------------------------------------------------");
    utils::printlog("                     Terminated...                      ");
    utils::printlog("--------------------------------------------------------");
    return 0;
}