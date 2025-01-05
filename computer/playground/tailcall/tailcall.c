int factorial_helper(int n, int acc) {
    if (n == 0) return acc;
    return factorial_helper(n - 1, n * acc);  // Tail call
}

int factorial_with_tail_call(int n) {
    return factorial_helper(n, 1);
}

int factorial_no_tail_call(int n) {
    if (n == 0) return 1;
    return n * factorial_no_tail_call(n - 1);  // Not a tail call
}

int main() {
    int n = 10;
    int x = factorial_no_tail_call(n);
    int y = factorial_with_tail_call(n);
    return 1;
}