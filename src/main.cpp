#include "gdt.hpp"
#include "io.hpp"
#include "log.hpp"
#include <unordered_set>
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
    // Declare DataManager, ParserManager, GDTWriter
    std::shared_ptr<DataManager> data_manager = std::make_shared<DataManager>();
    ParserManager parser_manager(data_manager);
    GDTWriter gdt_writer(*data_manager);
    // Set case number
    std::string ADR_Path = case_path + case_number + "/" + case_number + ".adr";
    std::string Layer_Path = case_path + case_number + "/" + case_number + ".layer";
    std::string Obstacles_Path = case_path + case_number + "/" + case_number + ".obs";
    std::string Component_Path = case_path + case_number + "/" + case_number + ".component";

    // Parser order is matter, Orders: ObstaclesParser, ADRParser, LayerParser
    parser_manager.addParser(std::make_unique<ObstaclesParser>(Obstacles_Path));
    parser_manager.addParser(std::make_unique<ADRParser>(ADR_Path));
    parser_manager.addParser(std::make_unique<LayerParser>(Layer_Path));
    parser_manager.addParser(std::make_unique<ComponentParser>(Component_Path));

    if (parser_manager.run())
    {
        utils::printlog("Successfully parsed.");
    }

    // Preprocess data
    utils::printlog("Preprocessing data...");
    data_manager->preprocess(); // case4, case5, case6
    // data_manager->preprocess(25); case2
#ifdef GDT
    gdt_writer.preprocess();
#endif

    utils::printlog("Routing DDR2DDR...");
    data_manager->DDR2DDR();
    utils::printlog("Routing CPU2DDR...");
    data_manager->CPU2DDR();
#ifdef GDT
    gdt_writer.routing();
#endif

    // Produce all gds
#ifdef GDT
    utils::printlog("Converting GDT to GDS...");
    gdt_writer.gdt2gds(case_number);
#endif
    utils::printlog("--------------------------------------------------------");
    utils::printlog("                     Terminated...                      ");
    utils::printlog("--------------------------------------------------------");
    return 0;
}