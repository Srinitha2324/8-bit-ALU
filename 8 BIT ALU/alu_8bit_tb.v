```verilog
`timescale 1ns/1ps

module alu_8bit_tb;

    reg  [7:0] A;
    reg  [7:0] B;
    reg  [2:0] opcode;

    wire [7:0] result;
    wire       carry;

    // Instantiate ALU
    alu_8bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry(carry)
    );

    initial begin

        // Generate waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, alu_8bit_tb);

        $monitor(
            "Time=%0t | A=%h | B=%h | Opcode=%b | Result=%h | Carry=%b",
            $time, A, B, opcode, result, carry
        );

        // ---------------------------------------
        // Test 1: Addition
        // ---------------------------------------
        A = 8'h25;
        B = 8'h17;
        opcode = 3'b000;
        #10;

        // ---------------------------------------
        // Test 2: Subtraction
        // ---------------------------------------
        A = 8'h35;
        B = 8'h12;
        opcode = 3'b001;
        #10;

        // ---------------------------------------
        // Test 3: AND
        // ---------------------------------------
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b010;
        #10;

        // ---------------------------------------
        // Test 4: OR
        // ---------------------------------------
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b011;
        #10;

        // ---------------------------------------
        // Test 5: XOR
        // ---------------------------------------
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b100;
        #10;

        // ---------------------------------------
        // Test 6: NOT A
        // ---------------------------------------
        A = 8'h55;
        B = 8'h00;
        opcode = 3'b101;
        #10;

        // ---------------------------------------
        // Test 7: Increment
        // ---------------------------------------
        A = 8'h0F;
        B = 8'h00;
        opcode = 3'b110;
        #10;

        // ---------------------------------------
        // Test 8: Decrement
        // ---------------------------------------
        A = 8'h10;
        B = 8'h00;
        opcode = 3'b111;
        #10;

        // ---------------------------------------
        // Carry test
        // ---------------------------------------
        A = 8'hFF;
        B = 8'h01;
        opcode = 3'b000;
        #10;

        $display("----------------------------------------");
        $display("8-bit ALU simulation completed.");
        $display("----------------------------------------");

        $finish;

    end

endmodule
```
