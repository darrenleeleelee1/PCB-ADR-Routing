#include "gdt.hpp"
#include "io.hpp"
#include "log.hpp"
#include <unordered_set>
#define GDT
int main(int argc, char const *argv[])
{
    if (argc != 3)
    {
        std::cerr << "Usage: " << argv[0] << " <case_path> <case_number>" << std::endl;
        return 1;
    }
    // argv[1] is case path
    std::string case_path = argv[1]; // /DATA/darren/PCB/PCB-ADR-Routing/case/
    // argv[2] is case number
    std::string case_number = argv[2];

    std::cout << std::boolalpha;
    utils::printlog("--------------------------------------------------------");
    utils::printlog("          ADR Signal for PCB Routing Project            ");
    utils::printlog("--------------------------------------------------------");
    utils::printlog("Case path: " + case_path);
    utils::printlog("Case number: " + case_number);

    // Declare DataManager, ParserManager, GDTWriter
    std::shared_ptr<DataManager> data_manager = std::make_shared<DataManager>();
    ParserManager parser_manager(data_manager);
    GDTWriter gdt_writer(*data_manager);

    // Set case number
    std::string ADR_Path = case_path + case_number + "/" + case_number + ".adr";
    std::string Layer_Path = case_path + case_number + "/" + case_number + ".layer";
    std::string Obstacles_Path = case_path + case_number + "/" + case_number + ".obs";
    std::string Component_Path = case_path + case_number + "/" + case_number + ".component";
    std::string Edge_Path = case_path + case_number + "/" + case_number + ".edge";

    // Parser order is matter, Orders: ObstaclesParser, ADRParser, LayerParser
    parser_manager.addParser(std::make_unique<ObstaclesParser>(Obstacles_Path));
    parser_manager.addParser(std::make_unique<ADRParser>(ADR_Path));
    parser_manager.addParser(std::make_unique<LayerParser>(Layer_Path));
    parser_manager.addParser(std::make_unique<ComponentParser>(Component_Path));
    parser_manager.addParser(std::make_unique<EdgeParser>(Edge_Path));

    if (parser_manager.run())
    {
        utils::printlog("Successfully parsed.");
    }

    // Preprocess data
    utils::printlog("Preprocessing data...");
    data_manager->preprocess_ER();
#ifdef GDT
    gdt_writer.pins();
    gdt_writer.preprocess();
#endif

    utils::printlog("Escape Routing DDR2DDR...");
    data_manager->DDR2DDR();
    utils::printlog("Escape Routing CPU2DDR...");
    data_manager->CPU2DDR();
    data_manager->postprocess_ER();
#ifdef GDT
    gdt_writer.routing();
#endif

    utils::printlog("Area Routing DDR2DDR...");
    data_manager->AreaRouting();
#ifdef GDT
    gdt_writer.areaRouting();
#endif
    // Analyze wirelength
    utils::printlog("Analyzing wirelength...");
    data_manager->analyzeWirelength();
    // Produce all gds
#ifdef GDT
gdt2gds:
    utils::printlog("Converting GDT to GDS...");
    gdt_writer.gdt2gds(case_number);
#endif
    utils::printlog("--------------------------------------------------------");
    utils::printlog("                     Terminated...                      ");
    utils::printlog("--------------------------------------------------------");
    return 0;
}