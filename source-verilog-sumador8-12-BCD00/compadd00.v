module compadd00 (
    input clkca,
    input [3:0] codopca,
    input [11:0] inBuf12ca,
    input inFlagUCca,
    output reg outFlagca,
    output reg [11:0] outBuf12ca
);

    reg [3:0] snibb00, snibb01, snibb02;
    reg aux = 1'b0;

    always @(posedge clkca) begin
        if (codopca == 4'b0011) begin
            if (inFlagUCca == 1'b1) begin
                outFlagca <= 1'b0;
                if (inBuf12ca[3:0] > 4'b0100) begin
                    snibb00 <= inBuf12ca[3:0] + 3;
                end else begin
                    snibb00 <= inBuf12ca[3:0];
                end
                
                if (inBuf12ca[7:4] > 4'b0100) begin
                    snibb01 <= inBuf12ca[7:4] + 3;
                end else begin
                    snibb01 <= inBuf12ca[7:4];
                end
                
                if (inBuf12ca[11:8] > 4'b0100) begin
                    snibb02 <= inBuf12ca[11:8] + 3;
                end else begin
                    snibb02 <= inBuf12ca[11:8];
                end
                aux <= 1'b0;
            end else if (aux == 1'b0) begin
                aux <= 1'b1;
                outBuf12ca <= {snibb02, snibb01, snibb00};
                outFlagca <= 1'b1;
            end else if (aux == 1'b1) begin
                outFlagca <= 1'b0;
            end
        end else begin
            outBuf12ca <= 12'b0000_0000_0000;
            outFlagca <= 1'b0;
            aux <= 1'b0;
        end
    end

endmodule
