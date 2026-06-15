library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

package packagep00 is

  component topdiv00
    port(
       indiv0: in std_logic_vector(5 downto 0);
       outdiv0: inout std_logic);
  end component;

  component init00
    port( 
	  clkinit: in std_logic ;
	  codopinit: in std_logic_vector ( 3 downto 0 );
	  inFlag8init: in std_logic ;
      --inFlagreset: in std_logic;
	  outACA8init: out std_logic_vector ( 7 downto 0 );
	  outACA12init: out std_logic_vector ( 11 downto 0 );
	  outFlag12init: out std_logic ;
	  outFlag8init: out std_logic  );
    end component;

  component portA00
    port( 
	  clkLp: in std_logic ;
	  codopLp: in std_logic_vector ( 3 downto 0 );
	  portALp: in std_logic_vector ( 7 downto 0 );
	  ACLpA: out std_logic_vector ( 7 downto 0 );
	  inFlagLp: in std_logic ;
	  outFlagLp: out std_logic );
    end component;

  component ac8bit00
    port(
      clkac8: in std_logic;
	  inac8: in std_logic_vector ( 7 downto 0 );
	  outac8: out std_logic_vector ( 7 downto 0 );
	  inFlagac8Inst: in std_logic ;
	  outFlagac8: out std_logic  );
    end component;

  component pcinc00
    port( 
	  clkpc: in std_logic ;
	  resetpc: in std_logic ;
      --outFlagreset: in std_logic;
	  incode: in std_logic_vector ( 3 downto 0 );
	  outpc: inout std_logic_vector ( 3 downto 0 );
	  inFlagAC8bit: in std_logic ;
      inFlagAC12bit: in std_logic;
      flagiter: in std_logic;
	  outFlagpc: out std_logic  );
    end component;

  component leeInst00
    port( 
	 inFlagInstrom: in std_logic ;
	 outFlagrom: out std_logic ;
	 inPCrom: in std_logic_vector ( 3 downto 0 );
	 outcode: out std_logic_vector ( 3 downto 0 ));
    end component;

  component shift8bit00
    port( 
	  clks: in std_logic ;
	  codops: in std_logic_vector ( 3 downto 0 );
	  inACs: in std_logic_vector ( 7 downto 0 );
	  inFlags: in std_logic ;
	  outACs: out std_logic_vector ( 7 downto 0 );
	  outFlags: out std_logic  );
   end component;

  component ac12bit00
    port(
      clkac12: in std_logic;
	  inac12: in std_logic_vector ( 11 downto 0 );
	  outac12: out std_logic_vector ( 11 downto 0 );
	  inFlagac12Inst: in std_logic ;
	  outFlagac12: out std_logic  );
   end component;

  component sust00
    port( 
	  clksu: in std_logic ;
	  codopsu: in std_logic_vector ( 3 downto 0 );
	  inAC8bitsu: in std_logic_vector ( 7 downto 0 );
	  inAC12bitsu: in std_logic_vector ( 11 downto 0 );
	  inFlagAC12su: in std_logic ;
	  outAC12bitsu: out std_logic_vector ( 11 downto 0 );
	  outsust: out std_logic_vector ( 11 downto 0 );
	  outFlagsuB: out std_logic;
	  outFlagsu: out std_logic  );
   end component;

  component compadd00
   port( 
	 clkca: in std_logic ;
	 codopca: in std_logic_vector ( 3 downto 0 );
	 inBuf12ca: in std_logic_vector ( 11 downto 0 );
	 inFlagUCca: in std_logic ;
	 outFlagca: out std_logic ;
	 outBuf12ca: out std_logic_vector ( 11 downto 0 ) );
  end component;

  component shift12bit00
  port( 
	clkss: in std_logic ;
	codopss: in std_logic_vector ( 3 downto 0 );
	inACss: in std_logic_vector ( 11 downto 0 );
	inFlagss: in std_logic ;
	outACss: inout std_logic_vector ( 11 downto 0 );
	outFlagss: out std_logic  );
  end component;

  component contiter00
    port( 
	  clkit: in std_logic ;
	  resetIt: in std_logic ;
	  inFlagIt: in std_logic ;
	  outFlagIt: out std_logic ;
	  contIterac: inout std_logic_vector(3 downto 0)  );
    end component;

  component codernibbles00
    port( 
	  AC12bit03: in std_logic_vector ( 11 downto 0 );
	  outU: out std_logic_vector ( 6 downto 0 );
	  outD: out std_logic_vector ( 6 downto 0 );
	  outC: out std_logic_vector ( 6 downto 0 ) );
    end component;

  component contring00
    port( 
	  clkr: in std_logic ;
	  resetr: in std_logic ;
	  outr: out std_logic_vector ( 3 downto 0 ) );
    end component;

  component divint00
    port( 
      clkd: in std_logic ;
      resetd: in std_logic;
	  outd: inout std_logic );
    end component;

  component mux00
    port( 
	  selmux: in std_logic_vector ( 3 downto 0 );
	  intBCDU: in std_logic_vector ( 6 downto 0 );
	  intBCDD: in std_logic_vector ( 6 downto 0 );
	  intBCDC: in std_logic_vector ( 6 downto 0 );
	  neg: in std_logic;
	  outBCDmux: out std_logic_vector ( 6 downto 0 ) );
    end component;

end packagep00;
