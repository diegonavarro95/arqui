module lect00 (
    input wire clkrd,
    input wire enrd,
    input wire inpushrd,
    input wire [3:0] incoderd,
    output reg [31:0] out32rd
);

    // Señal interna para el control
    wire [1:0] scontrolrd;
    
    // Concatenación de enrd e inpushrd
    assign scontrolrd = {enrd, inpushrd};

    always @(posedge clkrd) begin
        case (scontrolrd)
            2'b00: begin
                // Limpia el registro
                out32rd <= 32'b0;
            end
            
            2'b11: begin
                // Desplazamiento hacia la izquierda:
                // A la parte alta (bits 31 al 4) le pasamos la parte baja anterior (27 al 0),
                // y en la parte baja (bits 3 al 0) ingresa el nuevo valor del codificador.
                out32rd <= {out32rd[27:0], incoderd};
            end
            
            default: begin
                // Mantener el valor actual (equivalente a 'when others => null;')
            end
        endcase
    end

endmodule