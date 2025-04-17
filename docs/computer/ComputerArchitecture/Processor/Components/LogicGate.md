# **Logic Gate**

## **What is a Logic Gate?**

**A logic gate** is a fundamental building block of digital circuits that processes binary inputs (0 and 1) to produce a specific output based on logical operations.

Logic gates can be used to forms complex circuits for a computer: ALU, register, RAM, Flip-Flop, Multiplexer, Decoder, etc.

## **How a Logic Gate Works**

Electrical current flows through the input terminals of the gate, passing through internally connected transistors. These transistors manipulate the signals based on the gate’s logic function, producing the corresponding output.

Example:
- **AND Gate**: Uses two transistors in series—both must be ON for output to be HIGH (1).
- **OR Gate**: Uses two transistors in parallel—either one can be ON for output to be HIGH (1).
- **NOT Gate (Inverter)**: Uses a single transistor to invert the input (0 → 1, 1 → 0).

## **How to Create a Logic Gate (from Transistors)**

In actual hardware (CPUs, RAM, etc.), circuits mostly use **universal gates**: **NAND** or **NOR**

**Universal Gates** are gates that can create any logic function.

**Universal Gates** are built directly using transistors (wire thems together).

Other gates (AND, OR, NOT, XOR) are built using **universal gates**

```
// Using NAND
A' = A NAND A
A AND B = (A NAND B) NAND (A NAND B)
A OR B = (A' NAND B')' = (A NAND A) NAND (B NAND B)

// Using NOR
A' = A NOR A
A OR B = (A NOR B) NOR (A NOR B)
A AND B = (A' NOR B')' = (A NOR A) NOR (B NOR B)
```

