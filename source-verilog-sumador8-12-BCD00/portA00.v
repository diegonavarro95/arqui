module portA00(
    input wire clkLp,
    input wire [3:0] codopLp,
    input wire [7:0] portALp,
    output reg [7:0] ACLpA,
    input wire inFlagLp,
    output reg outFlagLp
);
    always @(posedge clkLp) begin
        if (codopLp == 4'b0001) begin
            if (inFlagLp == 1'b1) begin
                ACLpA <= portALp;
                outFlagLp <= 1'b1;
            end else begin
                outFlagLp <= 1'b0;
            end
        end else begin
            ACLpA <= 8'b00000000;
            outFlagLp <= 1'b0;
        end
    end
endmodule
