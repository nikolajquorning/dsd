library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder_simple is
	port 
	(
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		sum : out std_logic_vector(3 downto 0)
	);
end entity;

architecture unsigned_impl of four_bit_adder_simple is
	signal x, y: unsigned(3 downto 0);
begin
	x <= unsigned(a);
	y <= unsigned(b);
	sum <= std_logic_vector(x + y);
end unsigned_impl;

architecture signed_impl of four_bit_adder_simple is

begin
		
end signed_impl