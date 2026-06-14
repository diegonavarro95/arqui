library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity divint00 is
port( 
     clkd: in std_logic ;
     resetd: in std_logic;
     outd: inout std_logic );
end divint00;

architecture divint0 of divint00 is
signal QR: std_logic_vector(3 downto 0);
begin
  div: process (clkd, resetd)
      begin
        case resetd is
          when '0' =>
             QR <= (others => '0');
             outd <= '0';
          when '1' =>
             if (clkd'event and clkd = '1') then
                QR<= QR + 1;
                   if QR = "1000" then
                      outd <= not(outd);
                      QR <= "0000";
                   end if;
             end if;
          when others => null;
        end case;
      end process div;
end divint0;
