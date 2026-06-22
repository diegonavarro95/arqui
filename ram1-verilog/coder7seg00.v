module coder7seg00(

input [4:0] digit,

output reg [6:0] out7seg

);

always @(*) begin

case(digit)

5'h00: out7seg=7'b0000110; // 1
5'h01: out7seg=7'b1100011; // *
5'h02: out7seg=7'b0111111; // 0
5'h03: out7seg=7'b1011100; // #

5'h04: out7seg=7'b0000111; // 7
5'h05: out7seg=7'b1111111; // 8
5'h06: out7seg=7'b1101111; // 9

5'h07: out7seg=7'b1100110; // 4
5'h08: out7seg=7'b1101101; // 5
5'h09: out7seg=7'b1111101; // 6

5'h0A: out7seg=7'b1011110; // D
5'h0B: out7seg=7'b0111001; // C

5'h0C: out7seg=7'b1111100; // B
5'h0D: out7seg=7'b1011011; // 2

5'h0E: out7seg=7'b1001111; // 3
5'h0F: out7seg=7'b1110111; // A

5'h10: out7seg=7'b1000000; // -

default: out7seg=7'b0000000;

endcase

end

endmodule