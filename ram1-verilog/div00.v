module div00(clkdiv, indiv, oscout);
    input clkdiv;
    input [5:0] indiv;
    output reg oscout;
    
    reg [21:0] sdiv;
	
	initial begin
			sdiv = 0;
			oscout = 0;
	end
    
    always @(posedge clkdiv)
    begin
        case (indiv)
            6'b000000:
            begin
                if (sdiv > 22'b1000000000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
            
            6'b000001:
            begin
                if (sdiv > 22'b0100000000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
            
            6'b000011:
            begin
                if (sdiv > 22'b0010000000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b000111:
            begin
                if (sdiv > 22'b0001000000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b001111:
            begin
                if (sdiv > 22'b0000100000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b011111:
            begin
                if (sdiv > 22'b0000010000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b111111:
            begin
                if (sdiv > 22'b0000001000000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b111110:
            begin
                if (sdiv > 22'b0000000100000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b111100:
            begin
                if (sdiv > 22'b0000000010000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
			6'b111000:
            begin
                if (sdiv > 22'b0000000001000000000000)
                begin
                    oscout <= ~oscout;
                    sdiv <= 0;
                end
                else
                    sdiv <= sdiv + 1;
            end
			
            default:
            begin
                sdiv <= 0;
                oscout <= 0;
            end
        endcase
    end
endmodule