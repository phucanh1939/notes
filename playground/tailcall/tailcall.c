// int factorial_helper(int n, int acc) {
//     if (n == 0) return acc;
//     return factorial_helper(n - 1, n * acc);  // Tail call
// }

// int factorial_with_tail_call(int n) {
//     return factorial_helper(n, 1);
// }

// int factorial_no_tail_call(int n) {
//     if (n == 0) return 1;
//     return n * factorial_no_tail_call(n - 1);  // Not a tail call
// }

int fibonacci_no_tail_call(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci_no_tail_call(n - 1) + fibonacci_no_tail_call(n - 2);
}

int fibonacci_tail_call_helper(int n, int a, int b) {
    if (n == 0) return a;
    if (n == 1) return b;
    return fibonacci_tail_call_helper(n - 1, b, a + b);
}

int fibonacci_tail_call(int n) {
    return fibonacci_tail_call_helper(n, 0, 1);
}

int main() {
    int n = 10;
    int x = fibonacci_no_tail_call(n);
    int y = fibonacci_tail_call(n);
    return 1;
}