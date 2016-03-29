library ieee;
use ieee.std_logic_1164.all;

entity shift_div_tester is
	port (
		sw   : in  std_logic_vector(7 downto 0);
		ledr : out std_logic_vector(17 downto 0);
		ledg : out std_logic_vector(7 downto 0)
	);
end shift_div_tester;

architecture tester of shift_div_tester is
begin
	i1: entity work.shift_div
	port map (
		a => sw(7 downto 0),
		a_shl => ledr(17 downto 10),
		a_shr => ledr(7 downto 0),
		a_ror => ledg(7 downto 0)
	);
end tester;