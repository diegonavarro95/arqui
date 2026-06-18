--ARQUITECTURA DE COMPUTADORAS

--PRACTICA 03: key00B: Captura key00 corregido

--Profesor: CASTILLO CABRERA GELACIO

--Autor: ENRIQUE ADRIAN ALVAREZ LUIS

--Grupo: 3CM11

library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagekey00 is
	component osc00
		port(
		cdiv: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic);
	end component;
	
	component contring00
		port(
		clkr:in std_logic;
		enr:in std_logic;
		outr:out std_logic_vector(3 downto 0));
	end component;
	
	component coder00
		port(
			clkc:in std_logic;
			enc: in std_logic;
			inkeyc:in std_logic_vector(3 downto 0);
			incontc:in std_logic_vector(3 downto 0);
			wordc:out std_logic_vector(6 downto 0));
	end component;
end packagekey00;
