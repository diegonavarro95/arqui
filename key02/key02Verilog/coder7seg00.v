module coder7seg00 (
    input wire [3:0] incontcd7,   // transistores
    input wire [31:0] in32cd7,
    output reg [6:0] out7segcd
);

    // Señales internas para extraer los nibbles (grupos de 4 bits)
    wire [3:0] snibb0 = in32cd7[3:0];
    wire [3:0] snibb1 = in32cd7[7:4];
    wire [3:0] snibb2 = in32cd7[11:8];
    wire [3:0] snibb3 = in32cd7[15:12];
    wire [3:0] snibb4 = in32cd7[19:16];
    wire [3:0] snibb5 = in32cd7[23:20];
    wire [3:0] snibb6 = in32cd7[27:24];
    wire [3:0] snibb7 = in32cd7[31:28];

    // Función combinacional para decodificar de binario/hex a 7 segmentos
    // Esto equivale a tus bloques "with ... select" pero escrito una sola vez
    function [6:0] decodificador_7seg;
        input [3:0] nibble_in;
        begin
            case (nibble_in)
                4'b0000: decodificador_7seg = 7'b1111110; // 0
                4'b0001: decodificador_7seg = 7'b0110000; // 1
                4'b0010: decodificador_7seg = 7'b1101101; // 2
                4'b0011: decodificador_7seg = 7'b1111001; // 3
                4'b0100: decodificador_7seg = 7'b0110011; // 4
                4'b0101: decodificador_7seg = 7'b1011011; // 5
                4'b0110: decodificador_7seg = 7'b1011111; // 6
                4'b0111: decodificador_7seg = 7'b1110000; // 7
                4'b1000: decodificador_7seg = 7'b1111111; // 8
                4'b1001: decodificador_7seg = 7'b1110011; // 9
                4'b1010: decodificador_7seg = 7'b1110111; // A
                4'b1011: decodificador_7seg = 7'b0011111; // b
                4'b1100: decodificador_7seg = 7'b1001110; // C
                4'b1101: decodificador_7seg = 7'b0111101; // d
                4'b1110: decodificador_7seg = 7'b1001111; // E
                4'b1111: decodificador_7seg = 7'b1000111; // F
                default: decodificador_7seg = 7'b0000000;
            endcase
        end
    endfunction

    // Aplicamos la función a cada nibble
    wire [6:0] scode7seg0 = decodificador_7seg(snibb0);
    wire [6:0] scode7seg1 = decodificador_7seg(snibb1);
    wire [6:0] scode7seg2 = decodificador_7seg(snibb2);
    wire [6:0] scode7seg3 = decodificador_7seg(snibb3);
    wire [6:0] scode7seg4 = decodificador_7seg(snibb4);
    wire [6:0] scode7seg5 = decodificador_7seg(snibb5);
    wire [6:0] scode7seg6 = decodificador_7seg(snibb6);
    wire [6:0] scode7seg7 = decodificador_7seg(snibb7);

    // Multiplexor para seleccionar qué dígito mostrar en el display
    always @(*) begin
        case (incontcd7)
            4'b0001: out7segcd = scode7seg0;
            4'b0010: out7segcd = scode7seg1;
            4'b0100: out7segcd = scode7seg2;
            4'b1000: out7segcd = scode7seg3;
            default: out7segcd = 7'b0000000;
        endcase
    end

endmodule