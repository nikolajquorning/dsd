library ieee;
use ieee.std_logic_1164.all;

entity lookuptable is
	port (
		a, b, c  : in  std_logic;
		x        : out std_logic
	);
end lookuptable;

architecture arc of lookuptable is
	signal s1 : std_logic_vector(2 downto 0);
	begin
		s1 <= (a,b,c);
		with s1 select
		x <= '1' when "000",
			  '1' when "001",
			  '0' when "010",
			  '1' when "011",
			  '0' when "100",
			  '-' when "101",
			  '-' when "110",
			  '1' when "111",
			  '-' when others; --DEFAULT CASE
end arc;
