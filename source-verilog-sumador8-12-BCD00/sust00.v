module sust00 (
    input clksu,
    input [3:0] codopsu,
    input [7:0] inAC8bitsu,
    input [11:0] inAC12bitsu,
    input inFlagAC12su,
    output reg [11:0] outAC12bitsu,
    output reg [11:0] outsust,
    output reg outFlagsuB,
    output reg outFlagsu
);

    always @(posedge clksu) begin
        if (codopsu == 4'b0010) begin
            if (inFlagAC12su == 1'b1) begin
                outAC12bitsu <= {inAC12bitsu[11:1], inAC8bitsu[7]};
                outsust <= {inAC12bitsu[11:1], inAC8bitsu[7]};
                outFlagsu <= 1'b1;
                outFlagsuB <= 1'b1;
            end else begin
                outFlagsu <= 1'b0;
                outFlagsuB <= 1'b0;
            end
        end else begin
            outAC12bitsu <= 12'b0000_0000_0000;
            // outsust <= 12'b0000_0000_0000;
            outFlagsu <= 1'b0;
            outFlagsuB <= 1'b0;
        end
    end

endmodule
