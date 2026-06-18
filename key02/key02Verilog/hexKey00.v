module hexKey00 (
    output wire clk0,
    input wire [5:0] cdiv0,
    input wire en0,
    input wire [3:0] inkey0,
    output wire [3:0] outr0,
    output wire [31:0] out320,
    output wire [3:0] outr70,
    output wire [6:0] out7seg0
);

    // Señales internas para conectar los módulos
    wire [3:0] scodehexa;
    wire spush;

    // K0200: Oscilador y divisor de frecuencia
    osc00 K0200 (
        .cdiv(cdiv0),
        .oscout0(clk0)
    );

    // K0201: Contador de anillo para el barrido del teclado
    contring00 K0201 (
        .clkr(clk0),
        .enr(en0),
        .outr(outr0)
    );

    // K0202: Codificador del teclado matricial
    coder00 K0202 (
        .clkc(clk0),
        .enc(en0),
        .inkeyc(inkey0),
        .incontc(outr0),
        .outcoderc(scodehexa),
        .outpushc(spush)
    );

    // K0203: Registro de desplazamiento (Shift register) para almacenar los valores
    lect00 K0203 (
        .clkrd(clk0),
        .enrd(en0),
        .inpushrd(spush),
        .incoderd(scodehexa),
        .out32rd(out320)
    );

    // K0204: Contador de anillo para el barrido/multiplexación de los displays
    cpntring7seg00 K0204 (
        .clkr7(clk0),
        .enr7(en0),
        .outr7(outr70)
    );

    // K0205: Decodificador de binario/hex a 7 segmentos
    coder7seg00 K0205 (
        .incontcd7(outr70),
        .in32cd7(out320),
        .out7segcd(out7seg0)
    );

endmodule