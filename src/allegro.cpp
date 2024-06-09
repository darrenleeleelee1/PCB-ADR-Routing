#include "allegro.hpp"
#include <iomanip>
std::string CLPWriter::coordinate2string(const double &x, const double &y)
{
    std::ostringstream oss;
    oss << std::fixed << std::setprecision(2);
    oss << x << ":" << y;
    return oss.str();
}
std::string CLPWriter::signature()
{
    std::string str = "";

    str += "; Allegro sub-drawing file\n";
    str += "; Created by Allegro Venture PCB Designer Suite; version= 17.4-2019 P001\n";
    str += "\n";
    str += "_clp_lay_drw = axlDesignType(nil)\n";
    str += "_clp_sym = nil\n";
    str += "_clp_pbuf  = nil\n";
    str += "_clpFormid = nil\n";
    str += "(when (equal axlDesignType(nil) \"LAYOUT\") _clpFormid = _clpMSOpenAssign())\n";
    str += "_clp_cinfo = make_clp_coord_info()\n";
    str += "_clp_cinfo->f_rotation = 0.0\n";
    str += "_clp_cinfo->l_origin = '(0.0 0.0)\n";
    str += "_clp_text_orient = make_axlTextOrientation()\n";
    str += "_clp_pin_text = make_axlPinText()\n";
    str += "_clp_cinfo->t_from_units = \"mils\"\n";
    str += "_clp_cinfo->t_to_units = car(axlDBGetDesignUnits())\n";
    str += "_clp_cinfo->preserve_shape_net = t\n";
    str += "_clp_cinfo->preserve_via_net = t\n";
    str += "_clp_cinfo->snapToObject = nil\n";
    str += "_clp_cinfo->createNCLayers = nil\n";
    str += "_clp_group_info = make_clp_group_info()\n";
    str += "_clp_cinfo->group_info = _clp_group_info\n";
    str += "_clp_accuracy = 2\n";
    str += "_clpCheckAccuracy(_clp_accuracy _clp_cinfo->t_from_units _clp_cinfo->t_to_units)\n";
    str += "(putprop _clp_cinfo (list (_clpAdjustPt 0:0 _clp_cinfo)\n";
    str += "    (_clpAdjustPt 10000.00:10000.00 _clp_cinfo)) 'l_extents)\n";
    str += "(putprop _clp_cinfo (_clpAdjustPt '(0.0 0.0) _clp_cinfo) 'l_zeropt)\n";
    str += "(unless (_clpSelectRotOrg _clp_cinfo)\n";
    str += "    (error \"CANCEL\"))\n";
    str += "_clp_clip_prop_value = _clpGetClipPropValue()\n";
    str += "\n";
    str += "(if _clpFormid then\n";
    str += "    clpFormValue = _clpFormid->curValue\n";
    str += "else\n";
    str += "    clpFormValue = nil)\n\n";

    return str;
}
std::string viaLayerToString(const Via &via, const std::unordered_map<int, std::string> &layer2name)
{
    std::string str = "";
    str += layer2name.at(via.coordinate().z()) + "-" + layer2name.at(via.layer());
    return str;
}
std::string CLPWriter::addVia(const Via &via, const std::string &netName)
{
    std::string str = "";
    const std::string &viaType = viaLayerToString(via, m_data_manager.layers());
    const std::string &coordinates = coordinate2string(via.coordinate().x(), via.coordinate().y());
    str += "_clp_dbid = _clpDBCreateVia(\"" + viaType + "\" _clpAdjustPt(" + coordinates + " _clp_cinfo)\n";
    str += "\t\"" + netName + "\" nil _clp_cinfo->f_rotation _clp_sym)\n";
    str += "\n";
    str += "_clp_dbid = car(_clp_dbid)\n";
    str += "when(_clp_dbid _clpDBAddProp(_clp_dbid list(\n";
    str += "\tlist(\"CLIP_DRAWING\" _clp_clip_prop_value))))\n\n";

    return str;
}
std::string segmentLayerToString(const Segment &seg, const std::unordered_map<int, std::string> &layer2name)
{
    std::string str = "";
    if (seg.start().z() != seg.end().z())
    {
        throw std::runtime_error("Segment start and end layer must be the same");
    }

    str += layer2name.at(seg.start().z());
    return str;
}
std::string CLPWriter::formatWireWidth(double wire_width) const
{
    std::ostringstream oss;
    oss << std::fixed << std::setprecision(7) << wire_width;
    return oss.str();
}
std::string CLPWriter::addSegment(const Segment &seg, const double &wire_width)
{
    std::string layer_name = segmentLayerToString(seg, m_data_manager.layers());
    const std::string &start_str = coordinate2string(seg.start().x(), seg.start().y());
    const std::string &end_str = coordinate2string(seg.end().x(), seg.end().y());
    const std::string &wire_width_str = formatWireWidth(wire_width);

    std::string str = "";
    str += "_clp_path  = (_clpPathStart (list (_clpAdjustPt " + start_str + " _clp_cinfo))\n";
    str += "\t(_clpMKSConvert " + wire_width_str + " _clp_cinfo->t_from_units _clp_cinfo->t_to_units))\n";
    str += "_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert " + wire_width_str + " _clp_cinfo->t_from_units\n";
    str += "\t_clp_cinfo->t_to_units) (_clpAdjustPt " + end_str + " _clp_cinfo))\n";
    str += "_clpPl = list(\n";
    str += "\tlist(\"CLIP_DRAWING\" _clp_clip_prop_value))\n";
    str += "_clp_dbid = _clpDBCreatePath(_clp_path \"" + layer_name + "\" nil _clp_sym _clpPl)\n";
    str += "_clpPl = nil\n\n";

    return str;
}
std::string CLPWriter::clpShow()
{
    std::string str = "";
    str += "axlFlushDisplay()\n\n";
    return str;
}
void CLPWriter::DDR2DDR()
{
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_clp_files.push_back(__func__);
    file << signature();

    for (auto comp_pair : m_data_manager.components())
    {
        auto comp = comp_pair.second;
        auto router = comp->router();
        for (auto &seg : router->segments())
        {
            file << addSegment(seg, m_data_manager.wire_width());
        }
        for (auto &via : router->vias())
        {
            file << addVia(via, m_data_manager.netlists().nets().at(via.net_id())->net_name());
        }
    }

    file << clpShow();
}

