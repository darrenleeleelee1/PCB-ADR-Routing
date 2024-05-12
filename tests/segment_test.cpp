#include "component_data.hpp"
#include <gtest/gtest.h>
#include <limits> // For std::numeric_limits

class SegmentTest : public ::testing::Test
{
protected:
    void SetUp() override
    {
        // Setup code here, if needed.
    }

    void TearDown() override
    {
        // Teardown code here, if needed.
    }
};

// Test the slope of a horizontal segment
TEST_F(SegmentTest, SlopeHorizontal)
{
    Coordinate start(0, 0, 0);
    Coordinate end(10, 0, 0);
    Segment segment(start, end);

    EXPECT_DOUBLE_EQ(segment.slope(), 0.0);
}

// Test the slope of a vertical segment
TEST_F(SegmentTest, SlopeVertical)
{
    Coordinate start(0, 0, 0);
    Coordinate end(0, 10, 0);
    Segment segment(start, end);

    EXPECT_DOUBLE_EQ(segment.slope(), std::numeric_limits<double>::infinity());
}

// Test the slope of a segment with a positive slope
TEST_F(SegmentTest, SlopePositive)
{
    Coordinate start(0, 0, 0);
    Coordinate end(10, 10, 0);
    Segment segment(start, end);

    EXPECT_DOUBLE_EQ(segment.slope(), 1.0);
}

// Test the slope of a segment with a negative slope
TEST_F(SegmentTest, SlopeNegative)
{
    Coordinate start(0, 0, 0);
    Coordinate end(10, -10, 0);
    Segment segment(start, end);

    EXPECT_DOUBLE_EQ(segment.slope(), -1.0);
}

// Test the slope when precision issues could be involved
TEST_F(SegmentTest, SlopePrecision)
{
    Coordinate start(0, 0, 0);
    Coordinate end(5e-1, 5e-1, 0);
    Segment segment(start, end);

    EXPECT_NEAR(segment.slope(), 1.0, 0);
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
