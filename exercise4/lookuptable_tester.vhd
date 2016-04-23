library ieee;
use ieee.std_logic_1164.all;

entity lookuptable_tester is
	port (
		SW   : in  std_logic_vector(2 downto 0);
		LEDR : out std_logic_vector(0 downto 0)
	);
end lookuptable_tester;

architecture testing of lookuptable_tester is
	begin
	l0: entity work.lookuptable
		port map (
			c => SW(0),
			b => SW(1),
			a => SW(2),
			x => LEDR(0)
		);
end testing;
