library ieee;
use ieee.std_logic_1164.all;

entity multi_counter_tester is
  port (
    key  : in std_logic_vector(3 downto 0);
    sw   : in std_logic_vector(17 downto 16);
    hex0 : out std_logic_vector(6 downto 0);
    ledr : out std_logic_vector(0 downto 0)
  );
end multi_counter_tester;

architecture testing of multi_counter_tester is
signal counter_signal : std_logic_vector(3 downto 0);
begin
  counter: entity work.multi_counter
    port map (
      clk => key(0),
      mode(1 downto 0) => sw(17 downto 16),
      reset => key(3),
      count(3 downto 0) => counter_signal(3 downto 0),
      cout => ledr(0)
    );

  sevenseg: entity work.bin2sevenseg
    port map (
      bin(3 downto 0)  => counter_signal(3 downto 0),
      Sseg(6 downto 0) => hex0(6 downto 0)
    );
end testing;