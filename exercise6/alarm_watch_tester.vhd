library ieee;
use ieee.std_logic_1164.all;

entity alarm_watch_tester is
  port (
    clock_50 : in  std_logic;
    key      : in  std_logic_vector(3 downto 0);
    sw       : in  std_logic_vector(15 downto 0);
    ledr     : out std_logic_vector(0 downto 0);
    hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0)
  );
end alarm_watch_tester;

architecture testing of alarm_watch_tester is
begin
  watch: entity work.alarm_watch
    port map (
      key       => key,
      bin_min1  => sw(3 downto 0),
      bin_min10 => sw(7 downto 4),
      bin_hrs1  => sw(11 downto 8),
      bin_hrs10 => sw(15 downto 12),
      clock_50  => clock_50,
      hex2      => hex2,
      hex3      => hex3,
      hex4      => hex4,
      hex5      => hex5,
      hex6      => hex6,
      hex7      => hex7,
      alarm     => ledr(0)
    );
end testing;