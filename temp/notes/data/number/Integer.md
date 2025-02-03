# Integer

## How to represent integers in binary

### Unsigned integers

`Unsigned integers` are represented in binary form using `positional notation`, where each bit (binary digit) represents a power of 2.

Example: The binary number `1011` is: `1x2^3 + 0x2^2 + 1x2^1 + 1x2^0 = 11 (in base 10 - Decimal)`

### Signed integers

`Singed integers` are commonly represented using **two's complement** encoding:
1. Flip all the bits of the number (1's complement).
2. Add 1 to the result.

This **two's complement** representation simplifies arithmetic operations and ensures there is only one representation for zero.

Where does this step to calculate `-X` come from:
```c
we have: X + flip_all_bit(X) = -1 // all bits are 1
=>      -X = flip_all_bit(X) + 1
```

For example, in an 8-bit system:
- +5  → `0000 0101`
- Flip bits → `1111 1010`
- Add 1 → `1111 1011` (-5)
`1111 1011` = -1x2^7 + 1x2^6 + 1x2^5 + 1x2^4 + 1x2^3 + 0x2^2 + 1x2^1 + 1x2^0 = -5

---

## How to convert from binary to decimal

### For unsigned int:
Example: `1001 1101` = 2^7 + 2^4 + 2^3 + 2^2 + 2^0 = 157

### For signed int (two complement):
Example: `1001 1101` = -2^7 + 2^4 + 2^3 + 2^2 + 2^0 = -99

---

## How to convert from decimal to binary

### For unsigned int:
Use repeated division by 2.

#### Example: Convert **157** to Binary
1. 157 \div 2 = 78 remainder **1**
2. 78 \div 2 = 39 remainder **0**
3. 39 \div 2 = 19 remainder **1**
4. 19 \div 2 = 9 remainder **1**
5. 9 \div 2 = 4 remainder **1**
6. 4 \div 2 = 2 remainder **0**
7. 2 \div 2 = 1 remainder **0**
8. 1 \div 2 = 0 remainder **1**

**Read from bottom to top:**  
`157 = 1001 1101`

### For signed int:
1. **Convert the absolute value** of the number to binary (as an unsigned int).
2. **If the number is negative**, take the two’s complement:
   - Invert all bits.
   - Add 1 to the result.

Example: Convert **-99₁₀** to 8-bit Two’s Complement

#### Example: Convert **-99₁₀** to 8-bit Two’s Complement
1. Convert **99₁₀** to binary (unsigned):  
   - `99 = 0110 0011`
2. Take the two’s complement:
   - Invert bits: **1001 1100**
   - Add 1: **1001 1101**
Thus, **-99 = 1001 1101** in two’s complement (8-bit representation).
