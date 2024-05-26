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
    // Helper function to compare coordinates with an epsilon for floating-point comparisons
    void expectCoordinateNear(const Coordinate &actual, const Coordinate &expected, double epsilon = 1e-6)
    {
        EXPECT_NEAR(actual.x(), expected.x(), epsilon);
        EXPECT_NEAR(actual.y(), expected.y(), epsilon);
        EXPECT_EQ(actual.z(), expected.z());
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

// Test case for createExtendedSegmentByDegreeAndLength with various angles
TEST_F(SegmentTest, CreateExtendedSegmentByDegreeAndLengthVariousAngles)
{
    Coordinate start(0, 0, 0);
    Coordinate end(1, 1, 0);
    Segment segment(start, end);

    struct TestCase
    {
        double angle;
        double length;
        Coordinate expected_end;
    };
    std::vector<TestCase> test_cases = {{0.0, 1.0, Coordinate(1 + sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
                                        {45.0, 1.0, Coordinate(1, 2, 0)},
                                        {90.0, 1.0, Coordinate(1 - sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
                                        {135.0, 1.0, Coordinate(0, 1, 0)},
                                        {180.0, 1.0, Coordinate(1 - sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
                                        {225.0, 1.0, Coordinate(1, 0, 0)},
                                        {270.0, 1.0, Coordinate(1 + sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
                                        {315.0, 1.0, Coordinate(2, 1, 0)}};

    for (const auto &test_case : test_cases)
    {
        Segment extended_segment = segment.createExtendedSegmentByDegreeAndLength(test_case.angle, test_case.length);
        expectCoordinateNear(extended_segment.end(), test_case.expected_end);
        // test - 360
        Segment extended_segment2 =
            segment.createExtendedSegmentByDegreeAndLength(test_case.angle - 360, test_case.length);
        expectCoordinateNear(extended_segment2.end(), test_case.expected_end);
    }
}
// Test case for createExtendedSegmentByDegree with various angles and initial segments
TEST_F(SegmentTest, CreateExtendedSegmentByDegreeVariousAnglesAndInitialSegments)
{
    struct TestCase
    {
        Coordinate start;
        Coordinate end;
        double angle;
        double target_x;
        double target_y;
        Coordinate expected_end;
    };

    std::vector<TestCase> test_cases_both = {
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         0.0,
         1 + sqrt(2) / 2,
         std::numeric_limits<double>::quiet_NaN(),
         Coordinate(1 + sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         0.0,
         std::numeric_limits<double>::quiet_NaN(),
         1 + sqrt(2) / 2,
         Coordinate(1 + sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         90.0,
         1 - sqrt(2) / 2,
         std::numeric_limits<double>::quiet_NaN(),
         Coordinate(1 - sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         90.0,
         std::numeric_limits<double>::quiet_NaN(),
         1 + sqrt(2) / 2,
         Coordinate(1 - sqrt(2) / 2, 1 + sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         180.0,
         1 - sqrt(2) / 2,
         std::numeric_limits<double>::quiet_NaN(),
         Coordinate(1 - sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         180.0,
         std::numeric_limits<double>::quiet_NaN(),
         1 - sqrt(2) / 2,
         Coordinate(1 - sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         270.0,
         1 + sqrt(2) / 2,
         std::numeric_limits<double>::quiet_NaN(),
         Coordinate(1 + sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
        {Coordinate(0, 0, 0),
         Coordinate(1, 1, 0),
         270.0,
         std::numeric_limits<double>::quiet_NaN(),
         1 - sqrt(2) / 2,
         Coordinate(1 + sqrt(2) / 2, 1 - sqrt(2) / 2, 0)},
    };

    // target_x, target_y 同時都可以的情況（同時都可以的代表新的線不是垂直或水平線，不然水平或垂直的x,
    // y會一直一樣找不到想要找的點）
    for (const auto &test_case : test_cases_both)
    {
        Segment segment(test_case.start, test_case.end);
        Segment extended_segment =
            segment.createExtendedSegmentByDegree(test_case.angle, test_case.target_x, test_case.target_y);
        expectCoordinateNear(extended_segment.end(), test_case.expected_end);
    }

    std::vector<TestCase> test_cases_single = {{Coordinate(0, 0, 0),
                                                Coordinate(1, 1, 0),
                                                45.0,
                                                std::numeric_limits<double>::quiet_NaN(),
                                                2.0,
                                                Coordinate(1.0, 2.0, 0)},
                                               {Coordinate(0, 0, 0),
                                                Coordinate(1, 1, 0),
                                                135.0,
                                                0,
                                                std::numeric_limits<double>::quiet_NaN(),
                                                Coordinate(0.0, 1.0, 0)},
                                               {Coordinate(0, 0, 0),
                                                Coordinate(1, 1, 0),
                                                225.0,
                                                std::numeric_limits<double>::quiet_NaN(),
                                                0,
                                                Coordinate(1.0, 0.0, 0)}};
    for (const auto &test_case : test_cases_single)
    {
        Segment segment(test_case.start, test_case.end);
        Segment extended_segment =
            segment.createExtendedSegmentByDegree(test_case.angle, test_case.target_x, test_case.target_y);
        expectCoordinateNear(extended_segment.end(), test_case.expected_end);
    }
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
