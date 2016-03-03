library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder_simple_tester is
	port 
	(
		sw		:	in		std_logic_vector(8 downto 1);
		ledr	:	out	std_logic_vector(3 downto 0)
	);
end four_bit_adder_simple_tester;

architecture tester of four_bit_adder_simple_tester is
begin
	i1: entity work.four_bit_adder_simple
	port map 
	(
	a(0) => sw(1),
	a(1) => sw(2),
	a(2) => sw(3),
	a(3) => sw(4),
	b(0) => sw(5),
	b(1) => sw(6),
	b(2) => sw(7),
	b(3) => sw(8),
	sum(0) => ledr(0),
	sum(1) => ledr(1),
	sum(2) => ledr(2),
	sum(3) => ledr(3)
	);
end tester;
