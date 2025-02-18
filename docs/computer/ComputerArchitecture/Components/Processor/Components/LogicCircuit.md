# Logic Circuit

## What is a Logic Circuit?
A Logic Circuit is a circuit that combines **[logic gates]** to process binary inputs and produce outputs. It can be:

- **Combinational Logic Circuit**: Outputs depend only on current inputs, implementing a logic function (e.g., ALU, multiplexer).

- **Sequential Logic Circuit**: Outputs depend on both current inputs and past states, using memory elements (e.g., flip-flops, registers).

Logic circuits are essential for digital systems, forming the core of processors, memory, and control units. 

## How Does a Logic Circuit Work?

**A Logic Circuit** takes binary inputs (as currents).
Then, through a combination of **[logic gates]** it produces outputs, changes its state (sequential logic).

## How to Build a Logic Circuit?

### Combinational Logic Circuit

**Combinational Logic Circuit** is created by combining/connecting **[logic gates]** follows a logic function (or a truth table)

#### Example: Building 2-to-4 decoder

A 2-to-4 decoder takes **2 inputs (A0, A1)** and produces **4 outputs (D0, D1, D2, D3)**.

##### Truth Table:

| A0 | A1 | D0 | D1 | D2 | D3 |
|----|----|----|----|----|----|
| 0  | 0  |  1 |  0 |  0 |  0 |
| 0  | 1  |  0 |  1 |  0 |  0 |
| 1  | 0  |  0 |  0 |  1 |  0 |
| 1  | 1  |  0 |  0 |  0 |  1 |

##### Logic Equations:
```
Y0 = NOT(A) AND NOT(B)
Y1 = NOT(A) AND B
Y2 = A AND NOT(B)
Y3 = A AND B
```

##### Form the circuit

![2-to-4 Decoder](./Assets/Images/2-to-4_Decoder.png)

### Sequential Logic Circuit

// TODO


[logic gates]: ./LogicGate