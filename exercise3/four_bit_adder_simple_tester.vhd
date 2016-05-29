library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder_simple_tester is
  port (
    sw   : in  std_logic_vector(8 downto 1);
    ledr : out std_logic_vector(3 downto 0)
  );
end four_bit_adder_simple_tester;

architecture tester of four_bit_adder_simple_tester is
begin
  i1: entity work.four_bit_adder_simple(signed_impl)
    port map (
      a   => sw(4 downto 1),
      b   => sw(8 downto 5),
      sum => ledr(3 downto 0)
    );
end tester;