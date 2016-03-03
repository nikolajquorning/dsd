library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder_carry_tester is
	port 
	(
		sw		:	in		std_logic_vector(8 downto 0);
		ledr	:	out	std_logic_vector(4 downto 0)
	);
end four_bit_adder_carry_tester;

architecture tester2 of four_bit_adder_carry_tester is
begin
	i1: entity work.four_bit_adder_carry(unsigned_carry_impl)
	port map
	(
	cin => sw(0),
	a => sw(4 downto 1),
	b => sw(8 downto 5),
	sum => ledr(3 downto 0),
	cout => ledr(4)
	);
end tester2;
