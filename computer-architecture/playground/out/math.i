# 1 "./src/math.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 414 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "./src/math.c" 2
# 1 "./src/math.h" 1







int sum_to_n(int n);
float circle_area(float r);
float circle_circumference(float r);
# 2 "./src/math.c" 2

int sum_to_n(int n) {
    return (n <= 0) ? 0 : (n * (n + 1)) >> 1;
}

float circle_area(float r) {
    return r * r * 3.14f;
}

float circle_circumference(float r) {
    return 2.0f * r * 3.14f;
}
