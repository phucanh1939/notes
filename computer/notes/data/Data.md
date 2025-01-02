# Data

To use computer to process different type of data, we need to represent it in way computer can read and "understand" - binary format.

## Boolean

Boolean is binary itself so nothing to do

## Number

To represent numbers in different bases (including binary), the concept of `positional numeral systems` is used

Example: The binary number `1011` is: `1x2^3 + 0x2^2 + 1x2^1 + 1x2^0 = 11 (in base 10 - Decimal)`

### Integer

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

### Floating Point

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

#### Example: Representing ` -6.75 ` in IEEE 754 (32-bit Single Precision)

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

## String

String is an array of characters.
Each character is represented with a code (integer) using standard encodings (ASCII, UTF8, UTF16, UTF32, etc.).
=> String = array_of_character_code (array of integers)
