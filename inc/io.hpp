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

class ParserManager
{
private:
    std::unique_ptr<DataManager> m_data_manager;

public:
    explicit ParserManager(std::unique_ptr<DataManager> data_manager)
        : m_data_manager(std::move(data_manager))
    {
    }
    const DataManager &data_manager() const { return *m_data_manager; }
    DataManager &data_manager() { return *m_data_manager; }

    void run(IParser &parser) { parser.parse(*m_data_manager); }
};

#endif // IO_HPP
