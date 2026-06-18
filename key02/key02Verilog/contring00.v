module contring00 (
    input wire clkr,
    input wire enr,
    output reg [3:0] outr
);

    always @(posedge clkr) begin
        if (enr == 1'b0) begin
            // Estado inicial o de carga
            outr <= 4'b1000;
        end else begin
            // Desplazamiento circular (Ring Counter)
            // El bit 0 pasa al bit 3 (MSB), y los bits 3 al 1 se desplazan a las posiciones 2 al 0
            outr <= {outr[0], outr[3:1]};
        end
    end

endmodule