library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ac12bit00 is

port( 
	clkac12: in std_logic ;
	inac12: in std_logic_vector ( 11 downto 0 );
	outac12: out std_logic_vector ( 11 downto 0 );
	inFlagac12Inst: in std_logic ;
	outFlagac12: out std_logic  );

end ac12bit00;

architecture ac12bit0 of ac12bit00 is
begin
  ac12p: process(clkac12, inac12, inFlagac12Inst)
    variable aux: bit:= '0';
    begin
       if (clkac12'event and clkac12 = '1') then
          if (inFlagac12Inst = '1') then
             if (aux = '0') then
                aux := '1';
                outac12 <= inac12;
             end if;
             outFlagac12 <= '1';
          else
              outFlagac12 <= '0';
              aux := '0';
          end if;
       end if; 
    end process ac12p;
end ac12bit0;
