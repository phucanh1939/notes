# Boolean logic

Every digital device is built on a set of chips designed to store and process information, these chips are made from same building blocks: **Logic gates**.

To understanding how the logic gates are built, we need to learn about boolean logic, boolen algebra !!!!!

## Boolean Algebra

Boolean Algebra deals with Boolean values (1/0, true/false, on/off)

Symbols used in this documentation:

| symbol | operation |
| ------ | --------- |
| !      | not       |
| *      | and       |
| +      | or        |

**Boolean function** is a funtion takes boolean values as input and return binary outputs

## How to represent a boolean function

`f(x, y, z) = (x + y) * !z`

**Truth Table Representation** The simplest way to represent a Boolean function using a table contains all available input values and output values

| x   | y   | z   | f(x, y, z) |
| --- | --- | --- | ---------- |
| 0   | 0   | 0   | 0          |
| 0   | 0   | 1   | 0          |
| 0   | 1   | 0   | 1          |
| 0   | 1   | 1   | 0          |
| 1   | 0   | 0   | 1          |
| 1   | 0   | 1   | 0          |
| 1   | 1   | 0   | 1          |
| 1   | 1   | 1   | 0          |

**Canonical Representation** Another way to represent a Boolean function using logical operator

Form a cannonical representation using rows with output = 1 in Truth Table:

`f(x, y, z) = !x*y*!z + x*!y*!z + x*y*!z`

## How many boolean functions can n input varibales be used to create?

Boolean functions with n input varibales could gerate 2^n result values (2^n rows in truth table).

Each row can be 1 or 0 => There are 2^(2^n) possible tables

Each table is 1 boolean functions.

So, n input varibales can be used to defines 2^(2^n) boolean functions

Example for 2 input varible, we have 16 boolean functions available.

| x   | y   |          f1 |    f2 |     f3 |   f4 |     f5 |   f6 |                  f7 |    f8 |       f9 |                 f10 |   f11 |         f12 |   f13 |         f14 |      f15 |         f16 |
| --- | --- | ----------: | ----: | -----: | ---: | -----: | ---: | ------------------: | ----: | -------: | ------------------: | ----: | ----------: | ----: | ----------: | -------: | ----------: |
| 0   | 0   |           0 |     0 |      0 |    0 |      0 |    0 |                   0 |     0 |        1 |                   1 |     1 |           1 |     1 |           1 |        1 |           1 |
| 0   | 1   |           0 |     0 |      0 |    0 |      1 |    1 |                   1 |     1 |        0 |                   0 |     0 |           0 |     1 |           1 |        1 |           1 |
| 1   | 0   |           0 |     0 |      1 |    1 |      0 |    0 |                   1 |     1 |        0 |                   0 |     1 |           1 |     0 |           0 |        1 |           1 |
| 1   | 1   |           0 |     1 |      0 |    1 |      0 |    1 |                   0 |     1 |        0 |                   1 |     0 |           1 |     0 |           1 |        0 |           1 |
|     |     |  Constant 0 |   And |        |    x |        |    y |                 Xor |    Or |      Nor |         Equivalence | Not y | If y then x | Not x | If x then y |     Nand |  Constant 1 |
|     |     | f(x, y) = 0 | x * y | x * !y |    x | !x * y |    y | (x * !y) + (!x * y) | x + y | !(x + y) | (x * y) + (!x * !y) |    !y |      x + !y |    !x |      !x + y | !(x * y) | f(x, y) = 1 |

## Universal boolean functions

Every boolean functions can be represented by using only **NAND** or **NOR** (Discovered by Henry M. Sheffer 1919 and Edward V.Hungtington 1942)

-> Once we have a physical device that implement NAND (NAND gate), we can use many copies of this device (wired in a certain way) to implement in hardware any boolean function

```
NOT(x) = NAND(x, x)
```

```
AND(x, y) = NOT(NAND(x, y))
```

```
OR(x, y) = NAND(NOT(x), NOT(y))
```

## Gate Logic

