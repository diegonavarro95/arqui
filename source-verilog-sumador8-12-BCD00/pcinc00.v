module pcinc00(
    input wire clkpc,
    input wire resetpc,
    input wire [3:0] incode,
    output reg [3:0] outpc,
    input wire inFlagAC8bit,
    input wire inFlagAC12bit,
    input wire flagiter,
    output reg outFlagpc
);
    always @(posedge clkpc) begin
        if (resetpc == 1'b0 && flagiter == 1'b1) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b0 && flagiter == 1'b1) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b0;
        end else if (resetpc == 1'b1 && flagiter == 1'b1) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (resetpc == 1'b1 && flagiter == 1'b0 && incode > 4'b0101) begin
            outpc <= 4'b0010;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b1 && flagiter == 1'b1 && incode > 4'b0101) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (resetpc == 1'b0 && flagiter == 1'b1 && incode > 4'b0101) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b0;
        end else if (resetpc == 1'b1 && flagiter == 1'b0 && incode > 4'b0101) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b0 && incode == 4'b0000) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b1 && incode == 4'b0000) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b0 && flagiter == 1'b0 && incode > 4'b0000) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b1 && flagiter == 1'b0 && incode == 4'b0000) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b1 && flagiter == 1'b1 && incode > 4'b0010) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b1 && flagiter == 1'b1 && incode == 4'b0000) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (resetpc == 1'b0 && flagiter == 1'b0 && incode == 4'b0000) begin
            outpc <= 4'b0000;
            outFlagpc <= 1'b1;
        end else if (inFlagAC8bit == 1'b1 && incode == 4'b0000) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC8bit == 1'b0 && incode == 4'b0000) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (inFlagAC8bit == 1'b1 && incode == 4'b0001) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC8bit == 1'b0 && incode == 4'b0001) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (inFlagAC12bit == 1'b1 && incode == 4'b0010) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC12bit == 1'b0 && incode == 4'b0010) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (flagiter == 1'b1) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (inFlagAC12bit == 1'b1 && incode == 4'b0011) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC12bit == 1'b0 && incode == 4'b0011) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (inFlagAC8bit == 1'b1 && incode == 4'b0100) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC8bit == 1'b0 && incode == 4'b0100) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else if (inFlagAC12bit == 1'b1 && incode == 4'b0101) begin
            outpc <= outpc + 1'b1;
            outFlagpc <= 1'b1;
        end else if (inFlagAC12bit == 1'b0 && incode == 4'b0101) begin
            outpc <= outpc;
            outFlagpc <= 1'b0;
        end else begin
            outpc <= 4'b0010;
            outFlagpc <= 1'b1;
        end
    end
endmodule
