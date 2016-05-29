library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tester is
  port (
    SW   : in std_logic_vector(2 downto 0);
    LEDR : out std_logic_vector(1 downto 0)
  );
end full_adder_tester;

architecture struc of full_adder_tester is
begin 
  i1: entity work.full_adder
    port map (
      a         => SW(0), 
      b         => SW(1), 
      carry_in  => SW(2),
      sum       => LEDR(0), 
      carry_out => LEDR(1)
    );
end struc;