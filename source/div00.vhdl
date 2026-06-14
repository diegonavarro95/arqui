library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity div00 is
  port(
       clkdiv: in std_logic;
	   indiv: in std_logic_vector(5 downto 0);
       outdiv: inout std_logic);
end div00;

architecture div0 of div00 is
signal sdiv: std_logic_vector(21 downto 0);
begin
	pdiv: process(clkdiv)
	begin
		if(clkdiv'event and clkdiv = '1') then
			case indiv is
			--------------------------------------------------
				when "000000" => 
					if(sdiv > "1000000000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when "000001" => 
					if(sdiv > "0100000000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when "000011" => 
					if(sdiv > "0010000000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when "000111" => 
					if(sdiv > "0001000000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when "001111" => 
						if(sdiv > "0000100000000000000000")then
							outdiv <= not(outdiv);
							sdiv <= (others => '0');
						else
							sdiv <= sdiv + '1';
							outdiv <= outdiv;
						end if;
			-------------------------------------------------
				when "011111" => 
					if(sdiv > "0000010000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
			when "111111" => 
					if(sdiv > "0000001000000000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
			when "111110" => 
					if(sdiv > "0000000000100000000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when "111100" => 
					if(sdiv > "0000000000000010000000")then
						outdiv <= not(outdiv);
						sdiv <= (others => '0');
					else
						sdiv <= sdiv + '1';
						outdiv <= outdiv;
					end if;
			-------------------------------------------------
				when others => null; 
			end case;
		end if;
	end process;
end div0;