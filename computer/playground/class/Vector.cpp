#include "Vector.h"

// Constructor
Vector::Vector(float x, float y) : x(x), y(y) {}

// Getters
float Vector::getX() const {
    return x;
}

float Vector::getY() const {
    return y;
}

// Setters
void Vector::setX(float newX) {
    x = newX;
}

void Vector::setY(float newY) {
    y = newY;
}

void Vector::add(const Vector& vec) {
    x += vec.x;
    y += vec.y;
}

// Calculate distance to another Vector

