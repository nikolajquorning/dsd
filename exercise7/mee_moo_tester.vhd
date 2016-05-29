library ieee;
use ieee.std_logic_1164.all;

entity mee_moo_tester is
  port (
    key  : in  std_logic_vector(1 downto 0);
    sw   : in  std_logic_vector(1 downto 0);
    ledr : out std_logic_vector(1 downto 0)
  );
end mee_moo_tester;

architecture testing of mee_moo_tester is
begin
  fsm: entity work.mee_moo
    port map (
      clk     => key(0),
      reset   => key(1),
      a       => sw(0),
      b       => sw(1),
      moo_out => ledr(0),
      mee_out => ledr(1)
    );
end testing;