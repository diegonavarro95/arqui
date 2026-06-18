module shift32h00(clks, ens, inFlags, codehs, out32s);
	input clks;
	input ens;
	input inFlags; //Viene del coder outFlagc
	input [3:0] codehs;
	output reg [31:0] out32s;
	
	wire [1:0] scontrol;
	reg aux0;
	//reg [31:0] sshift;
	
	assign scontrol = {ens,inFlags};
	
	always @(posedge clks)
		begin
			case(scontrol)
				2'b00:
					begin
						out32s <= 32'b0;
						aux0 <= 1'b0;
						
					end
				
				2'b10:
					begin
						aux0 <= 1'b1;
					end
					
				2'b11:
					begin
						out32s[3:0] <= codehs;
						out32s[31:4] <= out32s[27:0];
					end
			endcase
		end
	
endmodule

//inicializacion, cuando leas 8b, pones la bandera inFlags en 0 e iniciamos, tenemos que evitar que el desplazamiento sea infinito.