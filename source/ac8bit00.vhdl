library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ac8bit00 is

port( 
	clkac8: in std_logic ;
	inac8: in std_logic_vector ( 7 downto 0 );
	outac8: out std_logic_vector ( 7 downto 0 );
	inFlagac8Inst: in std_logic ;
	outFlagac8: out std_logic  );

end ac8bit00;

architecture ac8bit0 of ac8bit00 is
begin
   ac8p: process(clkac8, inac8, inFlagac8Inst)
    variable aux: bit:= '0';
      begin
        if (clkac8'event and clkac8 = '1') then
          if (inFlagac8Inst = '1') then
                outac8 <= inac8;
             outFlagac8 <= '1';
          else
             outFlagac8 <= '0';
             aux := '0';
          end if;
      end if;
   end process ac8p;
end ac8bit0;
