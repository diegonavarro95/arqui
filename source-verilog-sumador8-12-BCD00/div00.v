module div00(
    input wire clkdiv,
    input wire [5:0] indiv,
    output reg outdiv
);
    reg [21:0] sdiv;
	
	initial begin
        sdiv = 22'b0;
        outdiv = 1'b0;
    end

    always @(posedge clkdiv) begin
        case (indiv)
            6'b000000: begin
                if (sdiv > 22'b1000000000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b000001: begin
                if (sdiv > 22'b0100000000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b000011: begin
                if (sdiv > 22'b0010000000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b000111: begin
                if (sdiv > 22'b0001000000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b001111: begin
                if (sdiv > 22'b0000100000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b011111: begin
                if (sdiv > 22'b0000010000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b111111: begin
                if (sdiv > 22'b0000001000000000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b111110: begin
                if (sdiv > 22'b0000000000100000000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            6'b111100: begin
                if (sdiv > 22'b0000000000000010000000) begin
                    outdiv <= ~outdiv;
                    sdiv <= 22'b0;
                end else begin
                    sdiv <= sdiv + 1'b1;
                end
            end
            default: ;
        endcase
    end
endmodule
