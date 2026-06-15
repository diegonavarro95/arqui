library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity mux00 is
port( 
	selmux: in std_logic_vector ( 3 downto 0 );
	intBCDU: in std_logic_vector ( 6 downto 0 );
	intBCDD: in std_logic_vector ( 6 downto 0 );
	intBCDC: in std_logic_vector ( 6 downto 0 );
    neg: in std_logic;
	outBCDmux: out std_logic_vector ( 6 downto 0 ) );
end mux00;

architecture mux0 of mux00 is
begin
  -- 1. Se agregan todas las entradas leídas a la lista de sensibilidad
  muxp: process(selmux, intBCDU, intBCDD, intBCDC, neg)
    begin
       case selmux is
         when "0001" =>
           outBCDmux <= intBCDU;
         when "0010" =>
           outBCDmux <= intBCDD;
         when "0100" =>
           outBCDmux <= intBCDC;
         when "1000" =>
           if(neg = '1') then
              outBCDmux <= "0000001";
            else
              outBCDmux <= "0000000";
            end if;
         when others =>
           -- 2. Se asigna un estado lógico seguro en lugar de 'null'
           -- Esto evita la inferencia de latches.
           -- (Si tu display es de ánodo común y se apaga con '1', usa "1111111")
           outBCDmux <= "0000000"; 
       end case; 
    end process muxp;
end mux0;