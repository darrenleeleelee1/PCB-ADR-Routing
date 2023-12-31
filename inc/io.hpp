#ifndef IO_HPP
#define IO_HPP

#include "component_data.hpp"
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

class OrderParser : public IParser
{
private:
    std::ifstream file;

public:
    explicit OrderParser(const std::string &filename);
    ~OrderParser() override;

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

    void run(IParser &parser) { parser.parse(*m_data_manager); }
    void run()
    {
        for (auto &parser : m_parsers) parser->parse(*m_data_manager);
    }
};

#endif // IO_HPP
