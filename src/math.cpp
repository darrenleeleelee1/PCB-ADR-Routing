#include "math.hpp"
Coordinate math::rotateCoordinate(const Coordinate &point, const double &angleDegrees)
{
    double angleRadians = angleDegrees * M_PI / 180.0; // Convert angle to radians
    double cosTheta = std::cos(angleRadians);
    double sinTheta = std::sin(angleRadians);

    return Coordinate{
        point.x() * cosTheta - point.y() * sinTheta, point.x() * sinTheta + point.y() * cosTheta, point.z()};
}

A_Star::Point math::rotatePoint(const A_Star::Point &point, const double &angle)
{
    double angleRadians = angle * M_PI / 180.0; // Convert angle to radians
    double cosTheta = std::cos(angleRadians);
    double sinTheta = std::sin(angleRadians);

    return A_Star::Point{static_cast<int>(point.x * cosTheta - point.y * sinTheta),
                         static_cast<int>(point.x * sinTheta + point.y * cosTheta)};
}