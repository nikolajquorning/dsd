library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder is
  port (
    carry_in  : in std_logic;
    a, b      : in std_logic_vector(3 downto 0);
    sum_out   : out std_logic_vector(3 downto 0);
    carry_out : out std_logic
  );
end four_bit_adder;

architecture struc of four_bit_adder is
signal s1, s2, s3 : std_logic;
begin
  fa0: entity work.full_adder
    port map (
      -- INPUTS
      a        => A(0),
      b        => B(0),
      carry_in => carry_in,
      -- OUTPUTS
      sum       => sum_out(0),
      carry_out => s1
    );

  fa1: entity work.full_adder
    port map (
      -- INPUTS
      a        => A(1),
      b        => B(1),
      carry_in => s1,
      -- OUTPUTS
      sum       => sum_out(1),
      carry_out => s2
    );

  fa2: entity work.full_adder
    port map (
      -- INPUTS
      a        => A(2),
      b        => B(2),
      carry_in => s2,
      -- OUTPUTS
      sum       => sum_out(2),
      carry_out => s3
    );

  fa3: entity work.full_adder
    port map (
      -- INPUTS
      a        => A(3),
      b        => B(3),
      carry_in => s3,
      -- OUTPUTS
      sum       => sum_out(3),
      carry_out => carry_out
    );
end struc;