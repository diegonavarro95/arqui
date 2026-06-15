library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nor00 is
	port(
		Ano: in std_logic;
		Bno: in std_logic;
		Yno: out std_logic);
end nor00;

architecture nor0 of nor00 is
begin
	Yno <= Ano nor Bno;
end nor0;