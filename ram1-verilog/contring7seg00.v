module contring7seg00(

input wire clkr7,
input wire resetr7,
input wire enabler7,

output reg [3:0] outr7

);

always @(*) begin

    if(!resetr7 || !enabler7)
        outr7 = 4'b0000;
    else
        outr7 = 4'b1000; // D4 activo

end

endmodule