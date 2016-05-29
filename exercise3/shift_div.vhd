library ieee;
use ieee.std_logic_1164.all;

entity shift_div is
  port (
    a                   : in std_logic_vector(7 downto 0);
    a_shl, a_shr, a_ror : out std_logic_vector(7 downto 0)
  );
end shift_div;

architecture shift of shift_div is
begin
  a_shl <= a(6 downto 0) & "0";
  a_shr <= "00" & a(7 downto 2);
  a_ror <= a(2 downto 0) & a(7 downto 3);
end shift;