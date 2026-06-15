module coderNibbles00 (
    input [11:0] AC12bit03,
    output reg [6:0] outU,
    output reg [6:0] outD,
    output reg [6:0] outC
);

    wire [3:0] nibbU = AC12bit03[3:0];
    wire [3:0] nibbD = AC12bit03[7:4];
    wire [3:0] nibbC = AC12bit03[11:8];

    always @(*) begin
        case (nibbU)
            4'b0000: outU = 7'b1111110;
            4'b0001: outU = 7'b0110000;
            4'b0010: outU = 7'b1101101;
            4'b0011: outU = 7'b1111001;
            4'b0100: outU = 7'b0110011;
            4'b0101: outU = 7'b1011011;
            4'b0110: outU = 7'b1011111;
            4'b0111: outU = 7'b1110000;
            4'b1000: outU = 7'b1111111;
            4'b1001: outU = 7'b1111011;
            default: outU = 7'b0000000;
        endcase
    end

    always @(*) begin
        case (nibbD)
            4'b0000: outD = 7'b1111110;
            4'b0001: outD = 7'b0110000;
            4'b0010: outD = 7'b1101101;
            4'b0011: outD = 7'b1111001;
            4'b0100: outD = 7'b0110011;
            4'b0101: outD = 7'b1011011;
            4'b0110: outD = 7'b1011111;
            4'b0111: outD = 7'b1110000;
            4'b1000: outD = 7'b1111111;
            4'b1001: outD = 7'b1111011;
            default: outD = 7'b0000000;
        endcase
    end

    always @(*) begin
        case (nibbC)
            4'b0000: outC = 7'b1111110;
            4'b0001: outC = 7'b0110000;
            4'b0010: outC = 7'b1101101;
            4'b0011: outC = 7'b1111001;
            4'b0100: outC = 7'b0110011;
            4'b0101: outC = 7'b1011011;
            4'b0110: outC = 7'b1011111;
            4'b0111: outC = 7'b1110000;
            4'b1000: outC = 7'b1111111;
            4'b1001: outC = 7'b1111011;
            default: outC = 7'b0000000;
        endcase
    end

endmodule
