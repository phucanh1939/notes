
# Number

To represent numbers in different bases (including binary), the concept of `positional numeral systems` is used

Example: The binary number `1011` is: `1x2^3 + 0x2^2 + 1x2^1 + 1x2^0 = 11 (in base 10 - Decimal)`

## Integer

`Unsigned` integers are represented in binary form using **positional notation**, where each bit (binary digit) represents a power of 2. For example: 101 = 1x2^2 + 0x2^1 + 1x2^0 = 5 (decimal)

`Negative` integers are commonly represented using **two's complement** encoding:
1. Flip all the bits of the number (1's complement).
2. Add 1 to the result.

Example: 1011 = -1x2^3 + 0x2^2 + 1*2^1 + 1*2^0

Where does this step to calculate `-X` come from:
```c
we have: X + flip_all_bit(X) = -1 // all bits are 1
=>      -X = flip_all_bit(X) + 1
```

This **two's complement** representation simplifies arithmetic operations and ensures there is only one representation for zero.

For example, in an 8-bit system:
- +5  → `0000 0101`
- Flip bits → `1111 1010`
- Add 1 → `1111 1011` (-5)
`1111 1011` = -1x2^7 + 1x2^6 + 1x2^5 + 1x2^4 + 1x2^3 + 0x2^2 + 1x2^1 + 1x2^0 = -5

## Floating Point

Floating-point numbers (e.g., 3.14) are represented using the **IEEE 754 standard**, which divides the binary representation into three parts:
1. **Sign bit**: 1 for negative, 0 for positive.
2. **Exponent**: Encodes the range or scale (stored with a bias).
3. **Mantissa** (or significand): Encodes the precision.

| **Field**          | **Single Precision (32-bit)** | **Double Precision (64-bit)** |
|--------------------|-------------------------------|-------------------------------|
| **Sign Bit**       | 1 bit                         | 1 bit                         |
| **Exponent**       | 8 bits                        | 11 bits                       |
| **Mantissa**       | 23 bits                       | 52 bits                       |
| **Bias**           | 127                           | 1023                          |
| **Total Size**     | 32 bits                       | 64 bits                       |

### Example: Representing ` -6.75 ` in IEEE 754 (32-bit Single Precision)

**Step 1**: Convert ` -6.75 ` to binary:  
- The integer part `6` is `110` in binary.  
- The fractional part `0.75` is `0.11` in binary.  
Thus, `6.75` is `110.11` in binary.

**Step 2**: Normalize the binary number:  
- Move the decimal point to the right of the first 1: `1.1011 \times 2^2`.  
  - **Mantissa**: `1011` (excluding the leading 1, which is implicit).  
  - **Exponent**: `2`.  

**Step 3**: Bias the exponent:  
- IEEE 754 single precision uses a bias of `127`.  
- `2 + 127 = 129`, which is `10000001` in binary.  

**Step 4**: Assemble the parts:  
- **Sign bit**: `1` (negative).  
- **Exponent**: `10000001`.  
- **Mantissa**: `10110000000000000000000` (23 bits).  

**Final IEEE 754 Representation**:  `1 10000001 10110000000000000000000` (32 bits)

### Example: Representing `10.3562` in IEEE 754 (32-bit Single Precision)

1. Step 1: Convert the integer part (10) to binary

10 (decimal) = 1010 (binary)

2. Step 2: Convert the fractional part (0.3562) to binary
For the fractional part, multiply by 2 and record the integer part at each step. Repeat the process until the fractional part becomes 0 or you reach the desired precision.

0.3562 × 2 = 0.7124 → integer part = 0
0.7124 × 2 = 1.4248 → integer part = 1
0.4248 × 2 = 0.8496 → integer part = 0
0.8496 × 2 = 1.6992 → integer part = 1
0.6992 × 2 = 1.3984 → integer part = 1
0.3984 × 2 = 0.7968 → integer part = 0
.... 

0.3562 (decimal) ≈ .01011001100110011001101 (binary)

3. Step 3: Combine the integer and fractional parts

10.3562 (decimal) ≈ 1010.01011001100110011001101 (binary)

4. Step 4: Normalize the Binary Number

1010.010110 = 1.01001011001100110011001101 × 2^3 (2 ^ exponent)

5. Step 5: Encode the Sign Bit, Exponent, and Fraction (Mantissa)
- 1 bit for the sign: 0
- 8 bits for the exponent: 3 + 127 = 130 = 10000010 (The exponent is stored with a bias of 127 in single-precision)
- 23 bits for the mantissa (fraction): 01001011001100110011001 (first 23th bit the fraction part in step 4)

The final result is `0 10000010 01001011001100110011001` for `10.3562`

To convert back to decimal value:
- Extract the sign, exponent, and mantissa.
  - sign = 0
  - exponent = 10000010 = 130
  - mantissa: `01001011001100110011001` = 0/2^1 + 1/2^2 + 0/2^3 +... ≈ 0.28125
- Compute the decimal value using the formula: `(-1)^sign * (1 + mantissa) * 2^(exponent - 127)`
  value = -1 ^ 0 * (1 + 0.28125) * 2 ^ (130-127) = 10.25