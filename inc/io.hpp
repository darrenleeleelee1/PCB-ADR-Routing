#ifndef IO_HPP
#define IO_HPP

#include "component_data.hpp"
#include <filesystem>
#include <fstream>
#include <string>

class IParser
{
public:
    virtual ~IParser() {}
    virtual void parse(DataManager &data_manager) = 0; // 纯虚函数
};

class ADRParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit ADRParser(const std::string &filename);
    ~ADRParser() override;

    void parse(DataManager &data_manager) override;
};

class LayerParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit LayerParser(const std::string &filename);
    ~LayerParser() override;

    void parse(DataManager &data_manager) override;
};

class ObstaclesParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit ObstaclesParser(const std::string &filename);
    ~ObstaclesParser() override;

    void parse(DataManager &data_manager) override;
};

class ComponentParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit ComponentParser(const std::string &filename);
    ~ComponentParser() override;

    void parse(DataManager &data_manager) override;
};

class EdgeParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit EdgeParser(const std::string &filename);
    ~EdgeParser() override;

    void parse(DataManager &data_manager) override;
};

class SubDrawingParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit SubDrawingParser(const std::string &filename);
    ~SubDrawingParser() override;

    void parse(DataManager &data_manager) override;
};

class ParserManager
{
private:
    std::shared_ptr<DataManager> m_data_manager;
    std::vector<std::unique_ptr<IParser>> m_parsers;

public:
    explicit ParserManager(std::shared_ptr<DataManager> data_manager)
        : m_data_manager(data_manager)
    {
    }

    // Access for data_manager
    const DataManager &data_manager() const { return *m_data_manager; }
    DataManager &data_manager() { return *m_data_manager; }

    // Access for parsers
    const std::vector<std::unique_ptr<IParser>> &parsers() const { return m_parsers; }
    std::vector<std::unique_ptr<IParser>> &parsers() { return m_parsers; }

    // Add a parser
    void addParser(std::unique_ptr<IParser> parser) { m_parsers.push_back(std::move(parser)); }

    // Run all parsers
    void run(IParser &parser) { parser.parse(*m_data_manager); }
    bool run()
    {
        for (auto &parser : m_parsers) parser->parse(*m_data_manager);
        return true;
    }
};
class GlobalRoutingManager
{
private:
    const std::string m_output_directory = "outputs/gr";
    const std::string m_prefix;

public:
    GlobalRoutingManager(const std::string &_prefix)
        : m_prefix(_prefix)
    {
        std::filesystem::create_directories(m_output_directory);
    }
    ~GlobalRoutingManager() {}
    std::pair<int, int> findCell(const double &x,
                                 const double &y,
                                 const double &left_bottom_x = 3571.03,
                                 const double &left_bottom_y = 2271.24,
                                 const double &cell_width = 72.10,
                                 const double &cell_height = 72.10);
    void writeADREscapePoints(DataManager *data_manager,
                              const std::vector<std::pair<Coordinate, int>> &cpu_ep,
                              const std::vector<std::pair<Coordinate, int>> &ddr_ep);
};

extern GlobalRoutingManager *global_routing_manager;
#endif // IO_HPP
