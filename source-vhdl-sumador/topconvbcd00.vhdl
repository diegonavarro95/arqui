library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagep00.all;

--PARA SER IMPLEMENTADO EN LA FPGA MachXo2
entity topconvbcd00 is
port( 
	clk0: inout std_logic ;
	cdiv0: in std_logic_vector(5 downto 0); 
	sclk0: inout std_logic ;
	reset0: in std_logic ;
	reset1: in std_logic ;
	inneg: in std_logic;
	soutFlagpc: inout std_logic ;
	sFlagInst: inout std_logic ;
    sFlag8out: inout std_logic;
    sFlag12out: inout std_logic;
    sFlag12B: inout std_logic;
    soutFlagrom: inout std_logic;
	soutFlagIt : inout std_logic;
	outpcport: inout std_logic_vector ( 3 downto 0 );
	outcodeport: inout std_logic_vector ( 3 downto 0 );
	inport8a0: inout std_logic_vector ( 7 downto 0 );
    outport120: inout std_logic_vector ( 11 downto 0 );
	outport8a0: inout std_logic_vector ( 7 downto 0 ); 
    outTransist0: inout std_logic_vector(3 downto 0);
    outDisplay: out std_logic_vector(6 downto 0));
end topconvbcd00;

architecture topconvbcd0 of topconvbcd00 is
signal sAC8b: std_logic_vector(7 downto 0);
signal sout, sAC12a, sAC12b: std_logic_vector(11 downto 0);
signal sFlag12Inst: std_logic;
signal soutU, soutD, soutC: std_logic_vector(6 downto 0);
begin

  U00: topdiv00 port map(outdiv0 => clk0,
                         indiv0 => cdiv0); 

  U01: init00 port map(clkinit => sclk0,
                       codopinit => outcodeport,
                       inFlag8init => soutFlagrom,
                       outACA8init => sAC8b,
                       outACA12init =>sAC12b,
                       outFlag12init => sFlag12Inst,
                       outFlag8init => sFlagInst);

  U02: portA00 port map(clkLp => sclk0,
                         codopLp => outcodeport,
                         portALp => inport8a0,
                         ACLpA => sAC8b,
                         inFlagLp => soutFlagrom,
                         outFlagLp => sFlagInst);

  U03: pcinc00 port map(clkpc => sclk0,
                        resetpc => reset0,
                        incode => outcodeport,
                        outpc => outpcport,
                        inFlagAC8bit => sFlag8out,
                        inFlagAC12bit => sFlag12out,
                        flagiter => soutFlagIt,
                        outFlagpc => soutFlagpc);

  U04: ac8bit00 port map(clkac8 => sclk0,
                        inac8 => sAC8b,
                        outac8 => outport8a0,
                        inFlagac8Inst => sFlagInst,
                        outFlagac8 => sFlag8out);

   U05: leeInst00 port map(
                         inFlagInstrom => soutFlagpc,
                         outFlagrom => soutFlagrom,
                         inPCrom => outpcport,
                         outcode => outcodeport);

   U06: shift8bit00 port map(clks => sclk0,
                             codops => outcodeport,
                             inACs => outport8a0,
                             inFlags => soutFlagrom,
                             outACs => sAC8b,
                             outFlags => sFlagInst);

   U07: ac12bit00 port map (clkac12 => sclk0,
                            inac12 => sAC12b,
                            outac12 => sAC12a,
                            inFlagac12Inst => sFlag12Inst,
                            outFlagac12 => sFlag12out);

   U08: sust00 port map(clksu => sclk0,
                        codopsu => outcodeport,
                        inAC8bitsu => outport8a0,
                        inAC12bitsu => sAC12a,
                        inFlagAC12su => soutFlagrom,
                        outAC12bitsu => sAC12b,
                        outsust => outport120,
                	    outFlagsuB => sFlag12B,
                        outFlagsu => sFlag12Inst);

   U09: compadd00 port map (clkca => sclk0,
                           codopca => outcodeport,
                           inBuf12ca => sAC12a,
                           inFlagUCca => soutFlagrom,
                           outFlagca => sFlag12Inst,
                           outBuf12ca => sAC12b);

   U10: shift12bit00 port map(clkss => sclk0,
                            codopss => outcodeport,
                            inACss => sAC12a,
                            inFlagss => soutFlagrom,
                            outACss => sAC12b,
                            outFlagss => sFlag12Inst);


   U11: contiter00 port map(clkit => sclk0,
                           resetIt => reset0,
                           inFlagIt => sFlag12B,
                           outFlagIt => soutFlagIt);

   U12: coderNibbles00 port map(AC12bit03 => outport120,
                                outU => soutU,
                                outD => soutD,
                                outC => soutC);

   U13: contring00 port map(clkr => clk0,
                            resetr => reset0,
                            outr => outTransist0);

   U14: divint00 port map(clkd => clk0,
                       resetd => reset1,
                       outd => sclk0);

   U15: mux00 port map(selmux => outTransist0,
                       intBCDU=> soutU,
                       intBCDD=> soutD,
                       intBCDC=> soutC,
					   neg => inneg,
                       outBCDmux => outDisplay);
end topconvbcd0;
