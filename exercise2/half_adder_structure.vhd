library ieee;
use ieee.std_logic_1164.all;

entity half_adder_structure is
	port (
		a, b 				: in std_logic;
		sum, carry_out : out std_logic
	);
end half_adder_structure;

architecture structure of half_adder_structure is
begin
	u1: entity work.xor_2
	port map (
		i1 => a,
		i2 => b,
		o1 => sum
	);
	
	u2: entity work.and_2 
	port map (
		i1 => a, 
		i2 => b, 
		o1 => carry_out
	);
end structure;