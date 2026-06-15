module topdiv00(
    input wire [5:0] indiv0,
    output wire outdiv0
);
    wire sclk;

    osc00 UD00 (
        .osc_int(sclk)
    );
    
    div00 UD01 (
        .clkdiv(sclk),
        .indiv(indiv0),
        .outdiv(outdiv0)
    );

endmodule
