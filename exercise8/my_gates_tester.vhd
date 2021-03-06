library ieee;
use ieee.std_logic_1164.all;
use work.my_gates.all;

entity my_gates_tester is
  port (
    sw   : in  std_logic_vector(1 downto 0);
    ledr : out std_logic_vector(2 downto 0)
  );
end my_gates_tester;

architecture testing of my_gates_tester is
begin
  ledr(0) <= my_xor(sw(0),sw(1));
  my_and_or(sw(0), sw(1), ledr(1), ledr(2));
end testing;