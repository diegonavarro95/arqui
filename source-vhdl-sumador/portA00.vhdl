library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity portA00 is
port( 
	clkLp: in std_logic;
	codopLp: in std_logic_vector( 3 downto 0 );
	portALp: in std_logic_vector( 7 downto 0 );
	ACLpA: out std_logic_vector( 7 downto 0 );
	inFlagLp: in std_logic;
	outFlagLp: out std_logic);
end portA00;

architecture portA0 of portA00 is
begin
  readport: process(clkLp, codopLp, portALp, inFlagLp)
    begin
      if (clkLp'event and clkLp = '1') then
         if (codopLp = "0001") then
              if (inFlagLp = '1') then
                 ACLpA <= portALp;
                 outFlagLp <= '1';
              elsif (inFlagLp = '0') then
                 outFlagLp <= '0';
              end if;
          else
              ACLpA <= (others => 'Z');
              outFlagLp <= 'Z';
        end if;
      end if;
    end process readport;
end portA0;
