library ieee;
use ieee.std_logic_1164.all;

entity guess_game is
	port(
		inputs : in  std_logic_vector(7 downto 0);
		set    : in  std_logic; 								-- Set predefined value
		show   : in  std_logic; 								-- Show predefined value
		try    : in  std_logic; 								-- Evaluate guess
		hex1   : out std_logic_vector(6 downto 0);	-- 7-seg ones
		hex10  : out std_logic_vector(6 downto 0)		-- 7-seg tens
	); 
end guess_game;

architecture gaming of guess_game is
	signal buttons      : std_logic_vector(2 downto 0);
	signal output       : std_logic_vector(7 downto 0);
	signal secret_value : std_logic_vector(7 downto 0);
	begin
		ent1: entity work.bin2hex
			port map (
				bin (3 downto 0) => output(3 downto 0),
				Sseg(6 downto 0) => hex1  (6 downto 0)
			);
		ent2: entity work.bin2hex
			port map (
				bin (3 downto 0) => output(7 downto 4),
				Sseg(6 downto 0) => hex10 (6 downto 0)
			);
		
		buttons <= (set, show, try);
		
		game_play: process(buttons, secret_value, inputs)
			begin			
				output <= inputs;
				secret_value <= "00000001";
				case(buttons) is
					when "110" => --try pressed
						null;
					when "101" => --show pressed
						output <= secret_value;
					when "001" => --set pressed
						secret_value <= inputs;
					when others =>
						null;
				end case;
		end process game_play;
end gaming;