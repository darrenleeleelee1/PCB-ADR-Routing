#include "math.hpp"
Coordinate math::rotatePoints(const Coordinate &point, const double &angleDegrees)
{
    double angleRadians = angleDegrees * M_PI / 180.0; // Convert angle to radians
    double cosTheta = std::cos(angleRadians);
    double sinTheta = std::sin(angleRadians);

    return Coordinate{
        point.x() * cosTheta - point.y() * sinTheta, point.x() * sinTheta + point.y() * cosTheta, point.z()};
}