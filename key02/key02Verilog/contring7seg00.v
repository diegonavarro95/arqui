module cpntring7seg00 (
    input wire clkr7,
    input wire enr7,
    output reg [3:0] outr7
);

    always @(posedge clkr7) begin
        case (enr7)
            1'b0: begin
                // Estado inicial: enciende el primer dígito/transistor
                outr7 <= 4'b0001;
            end
            
            1'b1: begin
                // Desplazamiento circular hacia la izquierda (Ring Counter)
                // El bit 3 (MSB) pasa al bit 0 (LSB), y los bits 2 al 0 se recorren hacia la izquierda
                outr7 <= {outr7[2:0], outr7[3]};
            end
            
            default: begin
                // No hacer nada
            end
        endcase
    end

endmodule