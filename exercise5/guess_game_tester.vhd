library ieee;
use ieee.std_logic_1164.all;

entity guess_game_tester is
  port (
    sw   : in  std_logic_vector(7 downto 0);
    key  : in  std_logic_vector(2 downto 0);
    hex0 : out std_logic_vector(6 downto 0);
    hex1 : out std_logic_vector(6 downto 0)
  ); 
end guess_game_tester;

architecture testing of guess_game_tester is
begin
  ent1: entity work.guess_game
    port map (
      inputs => sw,
      set    => key(0),
      show   => key(1),
      try    => key(2),
      hex1   => hex0,
      hex10  => hex1
    );
end testing;