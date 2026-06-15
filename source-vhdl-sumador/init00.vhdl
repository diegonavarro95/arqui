library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity init00 is
port( 
	clkinit: in std_logic;
	codopinit: in std_logic_vector( 3 downto 0 );
	inFlag8init: in std_logic ;
	outACA8init: out std_logic_vector( 7 downto 0 );
	outACA12init: out std_logic_vector( 11 downto 0 );
	outFlag12init: out std_logic ;
	outFlag8init: out std_logic);
end init00;

architecture init0 of init00 is
begin
  initp: process(clkinit, codopinit, inFlag8init)
   variable aux0: bit:= '0';
   variable aux1: bit:= '0';
    begin
      if (clkinit'event and clkinit = '1') then
         if (codopinit = "0000") then
             if (inFlag8init = '0') then
                   if (aux0 = '0') then
                      aux0 := '1';
                      outFlag8init <= '1';
                      outFlag12init <= '1';
                      outACA8init <= "00111100";
                      outACA12init <= "000000000000";
                   else
                      outFlag8init <= '0';
                      outFlag12init <= '0';
                   end if;
             elsif (inFlag8init = '1') then
                   if (aux1 = '0') then
                       aux1 := '1';
                       outACA8init <= "00001111";
                       outACA12init <= "000000000000";
                       outFlag8init <= '1';
                       outFlag12init <= '1';
                   else
                      outFlag8init <= '0';
                      outFlag12init <= '0';
                   end if;
             end if;
         else
             outACA8init <= (others => 'Z');
             outACA12init <= (others => 'Z');
             outFlag8init <= 'Z';
             outFlag12init <= 'Z';
             aux0 := '0';
             aux1 := '0';
        end if;
      end if;
    end process initp;
end init0;
