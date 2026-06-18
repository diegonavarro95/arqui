library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
		port(
			clkc:in std_logic;
			enc: in std_logic;
			inkeyc:in std_logic_vector(3 downto 0);
			incontc:in std_logic_vector(3 downto 0);
			wordc:out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
begin
	pcoder:process(clkc)
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	variable aux4: bit:='0';
	variable aux5: bit:='0';
	variable aux6: bit:='0';
	variable aux7: bit:='0';
	variable aux8: bit:='0';
	begin
		if(clkc'event and clkc='1')then
		case enc is
		when '0' =>
			wordc <= (others => '0');
			aux1:='0';
			aux2:='0';
			aux3:='0';
			aux4:='0';
			aux5:='0';
			aux6:='0';
			aux7:='0';
			aux8:='0';
		when '1' =>
			case incontc is
				when "1000" =>
					case inkeyc is
						when "0000"=>
							aux1:='0';
							aux5:='0';
							aux6:='0';
							aux7:='0';
							aux8:='0';							
						when "0001"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux1:='1';
								aux5:='1';
								wordc<="0110000";--1
							end if;
--------------------------------------------------------									
						when "0010"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux1:='1';
								aux6:='1';
								wordc<="1101101";--2
							end if;
----------------------------------------------------
						when "0100"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux1:='1';
								aux7:='1';
								wordc<="1111001";--3
							end if;
-----------------------------------------------------
						when "1000"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux1:='1';
								aux8:='1';
								wordc<="1110111";--A
							end if;

						when others=>null;
				end case;
--*******************************************************
				when "0100" =>
					case inkeyc is
						when "0000"=>
							aux2:='0';
							aux5:='0';
							aux6:='0';
							aux7:='0';
							aux8:='0';							
						when "0001"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux2:='1';
								aux5:='1';
								wordc<="0110011";--4
							end if;
--------------------------------------------------------									
						when "0010"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux2:='1';
								aux6:='1';
								wordc<="1011011";--5
							end if;
----------------------------------------------------
						when "0100"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux2:='1';
								aux7:='1';
								wordc<="1011111";--6
							end if;
-----------------------------------------------------
						when "1000"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux2:='1';
								aux8:='1';
								wordc<="0011111";--b
							end if;
						when others=>null;
					end case;
--*********************************************************
				when "0010" =>
					case inkeyc is
						when "0000"=>
							aux3:='0';
							aux5:='0';
							aux6:='0';
							aux7:='0';
							aux8:='0';							
						when "0001"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux3:='1';
								aux5:='1';
								wordc<="1110000";--7									
							end if;
--------------------------------------------------------									
						when "0010"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux3:='1';
								aux6:='1';
								wordc<="1111111";--8
							end if;
----------------------------------------------------
						when "0100"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux3:='1';
								aux7:='1';
								wordc<="1110011";--9
							end if;
-----------------------------------------------------
						when "1000"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux3:='1';
								aux8:='1';
								wordc<="1001110";--C
							end if;
						when others=>null;
					end case;
--*********************************************************
				when "0001" =>
					case inkeyc is
						when "0000"=>
							aux4:='0';
							aux5:='0';
							aux6:='0';
							aux7:='0';
							aux8:='0';							
						when "0001"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux4:='1';
								aux5:='1';
								wordc<="1100011";--*
							end if;
--------------------------------------------------------									
						when "0010"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux4:='1';
								aux6:='1';
								wordc<="1111110";--0
							end if;
----------------------------------------------------
						when "0100"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux4:='1';
								aux7:='1';
								wordc<="0011101";--#
							end if;

-----------------------------------------------------
						when "1000"=>
							if(aux1='0' and aux2='0' and aux3='0' and aux4='0' and aux5='0' and aux6='0' and aux7='0' and aux8='0')then
								aux4:='1';
								aux8:='1';
								wordc<="0111101";---d
							end if;
						when others=>null;
					end case;
				when others =>null;
			end case;
			when others => null;
		end case;
		end if;
	end process pcoder;
end coder0;