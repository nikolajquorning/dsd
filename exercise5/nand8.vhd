library ieee;
use ieee.std_logic_1164.all;

entity nand8 is
	port (
		a : in  std_logic_vector(7 downto 0);
		y : out std_logic
	);
end nand8;

architecture iterate of nand8 is
begin
	po: process (a) 
		variable temp : std_logic; 
		begin
			temp := '0';
			for index in 7 downto 0 loop
				temp := temp nand a(index);
			end loop;
			y <= temp;
	end process po;
end iterate;