module mux00 (
    input [3:0] selmux,
    input [6:0] intBCDU,
    input [6:0] intBCDD,
    input [6:0] intBCDC,
    output reg [6:0] outBCDmux
);

    always @(*) begin
        case (selmux)
            4'b0001: outBCDmux = intBCDU;
            4'b0010: outBCDmux = intBCDD;
            4'b0100: outBCDmux = intBCDC;
            4'b1000: outBCDmux = 7'b1111110;
            default: outBCDmux = 7'b0000000;
        endcase
    end

endmodule
