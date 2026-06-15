library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity contIter00 is
port( 
	clkit: in std_logic ;
	resetIt: in std_logic ;
	inFlagIt: in std_logic ;
	outFlagIt: out std_logic ;
	contIterac: inout std_logic_vector ( 3 downto 0 ) );
end contIter00;

architecture contIter0 of contIter00 is
begin
  iterac: process(clkit, resetIt, inFlagIt)
     begin
        if (clkit'event and clkit = '1') then
           if (resetIt = '0') then
              contIterac <= "0000";
              outFlagIt <= '0';
           else
              if (inFlagIt = '1' and contIterac < "1000") then
                  contIterac <= contIterac + 1;
              elsif (contIterac = "1000" or contIterac > "1000") then
                  contIterac <= contIterac + 0;
                  outFlagIt <= '1';
              end if;
           end if;
        end if;
     end process iterac;
end contIter0;
