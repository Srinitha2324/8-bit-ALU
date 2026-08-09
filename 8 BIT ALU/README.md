# 8-Bit ALU using Verilog

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)
![Simulation](https://img.shields.io/badge/Simulation-Icarus%20Verilog-green)
![Waveform](https://img.shields.io/badge/Waveform-GTKWave-orange)

## 📌 Project Overview

This project implements an **8-bit Arithmetic Logic Unit (ALU)** using Verilog HDL.

An ALU is an important digital circuit used in processors and digital systems. It performs arithmetic and logical operations on binary data.

The ALU designed in this project accepts two 8-bit inputs, `A` and `B`, and uses a 3-bit opcode to select the required operation.

The design supports **8 different operations**:

* Addition
* Subtraction
* AND
* OR
* XOR
* NOT
* Increment
* Decrement

---

## 🎯 Objectives

* Understand the working principle of an ALU.
* Design an 8-bit ALU using Verilog HDL.
* Implement arithmetic operations.
* Implement logical operations.
* Implement increment and decrement operations.
* Generate a carry/borrow indication.
* Develop a Verilog testbench.
* Verify all ALU operations using simulation.
* Analyze the simulation waveform using GTKWave.

---

## 🔧 Design Specifications

| Parameter            | Description    |
| -------------------- | -------------- |
| Circuit              | 8-Bit ALU      |
| Input A              | 8 bits         |
| Input B              | 8 bits         |
| Opcode               | 3 bits         |
| Output               | 8 bits         |
| Carry                | 1 bit          |
| Number of Operations | 8              |
| HDL                  | Verilog        |
| Simulator            | Icarus Verilog |
| Waveform Viewer      | GTKWave        |

---

## 📐 Block Diagram

```text
                 ┌─────────────────────┐
                 │                     │
     A[7:0] ────►│                     │
                 │                     │
     B[7:0] ────►│       8-BIT ALU     │────► Result[7:0]
                 │                     │
 Opcode[2:0] ──►│                     │────► Carry
                 │                     │
                 └─────────────────────┘
```

The opcode determines which operation the ALU performs.

---

## ⚙️ ALU Operations

| Opcode | Operation | Description |
| :----: | --------- | ----------- |
|  `000` | ADD       | `A + B`     |
|  `001` | SUB       | `A - B`     |
|  `010` | AND       | `A & B`     |
|  `011` | OR        | `A \| B`    |
|  `100` | XOR       | `A ^ B`     |
|  `101` | NOT       | `~A`        |
|  `110` | INC       | `A + 1`     |
|  `111` | DEC       | `A - 1`     |

---

## 🧮 Example Calculations

### Addition

```text
A = 25
B = 17

25 + 17 = 3C
```

Therefore:

```text
Result = 3C
```

---

### Subtraction

```text
A = 35
B = 12

35 - 12 = 23
```

Therefore:

```text
Result = 23
```

---

### AND

```text
A = AA
B = 0F

AA AND 0F = 0A
```

---

### OR

```text
A = AA
B = 0F

AA OR 0F = AF
```

---

### XOR

```text
A = AA
B = 0F

AA XOR 0F = A5
```

---

### NOT

```text
A = 55

NOT 55 = AA
```

---

### Increment

```text
A = 0F

0F + 1 = 10
```

---

### Decrement

```text
A = 10

10 - 1 = 0F
```

---

## 💻 Verilog Implementation

The ALU uses a combinational `case` statement to select the required operation.

```verilog
always @(*) begin

    result = 8'b00000000;
    carry = 1'b0;

    case (opcode)

        3'b000:
            {carry, result} = A + B;

        3'b001:
            result = A - B;

        3'b010:
            result = A & B;

        3'b011:
            result = A | B;

        3'b100:
            result = A ^ B;

        3'b101:
            result = ~A;

        3'b110:
            {carry, result} = A + 1;

        3'b111:
            result = A - 1;

    endcase

end
```

---

## 🧪 Testbench

The testbench verifies all eight operations.

The following tests are performed:

1. Addition
2. Subtraction
3. AND
4. OR
5. XOR
6. NOT
7. Increment
8. Decrement
9. Addition overflow/carry test

A VCD file is also generated for waveform analysis.

---

## ▶️ Simulation

### Step 1: Compile

From the project root directory:

```bash
iverilog -o alu_sim src/alu_8bit.v testbench/alu_8bit_tb.v
```

### Step 2: Run

```bash
vvp alu_sim
```

The simulation generates:

```text
waveform.vcd
```

### Step 3: Open waveform

```bash
gtkwave waveform.vcd
```

Add the following signals:

```text
A
B
opcode
result
carry
```

---

## 📈 Expected Simulation Results

The expected results include:

| A    | B    | Opcode | Operation | Result |
| ---- | ---- | :----: | --------- | ------ |
| `25` | `17` |  `000` | ADD       | `3C`   |
| `35` | `12` |  `001` | SUB       | `23`   |
| `AA` | `0F` |  `010` | AND       | `0A`   |
| `AA` | `0F` |  `011` | OR        | `AF`   |
| `AA` | `0F` |  `100` | XOR       | `A5`   |
| `55` | `00` |  `101` | NOT       | `AA`   |
| `0F` | `00` |  `110` | INC       | `10`   |
| `10` | `00` |  `111` | DEC       | `0F`   |
| `FF` | `01` |  `000` | ADD       | `00`   |

For the final test:

```text
FF + 01 = 100
```

Since the result is 8 bits:

```text
Result = 00
Carry  = 1
```

This demonstrates the carry output.

---

## 📸 Simulation Waveform

After running the simulation in GTKWave, take a screenshot and save it as:

```text
simulation/alu_waveform.png
```

Add it to the README:

```markdown
![8-Bit ALU Simulation](simulation/alu_waveform.png)
```

The waveform should contain:

```text
A
B
opcode
result
carry
```

---

## 📁 Project Structure

```text
8-bit-ALU-verilog/
│
├── README.md
│
├── src/
│   └── alu_8bit.v
│
├── testbench/
│   └── alu_8bit_tb.v
│
└── simulation/
    ├── waveform.vcd
    └── alu_waveform.png
```

---

## 🛠️ Tools Used

* **Verilog HDL** – Hardware description
* **Icarus Verilog** – Simulation
* **GTKWave** – Waveform visualization
* **Git** – Version control
* **GitHub** – Project hosting

---

## 🌐 Applications of ALU

ALUs are fundamental components of:

* Microprocessors
* Microcontrollers
* CPUs
* Digital signal processors
* Embedded systems
* Calculators
* FPGA-based processors
* Digital control systems

---

## ✅ Advantages

* Performs multiple arithmetic and logical operations.
* Simple combinational design.
* Easily expandable with additional operations.
* Suitable for FPGA and ASIC implementations.
* Demonstrates fundamental processor datapath concepts.

---

## ⚠️ Limitations

This project is a basic educational ALU. It does not include:

* Multiplication
* Division
* Shift operations
* Comparison flags
* Zero flag
* Negative/sign flag
* Overflow flag

These features can be added in a future version.

---

## 🚀 Future Improvements

The ALU can be extended to support:

* Multiplication
* Division
* Left shift
* Right shift
* Rotate operations
* Zero flag
* Negative flag
* Overflow flag
* Greater-than/less-than comparison
* 16-bit or 32-bit operation

---

## 🏁 Conclusion

An **8-bit Arithmetic Logic Unit** was successfully designed using Verilog HDL.

The ALU accepts two 8-bit inputs and uses a 3-bit opcode to select one of eight arithmetic or logical operations.

The testbench verifies the functionality of each operation, including an addition carry condition. The simulation waveform provides visual confirmation that the ALU produces the expected output for different inputs and operation codes.

This project demonstrates important concepts in digital logic design and provides a foundation for understanding the datapath of a processor.

```
```
