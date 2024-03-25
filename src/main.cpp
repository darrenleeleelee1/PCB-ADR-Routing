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
    // LayerParser
    parser_manager.addParser(std::make_unique<LayerParser>(Layer_Path));
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

    utils::printlog("Routing DDR2DDR...");
    // DDRs escape routing, wire assignment
    data_manager->DDR2DDR();
    // CPU escape routing, wire assignment
    data_manager->CPU2DDR();
#ifdef GDT
    gdt_writer.routing();
#endif
    // Area routing
    // Area routing initialization
    for (auto &c : data_manager->components())
    {
        auto comp = c.second;
        comp->initializeAreaRouting();
    }
    Coordinate diagonal_start_line(0, 2950, 0);
#ifdef VERBOSE
    // dump nets in data_manager
    for (auto &np : data_manager->netlists())
    {
        std::cout << "Net name"
                  << ","
                  << "Escape wirelength"
                  << ","
                  << "DDR layer"
                  << ","
                  << "Height orthogonal"
                  << ","
                  << "Height diagonal" << std::endl;
        // netlist裡的comp 要和comp對齊
        for (auto &net : np.second.nets())
        {
            double escape_wirelength = 0;
            Via via;
            for (auto &pin : net->pins())
            {
                for (auto &c : data_manager->components())
                {
                    auto comp = c.second;
                    if (pin->comp_name() == comp->comp_name())
                    {
                        auto &router = comp->router();
                        Coordinate cur;
                        for (auto &s : router->segments())
                        {
                            Segment *seg = &s;
                            if (seg->start() == pin->coordinate() || seg->end() == pin->coordinate())
                            {
                                cur = seg->start() == pin->coordinate() ? seg->end() : seg->start();
                            }
                            else
                                continue;
                            bool keep_going = false;
                            double wirelength = 0;
                            // ---trace wire---
                            do
                            {
                                // dump segments

                                wirelength += std::sqrt(std::pow(seg->start().x() - seg->end().x(), 2) +
                                                        std::pow(seg->start().y() - seg->end().y(), 2));
                                keep_going = false;
                                for (auto &o_s : router->segments())
                                {
                                    Segment *other_seg = &o_s;
                                    if (*seg != *other_seg)
                                    {
                                        if (other_seg->start() == cur || other_seg->end() == cur)
                                        {
                                            cur = other_seg->start() == cur ? other_seg->end() : other_seg->start();
                                            keep_going = true;
                                            seg = other_seg;
                                            break;
                                        }
                                    }
                                }
                            } while (keep_going);
                            // ---trace wire---

                            for (auto &v : router->vias())
                            {
                                if (v.coordinate() == seg->start() || v.coordinate() == seg->end())
                                {
                                    via = v;
                                    break;
                                }
                            }
                            if (!comp->is_cpu())
                            {
                                if (!comp->is_verticle_stack())
                                {
                                    // get the comp->m_bounding_box
                                    auto &[ll_bound, ur_bound] = comp->bounding_box();
                                    if (comp->neighboors().at(0) && comp->neighboors().at(1))
                                    {
                                        wirelength +=
                                            ur_bound.x() - ll_bound.x() + 2 * (std::sqrt(2) - 1) * comp->tile_width();
                                        comp->wire_on_boundary().at(pin->net_name()).at(1) =
                                            Coordinate(ur_bound.x(),
                                                       via.coordinate().y() - 0.5 * comp->tile_height(),
                                                       via.layer());
                                        comp->wire_on_boundary().at(pin->net_name()).at(3) =
                                            Coordinate(ll_bound.x(),
                                                       via.coordinate().y() - 0.5 * comp->tile_height(),
                                                       via.layer());
                                    }
                                    else if (comp->neighboors().at(0))
                                    {
                                        wirelength += via.coordinate().x() - ll_bound.x() +
                                                      (std::sqrt(2) - 1) * comp->tile_width();
                                    }
                                    else
                                    {
                                        wirelength += ur_bound.x() - via.coordinate().x() +
                                                      (std::sqrt(2) - 1) * comp->tile_width();
                                    }
                                }
                            }
                            else
                            {
                                net->height_orthogonal() = cur.y() - diagonal_start_line.y();
                                if (data_manager->cpu_escape_boundry() == "N")
                                    comp->wire_on_boundary().at(pin->net_name()).at(0) = cur;
                                if (data_manager->cpu_escape_boundry() == "E")
                                    comp->wire_on_boundary().at(pin->net_name()).at(1) = cur;
                                if (data_manager->cpu_escape_boundry() == "S")
                                    comp->wire_on_boundary().at(pin->net_name()).at(2) = cur;
                                if (data_manager->cpu_escape_boundry() == "W")
                                    comp->wire_on_boundary().at(pin->net_name()).at(3) = cur;
                            }
                            escape_wirelength += wirelength;
                        }
                    }
                }
            }
            net->escape_length() = escape_wirelength;
            net->height_diagonal() = diagonal_start_line.y() - via.coordinate().y();
            net->ddr_layer() = via.layer();

            std::cout << net->net_name() << "," << net->escape_length() << "," << net->ddr_layer() << ","
                      << net->height_orthogonal() << "," << net->height_diagonal() << std::endl;
        }
    }
#endif
    data_manager->areaRouting(diagonal_start_line);
#ifdef GDT
    gdt_writer.areaRouting();

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