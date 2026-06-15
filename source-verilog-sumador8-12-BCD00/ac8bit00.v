module ac8bit00(
    input wire clkac8,
    input wire [7:0] inac8,
    output reg [7:0] outac8,
    input wire inFlagac8Inst,
    output reg outFlagac8
);
    reg aux = 1'b0;

    always @(posedge clkac8) begin
        if (inFlagac8Inst == 1'b1) begin
            outac8 <= inac8;
            outFlagac8 <= 1'b1;
        end else begin
            outFlagac8 <= 1'b0;
            aux <= 1'b0;
        end
    end
endmodule
