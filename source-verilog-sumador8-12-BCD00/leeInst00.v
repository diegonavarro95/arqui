module leeInst00(
    input wire inFlagInstrom,
    output reg outFlagrom,
    input wire [3:0] inPCrom,
    output reg [3:0] outcode
);
    // Corrección: Tamaño exacto para 4 bits (0 a 15)
    reg [3:0] memrom [0:15];
    
    initial begin
        memrom[0] = 4'b0000;
        memrom[1] = 4'b0001;
        memrom[2] = 4'b0010;
        memrom[3] = 4'b0011;
        memrom[4] = 4'b0100;
        memrom[5] = 4'b0101;
        memrom[6] = 4'b0110;
        memrom[7] = 4'b0000;
        memrom[8] = 4'b0000;
        memrom[9] = 4'b0000;
        memrom[10] = 4'b0000;
        memrom[11] = 4'b0000;
        memrom[12] = 4'b0000;
        memrom[13] = 4'b0000;
        memrom[14] = 4'b0000;
        memrom[15] = 4'b0000;
    end

    // Corrección: always combinacional puro
    always @(*) begin 
        if (inFlagInstrom == 1'b1) begin
            outcode = memrom[inPCrom];
            outFlagrom = 1'b1;
        end else begin
            // Valor por defecto para evitar latches
            outcode = 4'b0000;
            outFlagrom = 1'b0;
        end
    end
endmodule