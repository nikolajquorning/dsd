library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder_tester is
  port (
    SW   : in  std_logic_vector(8 downto 0);
    LEDR : out std_logic_vector(4 downto 0)
  );
end four_bit_adder_tester;

architecture struc of four_bit_adder_tester is
begin
  i1: entity work.four_bit_adder
    port map (
      -- INPUTS
      carry_in => SW(0),
      a(0) => SW(1),
      a(1) => SW(2),
      a(2) => SW(3),
      a(3) => SW(4),
      b(0) => SW(5),
      b(1) => SW(6),
      b(2) => SW(7),
      b(3) => SW(8),

	  -- OUTPUTS
      sum_out(0) => LEDR(0), 
      sum_out(1) => LEDR(1), 
      sum_out(2) => LEDR(2), 
      sum_out(3) => LEDR(3), 
      carry_out  => LEDR(4)
  );
end struc;	