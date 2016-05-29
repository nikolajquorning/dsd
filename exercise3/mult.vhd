library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
  port (
    a, b : in  std_logic_vector(7 downto 0);
    prod : out std_logic_vector(15 downto 0)
  );
end mult;

architecture dataflow of mult is
signal s1, s2 : unsigned(7 downto 0);
begin
  s1   <= unsigned(a);
  s2   <= unsigned(b);
  prod <= std_logic_vector(s1*s2);
end dataflow;