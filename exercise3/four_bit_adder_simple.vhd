library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder_simple is
  port (
    a,b : in     std_logic_vector(3 downto 0);
    sum : buffer std_logic_vector(3 downto 0)
  );
end four_bit_adder_simple;

architecture unsigned_impl of four_bit_adder_simple is
signal x, y, z: unsigned(3 downto 0);
begin
  x   <= unsigned(a);
  y   <= unsigned(b);
  sum <= std_logic_vector(x + y);
end unsigned_impl;

architecture signed_impl of four_bit_adder_simple is
signal xs, ys: signed(3 downto 0);
begin	
  xs  <= signed(a);
  ys  <= signed(b);
  sum <= std_logic_vector(xs + ys);
end signed_impl;