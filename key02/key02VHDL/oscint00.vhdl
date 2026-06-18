--ARQUITECTURA DE COMPUTADORAS

--PRACTICA 03: key00B: Captura key00 corregido

--Profesor: CASTILLO CABRERA GELACIO

--Autor: ENRIQUE ADRIAN ALVAREZ LUIS

--Grupo: 3CM11

library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity oscint00 is
	port(osc_int : out std_logic);
end oscint00;

architecture oscint0 of oscint00 is
	COMPONENT OSCH
		GENERIC (NOM_FREQ: string := "2.08");
			PORT (STDBY:in std_logic;
				  OSC:out std_logic);
END COMPONENT;
attribute NOM_FREQ : string;
attribute NOM_FREQ of OSCinst0 : label is "2.08";
begin
OSCInst0: OSCH
	GENERIC MAP ( NOM_FREQ => "2.08" )
		PORT MAP (	STDBY=> '0',
					OSC=> osc_int); 
end oscint0;