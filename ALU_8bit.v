`timescale 1ns / 1ps

module alu_8bit(

    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] sel,

    output reg [7:0] result,
    output reg carry,
    output reg zero

);

always @(*)
begin

    carry = 1'b0;

    case(sel)

        4'b0000: {carry,result} = A + B;      // ADD
        4'b0001: {carry,result} = A - B;      // SUB
        4'b0010: result = A + 1;              // INC
        4'b0011: result = A - 1;              // DEC

        4'b0100: result = ~A;                 // NOT
        4'b0101: result = A & B;              // AND
        4'b0110: result = A | B;              // OR
        4'b0111: result = ~(A & B);           // NAND

        4'b1000: result = ~(A | B);           // NOR
        4'b1001: result = A ^ B;              // XOR
        4'b1010: result = ~(A ^ B);           // XNOR

        4'b1011: result = (A > B)  ? 8'd1 : 8'd0;
        4'b1100: result = (A < B)  ? 8'd1 : 8'd0;
        4'b1101: result = (A == B) ? 8'd1 : 8'd0;

        4'b1110: result = A << 1;             // LEFT SHIFT
        4'b1111: result = A >> 1;             // RIGHT SHIFT

        default: result = 8'd0;

    endcase

    zero = (result == 8'd0);

end

endmodule