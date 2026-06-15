module divint00(
    input wire clkd,
    input wire resetd,
    output reg outd
);
    reg [3:0] QR;

    always @(posedge clkd or negedge resetd) begin
        if (resetd == 1'b0) begin
            QR <= 4'b0000;
            outd <= 1'b0;
        end else begin
            QR <= QR + 1'b1;
            if (QR == 4'b1000) begin
                outd <= ~outd;
                QR <= 4'b0000;
            end
        end
    end
endmodule
