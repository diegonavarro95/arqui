module lecturaHexad00(

input wire [5:0] cdiv0,
input wire [5:0] cdiv_read,

input wire reset0,
input wire enable0,

input wire [3:0] inkey0,
input wire [3:0] op0,

output wire [3:0] outr0,

output wire [4:0] out320,

output wire [6:0] out7seg0,
output wire [3:0] outtransist0,

output wire outpush0

);

wire clk0;
wire clk_read;

wire [3:0] scodeHexa0;


//=====================
// OSCILADOR TECLADO
//=====================

osc00 L00(
.cdiv(cdiv0),
.led(clk0)
);


//=====================
// OSCILADOR LECTURA
//=====================

osc00 L00B(
.cdiv(cdiv_read),
.led(clk_read)
);


//=====================
// BARRIDO TECLADO
//=====================

contring00 L01(
.clkr(clk0),
.resetr(reset0),
.enabler(enable0),
.outr(outr0)
);


//=====================
// DISPLAY ÚNICO
//=====================

contring7seg00 L02(
.clkr7(clk0),
.resetr7(reset0),
.enabler7(enable0),
.outr7(outtransist0)
);


//=====================
// DECODIFICADOR TECLADO
//=====================

coder00 L03(
.clkc(clk0),
.resetc(reset0),
.enablec(enable0),

.inkeyc(inkey0),
.incontc(outr0),

.outcodigohexadc(scodeHexa0),
.pushc(outpush0)
);


//=====================
// RAM
//=====================

ram00 L04(

.clk(clk0),

.reset(reset0),

.push(outpush0),
.inhex(scodeHexa0),

.op(op0),

.outdisplay(out320)

);


//=====================
// DECODIFICADOR 7SEG
//=====================

coder7seg00 L05(

.digit(out320),

.out7seg(out7seg0)

);

endmodule