library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tester is
	port
	(
		SW : in  std_logic_vector(15 downto 0);
		LEDR : out std_logic_vector(15 downto 0)
	);
end multiplier_tester;

architecture multtest of multiplier_tester is
begin
	i2: entity work.mult
	port map
	(
		A => SW(7 downto 0),
		B => SW(15 downto 8),
		PROD => LEDR(15 downto 0)
	);
end multtest;
