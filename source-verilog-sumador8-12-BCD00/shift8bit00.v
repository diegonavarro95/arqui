module shift8bit00(
    input wire clks,
    input wire [3:0] codops,
    input wire [7:0] inACs,
    input wire inFlags,
    output reg [7:0] outACs,
    output reg outFlags
);
    reg aux = 1'b0;

    always @(posedge clks) begin
        if (codops == 4'b0100) begin
            if (inFlags == 1'b1) begin
                if (aux == 1'b0) begin
                    aux <= 1'b1;
                    outFlags <= 1'b1;
                    outACs[0] <= 1'b0;
                    outACs[7:1] <= inACs[6:0];
                end else begin
                    outFlags <= 1'b0;
                end
            end else if (inFlags == 1'b0) begin
                outFlags <= 1'b0;
            end
        end else begin
            outACs <= 8'b00000000;
            outFlags <= 1'b0;
            aux <= 1'b0;
        end
    end
endmodule
