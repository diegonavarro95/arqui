--ARQUITECTURA DE COMPUTADORAS

--PRACTICA 03: key00B: Captura key00 corregido

--Profesor: CASTILLO CABRERA GELACIO

--Autor: ENRIQUE ADRIAN ALVAREZ LUIS

--Grupo: 3CM11

library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
	port(
		clkr:in std_logic;
		enr:in std_logic;
		outr:out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal scr:std_logic_vector(3 downto 0);
begin
	pring:process(clkr)
	begin
		if(clkr'event and clkr='1')then
			case enr is
				when '0'=>
					outr<=(others=>'0');
					scr<="1000";
				when '1'=>
					scr(3)<=scr(0);
					scr(2 downto 0)<=scr(3 downto 1);
					outr<=scr;
				when others=>null;
			end case;
		end if;
	end process pring;
end contring0;
