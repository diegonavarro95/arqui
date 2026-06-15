module shift12bit00(
    input wire clkss,
    input wire [3:0] codopss,
    input wire [11:0] inACss,
    input wire inFlagss,
    output reg [11:0] outACss,
    output reg outFlagss
);
    reg aux = 1'b0;

    always @(posedge clkss) begin
        if (codopss == 4'b0101) begin
            if (inFlagss == 1'b1) begin
                if (aux == 1'b0) begin
                    aux <= 1'b1;
                    outFlagss <= 1'b1;
                    outACss[0] <= 1'b0;
                    outACss[11:1] <= inACss[10:0];
                end else if (aux == 1'b1) begin
                    outFlagss <= 1'b0;
                end
            end else if (inFlagss == 1'b0) begin
                outFlagss <= 1'b0;
            end
        end else begin
            outACss <= 12'b000000000000;
            outFlagss <= 1'b0;
            aux <= 1'b0;
        end
    end
endmodule
