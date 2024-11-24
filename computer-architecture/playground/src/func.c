int add_one(int num) {
    int xxx = 1;
    int yyy = num + xxx;
    return yyy -20;
}

int add(int a, int b) {
    int sum = a + b;
    int result = add_one(sum);
    int z = result - 20;
    return z;
}


int recursive(int x) {
    if (x == 0) return 1;
    int a = recursive(x - 1);
    return a + 1;
}

int c_rerecursive(int x) {
    int y = 100 + x;
    int n = recursive(y);
    return n + 1200;
}

int main() {
    int x = 100;
    int y = 200;
    int z = add (x, y);
    z = z - 400;
    return 0;
}