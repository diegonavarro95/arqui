module topconvbcd00 (
    inout wire clk0,
    input wire [5:0] cdiv0,
    inout wire sclk0,
    input wire reset0,
    input wire reset1,
    inout wire soutFlagpc,
    inout wire sFlagInst,
    inout wire sFlag8out,
    inout wire sFlag12out,
    inout wire sFlag12B,
    inout wire soutFlagrom,
    inout wire soutFlagIt,
    inout wire [3:0] outpcport,
    inout wire [3:0] outcodeport,
    input wire [7:0] inport8a0,
    input wire [7:0] inport8b0,
    input wire SL,
    input wire EN,
    inout wire [11:0] outport120,
    inout wire [7:0] outport8a0,
    inout wire [3:0] outTransist0,
    output wire outLED0,
    output wire [6:0] outDisplay
);

    wire [7:0] sAC8b;
    wire [11:0] sAC12a;
    wire [11:0] sAC12b;
    wire sFlag12Inst;
    wire [6:0] soutU;
    wire [6:0] soutD;
    wire [6:0] soutC;
    wire [7:0] sAdderOut;
    wire [7:0] sBCDInput;
    wire [7:0] sMagnitude;
    wire sInternalLED;

    // --- NUEVOS CABLES PARA MULTIPLEXOR ---
    wire [7:0] sAC8b_init, sAC8b_portA, sAC8b_shift;
    wire [11:0] sAC12b_init, sAC12b_sust, sAC12b_comp, sAC12b_shift;
    wire sFlagInst_init, sFlagInst_portA, sFlagInst_shift;
    wire sFlag12Inst_init, sFlag12Inst_sust, sFlag12Inst_comp, sFlag12Inst_shift;

    // --- MULTIPLEXORES DE BUS ---
    // --- MULTIPLEXORES SUSTITUIDOS POR COMPUERTAS OR ---
    assign sAC8b = sAC8b_init | sAC8b_portA | sAC8b_shift;
    
    assign sFlagInst = sFlagInst_init | sFlagInst_portA | sFlagInst_shift;

    assign sAC12b = sAC12b_init | sAC12b_sust | sAC12b_comp | sAC12b_shift;

    assign sFlag12Inst = sFlag12Inst_init | sFlag12Inst_sust | sFlag12Inst_comp | sFlag12Inst_shift;


    assign sMagnitude = (sAdderOut[7]) ? (~sAdderOut + 8'b1) : sAdderOut;
    assign sBCDInput = (sInternalLED) ? 8'b0 : 
                       (EN)           ? sMagnitude  : 8'b0;
    
    assign outLED0 = sInternalLED;

    topdiv00 U00 (
        .outdiv0(clk0),
        .indiv0(cdiv0)
    );

    adder8bitV00 U_ADDER (
        .Ai(inport8a0),
        .Bi(inport8b0),
        .SL(SL),
        .So(sAdderOut),
        .LED(sInternalLED)
    );

    init00 U01 (
        .clkinit(sclk0),
        .codopinit(outcodeport),
        .inFlag8init(soutFlagrom),
        .outACA8init(sAC8b_init),          // Conectado al MUX
        .outACA12init(sAC12b_init),        // Conectado al MUX
        .outFlag12init(sFlag12Inst_init),  // Conectado al MUX
        .outFlag8init(sFlagInst_init)      // Conectado al MUX
    );

    portA00 U02 (
        .clkLp(sclk0),
        .codopLp(outcodeport),
        .portALp(sBCDInput),
        .ACLpA(sAC8b_portA),               // Conectado al MUX
        .inFlagLp(soutFlagrom),
        .outFlagLp(sFlagInst_portA)        // Conectado al MUX
    );

    pcinc00 U03 (
        .clkpc(sclk0),
        .resetpc(reset0),
        .incode(outcodeport),
        .outpc(outpcport),
        .inFlagAC8bit(sFlag8out),
        .inFlagAC12bit(sFlag12out),
        .flagiter(soutFlagIt),
        .outFlagpc(soutFlagpc)
    );

    ac8bit00 U04 (
        .clkac8(sclk0),
        .inac8(sAC8b),
        .outac8(outport8a0),
        .inFlagac8Inst(sFlagInst),
        .outFlagac8(sFlag8out)
    );

    leeInst00 U05 (
        .inFlagInstrom(soutFlagpc),
        .outFlagrom(soutFlagrom),
        .inPCrom(outpcport),
        .outcode(outcodeport)
    );

    shift8bit00 U06 (
        .clks(sclk0),
        .codops(outcodeport),
        .inACs(outport8a0),
        .inFlags(soutFlagrom),
        .outACs(sAC8b_shift),              // Conectado al MUX
        .outFlags(sFlagInst_shift)         // Conectado al MUX
    );

    ac12bit00 U07 (
        .clkac12(sclk0),
        .inac12(sAC12b),
        .outac12(sAC12a),
        .inFlagac12Inst(sFlag12Inst),
        .outFlagac12(sFlag12out)
    );

    sust00 U08 (
        .clksu(sclk0),
        .codopsu(outcodeport),
        .inAC8bitsu(outport8a0),
        .inAC12bitsu(sAC12a),
        .inFlagAC12su(soutFlagrom),
        .outAC12bitsu(sAC12b_sust),        // Conectado al MUX
        .outsust(outport120),
        .outFlagsuB(sFlag12B),
        .outFlagsu(sFlag12Inst_sust)       // Conectado al MUX
    );

    compadd00 U09 (
        .clkca(sclk0),
        .codopca(outcodeport),
        .inBuf12ca(sAC12a),
        .inFlagUCca(soutFlagrom),
        .outFlagca(sFlag12Inst_comp),      // Conectado al MUX
        .outBuf12ca(sAC12b_comp)           // Conectado al MUX
    );

    shift12bit00 U10 (
        .clkss(sclk0),
        .codopss(outcodeport),
        .inACss(sAC12a),
        .inFlagss(soutFlagrom),
        .outACss(sAC12b_shift),            // Conectado al MUX
        .outFlagss(sFlag12Inst_shift)      // Conectado al MUX
    );

    contIter00 U11 (
        .clkit(sclk0),
        .resetIt(reset0),
        .inFlagIt(sFlag12B),
        .outFlagIt(soutFlagIt),
		.contIterac()
    );

    coderNibbles00 U12 (
        .AC12bit03(sAC12a),
        .outU(soutU),
        .outD(soutD),
        .outC(soutC)
    );

    contring00 U13 (
        .clkr(clk0),
        .resetr(reset0),
        .outr(outTransist0)
    );

    divint00 U14 (
        .clkd(clk0),
        .resetd(reset1),
        .outd(sclk0)
    );

    mux00 U15 (
        .selmux(outTransist0),
        .intBCDU(soutU),
        .intBCDD(soutD),
        .intBCDC(soutC),
        .outBCDmux(outDisplay)
    );

endmodule