#include "math.h"

int sum_to_n(int n) {
    return (n <= 0) ? 0 : (n * (n + 1)) >> 1;
}

float circle_area(float r) {
    return r * r * PI;
}

float circle_circumference(float r) {
    return 2.0f * r * PI;
}
