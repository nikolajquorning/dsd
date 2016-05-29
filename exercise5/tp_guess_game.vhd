library ieee;
use ieee.std_logic_1164.all;

entity tp_guess_game is
  port (
    inputs : in  std_logic_vector(7 downto 0);
    player : in  std_logic;
    set    : in  std_logic;                    -- Set predefined value
    show   : in  std_logic;                    -- Show predefined value
    try    : in  std_logic;                    -- Evaluate guess
    hex1   : out std_logic_vector(6 downto 0); -- 7-seg ones
    hex10  : out std_logic_vector(6 downto 0); -- 7-seg tens
    hex_p  : out std_logic_vector(6 downto 0)  -- hex_p out
  ); 
end tp_guess_game;

architecture gaming of tp_guess_game is
signal out1, out2, in1, in2 : std_logic_vector(7 downto 0);
signal buttons1, buttons2   : std_logic_vector(2 downto 0);
signal hex1_1, hex1_2, hex10_1, hex10_2 : std_logic_vector(6 downto 0);
begin
  game1: entity work.guess_game
    port map (
      inputs => in1,
      set    => set,
      show   => show,
      try    => try,
      hex1   => hex1_1,
      hex10  => hex10_1
    );

  game2: entity work.guess_game
    port map (
      inputs => in2,
      set    => set,
      show   => show,
      try    => try,
      hex1   => hex1_2,
      hex10  => hex10_2
    );

  game_play: process(player, inputs)
  variable tmp1, tmp2, tmp3 : std_logic_vector(6 downto 0);
  variable in1_2, in2_2     : std_logic_vector(7 downto 0);
  begin		
    if (player = '0') then -- player 1 is playing
      in1_2 := inputs;
      tmp1 := hex1_1;
      tmp2 := hex10_1;
      tmp3 := "1111001";
    elsif (player = '1') then -- player 2 is playing
      in2_2 := inputs;
      tmp1 := hex1_2;
      tmp2 := hex10_2;
      tmp3 := "0100100";
    else
      in1_2 := in1_2;
      in2_2 := in2_2;
      tmp1 := tmp1;
      tmp2 := tmp2;
      tmp3 := tmp3;
    end if;

    in1   <= in1_2;
    in2   <= in2_2;
    hex1  <= tmp1;
    hex10 <= tmp2;
    hex_p <= tmp3;
  end process game_play;
end gaming;