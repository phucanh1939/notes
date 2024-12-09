void make_some_game(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a0)
{
    // a3 = a1 + a2; // 0
    // int b1 = a1 + a2; // 24
    // int b2 = a3 + a4; // 24
    // int b3 = a5 + a6; // 24
    // int b4 = a7 + a8; // 24
    // int b5 = a9 + a0; // 40 = 24 + 16
    // int b6 = 0; // 40
    // int b7 = 0; // 40
    // int b8 = 0; // 40
    // int b9 = 0; // 56 = 40 + 16
    // int b10 = 0; // 56
    // int b11 = 0; // 56
    // int b12 = 0; // 56
    // int b13 = 0; // 56 + 16 = 72

    // Stack on x64 intel allocated by 16-bytes blocks
    // Minimun allocation is 24 bytes
    // Why 5 ints need 40 bytes ()
}

int main()
{
    int x1 = 1;
    int x2 = 2;
    int x3 = 3;
    int x4 = 4;
    int x5 = 5;
    int x6 = 6;
    int x7 = 7;
    int x8 = 8;
    int x9 = 9;
    int x0 = 10;
    make_some_game(x1, x2, x3, x4, x5, x6, x7, x8, x9, x0);
    return 1;
}
