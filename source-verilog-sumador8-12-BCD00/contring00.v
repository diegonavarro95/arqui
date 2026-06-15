module contring00 (
    input clkr,
    input resetr,
    output reg [3:0] outr
);

    reg [3:0] sintRing;

    always @(posedge clkr) begin
        if (resetr == 1'b0) begin
            sintRing <= 4'b0001;
            outr <= sintRing;
        end else begin
            sintRing <= {sintRing[2:0], sintRing[3]};
            outr <= sintRing;
        end
    end

endmodule
