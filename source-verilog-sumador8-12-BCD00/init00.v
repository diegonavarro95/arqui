module init00(
    input wire clkinit,
    input wire [3:0] codopinit,
    input wire inFlag8init,
    output reg [7:0] outACA8init,
    output reg [11:0] outACA12init,
    output reg outFlag12init,
    output reg outFlag8init
);
    reg aux0;
    reg aux1;

    always @(posedge clkinit) begin
        if (codopinit == 4'b0000) begin
            if (inFlag8init == 1'b0) begin
                if (aux0 == 1'b0) begin
                    aux0 <= 1'b1;
                    outFlag8init <= 1'b1;
                    outFlag12init <= 1'b1;
                    outACA8init <= 8'b00111100;
                    outACA12init <= 12'b000000000000;
                end else begin
                    outFlag8init <= 1'b0;
                    outFlag12init <= 1'b0;
                end
            end else if (inFlag8init == 1'b1) begin
                if (aux1 == 1'b0) begin
                    aux1 <= 1'b1;
                    outACA8init <= 8'b00001111;
                    outACA12init <= 12'b000000000000;
                    outFlag8init <= 1'b1;
                    outFlag12init <= 1'b1;
                end else begin
                    outFlag8init <= 1'b0;
                    outFlag12init <= 1'b0;
                end
            end
        end else begin
            outACA8init <= 8'b00000000;
            outACA12init <= 12'b000000000000;
            outFlag8init <= 1'b0;
            outFlag12init <= 1'b0;
            aux0 <= 1'b0;
            aux1 <= 1'b0;
        end
    end
endmodule
