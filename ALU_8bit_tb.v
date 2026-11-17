timescale 1ns / 1ps

module tb_alu_8bit;

reg  [7:0] A;
reg  [7:0] B;
reg  [3:0] sel;

wire [7:0] result;
wire carry;
wire zero;

alu_8bit DUT(

    .A(A),
    .B(B),
    .sel(sel),

    .result(result),
    .carry(carry),
    .zero(zero)

);

initial
begin

    $display("===== 8-BIT ALU TEST STARTED =====");

    A=10; B=5; sel=4'b0000; #10;
    if(result==15) $display("ADD PASS"); else $display("ADD FAIL");

    A=20; B=8; sel=4'b0001; #10;
    if(result==12) $display("SUB PASS"); else $display("SUB FAIL");

    A=15; sel=4'b0010; #10;
    if(result==16) $display("INC PASS"); else $display("INC FAIL");

    A=15; sel=4'b0011; #10;
    if(result==14) $display("DEC PASS"); else $display("DEC FAIL");

    A=8'h0F; sel=4'b0100; #10;
    if(result==8'hF0) $display("NOT PASS"); else $display("NOT FAIL");

    A=12; B=10; sel=4'b0101; #10;
    if(result==(12&10)) $display("AND PASS"); else $display("AND FAIL");

    A=12; B=10; sel=4'b0110; #10;
    if(result==(12|10)) $display("OR PASS"); else $display("OR FAIL");

    A=12; B=10; sel=4'b0111; #10;
    if(result==~(12&10)) $display("NAND PASS"); else $display("NAND FAIL");

    A=12; B=10; sel=4'b1000; #10;
    if(result==~(12|10)) $display("NOR PASS"); else $display("NOR FAIL");

    A=12; B=10; sel=4'b1001; #10;
    if(result==(12^10)) $display("XOR PASS"); else $display("XOR FAIL");

    A=12; B=10; sel=4'b1010; #10;
    if(result==~(12^10)) $display("XNOR PASS"); else $display("XNOR FAIL");

    A=20; B=10; sel=4'b1011; #10;
    if(result==1) $display("> PASS"); else $display("> FAIL");

    A=5; B=10; sel=4'b1100; #10;
    if(result==1) $display("< PASS"); else $display("< FAIL");

    A=10; B=10; sel=4'b1101; #10;
    if(result==1) $display("== PASS"); else $display("== FAIL");

    A=8; sel=4'b1110; #10;
    if(result==16) $display("LEFT SHIFT PASS"); else $display("LEFT SHIFT FAIL");

    A=8; sel=4'b1111; #10;
    if(result==4) $display("RIGHT SHIFT PASS"); else $display("RIGHT SHIFT FAIL");

    $display("===== ALL TESTS COMPLETED =====");

    $finish;

end

endmodule
