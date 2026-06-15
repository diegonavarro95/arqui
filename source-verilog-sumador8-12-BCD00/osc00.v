module osc00(
    output wire osc_int
);
    OSCH #(.NOM_FREQ("2.08")) OSCInst0 (
        .STDBY(1'b0),
		.SEDSTDBY(),
        .OSC(osc_int)
    );
endmodule
