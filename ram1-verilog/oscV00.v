module oscint00 (osc_clk);
	output osc_clk;
	
	defparam OSCH_inst.NOM_FREQ = "2.08";
	
	OSCH OSCH_inst ( .STDBY(1'b0), .OSC(osc_clk), . SEDSTDBY());
endmodule