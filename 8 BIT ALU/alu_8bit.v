```verilog
// 8-bit Arithmetic Logic Unit
//
// Operations:
// 0000 - Addition
// 0001 - Subtraction
// 0010 - AND
// 0011 - OR
// 0100 - XOR
// 0101 - NOT A
// 0110 - Increment A
// 0111 - Decrement A

module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] opcode,
    output reg  [7:0] result,
    output reg        carry
);

always @(*) begin

    // Default values
    result = 8'b00000000;
    carry  = 1'b0;

    case (opcode)

        // Addition
        3'b000: begin
            {carry, result} = A + B;
        end

        // Subtraction
        3'b001: begin
            result = A - B;

            if (A < B)
                carry = 1'b1;
            else
                carry = 1'b0;
        end

        // AND
        3'b010: begin
            result = A & B;
        end

        // OR
        3'b011: begin
            result = A | B;
        end

        // XOR
        3'b100: begin
            result = A ^ B;
        end

        // NOT A
        3'b101: begin
            result = ~A;
        end

        // Increment A
        3'b110: begin
            {carry, result} = A + 8'b00000001;
        end

        // Decrement A
        3'b111: begin
            result = A - 8'b00000001;

            if (A == 8'b00000000)
                carry = 1'b1;
            else
                carry = 1'b0;
        end

        default: begin
            result = 8'b00000000;
            carry = 1'b0;
        end

    endcase

end

endmodule
```
