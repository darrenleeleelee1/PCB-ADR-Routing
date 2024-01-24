#include "io.hpp"
#include <gtest/gtest.h>
#include <iostream>
#include <regex>

TEST(IOTest, RegexMatchTest_pin_nets)
{
    std::string pin_nets_input = "2-pin nets: 5";
    std::regex pin_nets_pattern(R"((\d+)-pin nets: (\d+))");
    std::smatch match;
    if (std::regex_match(pin_nets_input, match, pin_nets_pattern))
    {
        // Access the captured groups by their numeric index
        int number = std::stoi(match[1].str()); // Convert the matched string to an integer
        int count = std::stoi(match[2].str()); // Convert the matched string to an integer
        EXPECT_EQ(number, 2);
        EXPECT_EQ(count, 5);
    }
    else
    {
        FAIL() << "Regular expression did not match.";
    }
}

TEST(IOTest, RegexMatchTest_net)
{
    std::string net_input = "NetName: DDR_ADDR[16]";
    std::regex net_pattern(R"(NetName: ([^\n]+))");
    std::smatch match;
    if (std::regex_match(net_input, match, net_pattern))
    {
        // Access the captured groups by their numeric index
        EXPECT_EQ(match[1], "DDR_ADDR[16]");
    }
    else
    {
        FAIL() << "Regular expression did not match.";
    }
}

TEST(IOTest, RegexMatchTest_pin)
{
    std::string pin_input = "    U45.AC31 4815.42,3682";
    std::regex pin_pattern(R"(    (\w+)\.(\w+)\s+(\d+(\.\d+)?)\s*,\s*(\d+(\.\d+)?))");
    std::smatch match;
    if (std::regex_match(pin_input, match, pin_pattern))
    {
        // Access the captured groups by their numeric index
        EXPECT_EQ(match[1], "U45");
        EXPECT_EQ(match[2], "AC31");
        EXPECT_EQ(match[3], "4815.42");
        EXPECT_EQ(match[5], "3682");
    }
    else
    {
        FAIL() << "Regular expression did not match.";
    }
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
