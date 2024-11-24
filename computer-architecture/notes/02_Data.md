# Data

To represent data for a computer to process, it needs to be encoded in **binary form** (0s and 1s), which computers can interpret as electrical signals or states (on/off).

---

## **Numbers**

Since numbers can be represented in binary format, any other type of data can also be represented in binary if it can be converted into numbers (or directly encoded in binary).

### **Integers**
Integers are represented in binary form using **positional notation**, where each bit (binary digit) represents a power of 2. For example:
- Decimal **5** → Binary **101** = 1x2^2 + 0x2^1 + 1x2^0 = 5

#### **Negative Integers**
Negative integers are commonly represented using **two's complement** encoding:
1. Flip all the bits of the number (1's complement).
2. Add 1 to the result.

Where does this step to calculate \(-X\) come from:
```c
we have: X + flip_all_bit(X) = -1 // all bit are -1
=>      -X = flip_all_bit(X) + 1
```

This **two's complement** representation simplifies arithmetic operations and ensures there is only one representation for zero.

For example, in an 8-bit system:
- \( +5 \) → `0000 0101`
- Flip bits → `1111 1010`
- Add 1 → `1111 1011` (\( -5 \))

`1111 1011` = \(1 \times -2^7 + 1 \times 2^6 + 1 \times 2^5 + 1 \times 2^4 + 1 \times 2^3 + 0 \times 2^2 + 1 \times 2^1 + 1 \times 2^0 = -5\)

---

### **Floating-Point Numbers**
Floating-point numbers (e.g., \(3.14\)) are represented using the **IEEE 754 standard**, which divides the binary representation into three parts:
1. **Sign bit**: 1 for negative, 0 for positive.
2. **Exponent**: Encodes the range or scale (stored with a bias).
3. **Mantissa** (or significand): Encodes the precision.

---

## **String**

String = characters. Each character is represented with a code (integer) using standard encodings (ASCII, UTF8, UTF16, UTF32, etc.).

---

## **Instruction**

An **instruction** is also a form of data that tells the CPU what to do. It is represented in binary according to a format defined by the **Instruction Set Architecture (ISA)** of the CPU.