void CLPWriter::areaRouting()
{
    std::string file_name = m_root_path + __func__;
    std::ofstream file(file_name, std::ios::trunc);
    m_clp_files.push_back(__func__);
    file << signature();
    // Escape Routing
    for (auto comp_pair : m_data_manager.components())
    {
        auto comp = comp_pair.second;
        auto router = comp->router();
        for (auto &seg : router->segments())
        {
            file << addSegment(seg, m_data_manager.wire_width());
        }
        for (auto &via : router->vias())
        {
            file << addVia(via, m_data_manager.netlists().nets().at(via.net_id())->net_name());
        }
    }
    // Area Routing
    for (auto &seg : m_data_manager.area_router()->segments())
    {
        file << addSegment(seg, m_data_manager.wire_width());
    }
    for (auto &via : m_data_manager.area_router()->vias())
    {
        file << addVia(via, m_data_manager.netlists().nets().at(via.net_id())->net_name());
    }

    file << clpShow();
}

void CLPWriter::moveClps(std::string prefix)
{
    for (const auto &file : m_clp_files)
    {
        std::string source_path = m_root_path + file;
        std::string destination_path = m_output_path + prefix + "_" + file + ".clp";

        // 移動檔案並加上 prefix
        try
        {
            std::filesystem::rename(source_path, destination_path);
        }
        catch (const std::filesystem::filesystem_error &e)
        {
#ifdef VERBOSE
            std::cout << "Error moving file " << source_path << " to " << destination_path << ": " << e.what()
                      << std::endl;
#endif
        }
    }
}
