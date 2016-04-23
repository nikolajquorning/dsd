library ieee;
use ieee.std_logic_1164.all;

entity nand8_tester is
	port (
		SW    : in  std_logic_vector(7 downto 0);
		LEDR0 : out std_logic
	);
end nand8_tester;

architecture testing of nand8_tester is
	begin
	i0: entity work.nandeight
		port map (
			a(7 downto 0) => SW(7 downto 0),
			y => LEDR0
		);
end testing;
