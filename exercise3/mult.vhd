library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
	port
	(
		A, B : in  std_logic_vector(7 downto 0);
		PROD : out std_logic_vector(15 downto 0)
	);
end mult;

architecture dataflow of mult is
signal s1, s2  : unsigned(7 downto 0);
begin
	s1 <= unsigned(A);
	s2 <= unsigned(B);
	PROD <= std_logic_vector(s1*s2);
end dataflow;
