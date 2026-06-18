--ARQUITECTURA DE COMPUTADORAS

--PRACTICA 03: key00B: Captura key00 corregido

--Profesor: CASTILLO CABRERA GELACIO

--Autor: ENRIQUE ADRIAN ALVAREZ LUIS

--Grupo: 3CM11

library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageosc00 is
	component oscint00
		port(osc_int: out std_logic);
	end component;
	
	component div00 is
		port(
		clkdiv: in std_logic;
		indiv: in std_logic_vector(4 downto 0);
		oscout: inout std_logic);
	end component;
end packageosc00;