module contring00(

input wire clkr,
input wire resetr,
input wire enabler,

output reg [3:0] outr

);

reg [3:0] sshift;

initial begin
    sshift=4'b1000;
    outr=4'b0000;
end

always @(posedge clkr) begin

case({resetr,enabler})

2'b00,
2'b01:
begin
    sshift<=4'b1000;
    outr<=4'b0000;
end

2'b11:
begin
    sshift<={sshift[0],sshift[3:1]};
    outr<=sshift;
end

endcase

end

endmodule