module osc00(cdiv, led);
    input [5:0] cdiv;
    output led;
    
    wire sclk;
    
    oscint00 O00 (.osc_clk(sclk));
    
    div00 O01 (.clkdiv(sclk), .indiv(cdiv), .oscout(led));
endmodule