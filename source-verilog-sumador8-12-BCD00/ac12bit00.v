module ac12bit00(
    input wire clkac12,
    input wire [11:0] inac12,
    output reg [11:0] outac12,
    input wire inFlagac12Inst,
    output reg outFlagac12
);
    reg aux = 1'b0;

    always @(posedge clkac12) begin
        if (inFlagac12Inst == 1'b1) begin
            if (aux == 1'b0) begin
                aux <= 1'b1;
                outac12 <= inac12;
            end
            outFlagac12 <= 1'b1;
        end else begin
            outFlagac12 <= 1'b0;
            aux <= 1'b0;
        end
    end
endmodule
