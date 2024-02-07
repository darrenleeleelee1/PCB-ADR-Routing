#include "gdt.hpp"
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

    // Preprocess data
    utils::printlog("Preprocessing data...");
    data_manager->preprocess(); // case4, case5, case6
    // data_manager->preprocess(25); case2
#ifdef GDT
    GDTWriter gdt_writer(*data_manager);
    gdt_writer.preprocess();
#endif

    // Router DDR2DDR
    utils::printlog("Routing DDR2DDR...");
    std::shared_ptr<Router> router = std::make_shared<Router>();
    router->DDR2DDR(data_manager);

    // Router CPU2DDR
    router->CPU2DDR(data_manager);
#ifdef GDT
    gdt_writer.DDR2DDR(*router);
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