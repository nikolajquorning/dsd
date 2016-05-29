library ieee;
use ieee.std_logic_1164.all;

entity count_ones_tester is
  port (
    sw   : in  std_logic_vector(7 downto 0);
    hex0 : out std_logic_vector(6 downto 0)
  );
end count_ones_tester;

architecture testing of count_ones_tester is
signal temp : std_logic_vector(3 downto 0);
begin
  c0: entity work.count_ones
    port map (
      a    => sw,
      ones => temp
    );

  h0: entity work.bin2hex
    port map (
      bin  => temp,
      Sseg => hex0
  );
end testing;