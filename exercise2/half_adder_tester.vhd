library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tester is
	port (
		SW   : in  std_logic_vector(1 downto 0);
		LEDR : out std_logic_vector(1 downto 0)
	);
end half_adder_tester;

architecture struc of half_adder_tester is
begin 
	i1: entity work.half_adder_dataflow -- _structure | _dataflow | _behavior
	port map (
		a   => SW(0), 
		b   => SW(1), 
		sum       => LEDR(0), 
		carry_out => LEDR(1)
	);
end struc;