#ifndef VECTOR_H
#define VECTOR_H

#include <cmath>

class Vector {
private:
    float x;
    float y;

public:
    // Constructor
    Vector(float x = 0.0, float y = 0.0);

    // Getters
    float getX() const;
    float getY() const;

    // Setters
    void setX(float newX);
    void setY(float newY);

    // Method to calculate distance from another point
    void add(const Vector& vector);
};

#endif // VECTOR_H
