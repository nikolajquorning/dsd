library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder_carry is
	port 
	(
		cin	: in std_logic;
		a	   : in std_logic_vector(3 downto 0);
		b	   : in std_logic_vector(3 downto 0);
		sum 	: buffer std_logic_vector(3 downto 0);
		cout	: out std_logic
	);
end four_bit_adder_carry;

architecture unsigned_carry_impl of four_bit_adder_carry is
	signal x, y: unsigned(4 downto 0);
	signal z, res:	 std_logic_vector(4 downto 0);
begin
	x <= resize(unsigned(a), 5);
	y <= resize(unsigned(b), 5);
	z <= "0000"&cin;
	res <= std_logic_vector(x + y + unsigned(z));
	sum <= res(3 downto 0);
	cout <= res(4);
end unsigned_carry_impl;

architecture signed_carry_impl of four_bit_adder_carry is
	signal x, y: signed(4 downto 0);
	signal res, z:	 std_logic_vector(4 downto 0);
begin
	x <= resize(signed(a), 5);
	y <= resize(signed(b), 5);
	z <= "0000"&cin;
	res <= std_logic_vector(x + y + signed(z));
	sum <= res(3 downto 0);
	cout <= res(4);
end signed_carry_impl;