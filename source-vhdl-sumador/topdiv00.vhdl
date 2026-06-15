library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packagediv00.all;

entity topdiv00 is
  port(
       indiv0: in std_logic_vector(5 downto 0);
       outdiv0: inout std_logic);
end topdiv00;

architecture topdiv0 of topdiv00 is
signal sclk: std_logic;
begin

  UD00: osc00 port map(osc_int => sclk);
  
  UD01: div00 port map(clkdiv => sclk,
                       indiv => indiv0,
                       outdiv => outdiv0);

end topdiv0;