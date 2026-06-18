module coder00 (
    input wire clkc,
    input wire enc,
    input wire [3:0] inkeyc,
    input wire [3:0] incontc,  // Monitorea el contador de anillo
    output reg [3:0] outcoderc,
    output reg outpushc
);

    // Registros internos equivalentes a las variables de VHDL
    // Actúan como banderas para asegurar que solo se envíe un pulso (one-shot) por pulsación
    reg var0 = 1'b0; // incont = 4'b1000
    reg var1 = 1'b0; // incont = 4'b0100
    reg var2 = 1'b0; // incont = 4'b0010
    reg var3 = 1'b0; // incont = 4'b0001

    always @(posedge clkc) begin
        if (enc == 1'b0) begin
            outcoderc <= 4'b0000;
            outpushc  <= 1'b0; // habilita el modulo de lectura
            var0      <= 1'b0;
            var1      <= 1'b0;
            var2      <= 1'b0;
            var3      <= 1'b0;
        end else begin
            case (incontc)
                // ----------------------------------------------------------------
                4'b1000: begin
                    case (inkeyc)
                        4'b0000: begin
                            var0 <= 1'b0;
                            outpushc <= 1'b0;
                        end
                        4'b0001: begin
                            if (var0 == 1'b0) begin var0 <= 1'b1; outcoderc <= 4'b0001; outpushc <= 1'b1; end // 1
                            else outpushc <= 1'b0;
                        end
                        4'b0010: begin
                            if (var0 == 1'b0) begin var0 <= 1'b1; outcoderc <= 4'b0010; outpushc <= 1'b1; end // 2
                            else outpushc <= 1'b0;
                        end
                        4'b0100: begin
                            if (var0 == 1'b0) begin var0 <= 1'b1; outcoderc <= 4'b0011; outpushc <= 1'b1; end // 3
                            else outpushc <= 1'b0;
                        end
                        4'b1000: begin
                            if (var0 == 1'b0) begin var0 <= 1'b1; outcoderc <= 4'b1010; outpushc <= 1'b1; end // A
                            else outpushc <= 1'b0;
                        end
                        default: ; // Equivale a 'when others => null;'
                    endcase
                end
                // ----------------------------------------------------------------
                4'b0100: begin
                    case (inkeyc)
                        4'b0000: begin
                            var1 <= 1'b0;
                            outpushc <= 1'b0;
                        end
                        4'b0001: begin
                            if (var1 == 1'b0) begin var1 <= 1'b1; outcoderc <= 4'b0100; outpushc <= 1'b1; end // 4
                            else outpushc <= 1'b0;
                        end
                        4'b0010: begin
                            if (var1 == 1'b0) begin var1 <= 1'b1; outcoderc <= 4'b0101; outpushc <= 1'b1; end // 5
                            else outpushc <= 1'b0;
                        end
                        4'b0100: begin
                            if (var1 == 1'b0) begin var1 <= 1'b1; outcoderc <= 4'b0110; outpushc <= 1'b1; end // 6
                            else outpushc <= 1'b0;
                        end
                        4'b1000: begin
                            if (var1 == 1'b0) begin var1 <= 1'b1; outcoderc <= 4'b1011; outpushc <= 1'b1; end // B
                            else outpushc <= 1'b0;
                        end
                        default: ;
                    endcase
                end
                // ----------------------------------------------------------------
                4'b0010: begin
                    case (inkeyc)
                        4'b0000: begin
                            var2 <= 1'b0;
                            outpushc <= 1'b0;
                        end
                        4'b0001: begin
                            if (var2 == 1'b0) begin var2 <= 1'b1; outcoderc <= 4'b0111; outpushc <= 1'b1; end // 7
                            else outpushc <= 1'b0;
                        end
                        4'b0010: begin
                            if (var2 == 1'b0) begin var2 <= 1'b1; outcoderc <= 4'b1000; outpushc <= 1'b1; end // 8
                            else outpushc <= 1'b0;
                        end
                        4'b0100: begin
                            if (var2 == 1'b0) begin var2 <= 1'b1; outcoderc <= 4'b1001; outpushc <= 1'b1; end // 9
                            else outpushc <= 1'b0;
                        end
                        4'b1000: begin
                            if (var2 == 1'b0) begin var2 <= 1'b1; outcoderc <= 4'b1100; outpushc <= 1'b1; end // C
                            else outpushc <= 1'b0;
                        end
                        default: ;
                    endcase
                end
                // ----------------------------------------------------------------
                4'b0001: begin
                    case (inkeyc)
                        4'b0000: begin
                            var3 <= 1'b0;
                            outpushc <= 1'b0;
                        end
                        4'b0001: begin
                            if (var3 == 1'b0) begin var3 <= 1'b1; outcoderc <= 4'b0000; outpushc <= 1'b1; end // 0
                            else outpushc <= 1'b0;
                        end
                        4'b0010: begin
                            if (var3 == 1'b0) begin var3 <= 1'b1; outcoderc <= 4'b1101; outpushc <= 1'b1; end // D
                            else outpushc <= 1'b0;
                        end
                        4'b0100: begin
                            if (var3 == 1'b0) begin var3 <= 1'b1; outcoderc <= 4'b1110; outpushc <= 1'b1; end // E
                            else outpushc <= 1'b0;
                        end
                        4'b1000: begin
                            if (var3 == 1'b0) begin var3 <= 1'b1; outcoderc <= 4'b1111; outpushc <= 1'b1; end // F
                            else outpushc <= 1'b0;
                        end
                        default: ;
                    endcase
                end
                default: ;
            endcase
        end
    end

endmodule