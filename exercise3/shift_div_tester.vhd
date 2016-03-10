library ieee;
use ieee.std_logic_1164.all;

entity shift_div_tester is
	port 
	(
		sw		:	in		std_logic_vector(7 downto 0);
		ledr	:	out	std_logic_vector(15 downto 0);
		ledg	:	out	std_logic_vector(7 downto 0)
	);
end shift_div_tester;

architecture tester3 of shift_div_tester is
begin
	i1: entity work.shift_div
	port map
	(
	a => sw(7 downto 0),
	a_shl => ledr(15 downto 8),
	a_shr => ledr(7 downto 0),
	a_ror => ledg(7 downto 0)
	);
end tester3;
