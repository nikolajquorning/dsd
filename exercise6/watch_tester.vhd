library ieee;
use ieee.std_logic_1164.all;

entity watch_tester is
  port (
    clock_50 : in std_logic;
    key      : in std_logic_vector(3 downto 0);
    hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0)
  );
end watch_tester;

architecture testing of watch_tester is
begin
  watch: entity work.watch
    port map (
      clk    => clock_50,
      speed  => key(0),
      reset  => key(3),
      sec_1  => hex2,
      sec_10 => hex3,
      min_1  => hex4,
      min_10 => hex5,
      hrs_1  => hex6,
      hrs_10 => hex7,
      dsd_time => open 
    );
end testing;