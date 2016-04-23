library ieee;
use ieee.std_logic_1164.all;

entity guess_game is
	port(
		inputs : in  std_logic_vector(7 downto 0);
		set    : in  std_logic; 								-- Set predefined value
		show   : in  std_logic; 								-- Show predefined value
		try    : in  std_logic; 								-- Evaluate guess
		hex1   : out std_logic_vector(6 downto 0);		-- 7-seg ones
		hex10  : out std_logic_vector(6 downto 0)			-- 7-seg tens
	); 
end guess_game;
	
architecture gaming of guess_game is
	signal buttons        : std_logic_vector(2 downto 0);	
	signal outs           : std_logic_vector(7 downto 0);
	signal hexone, hextwo : std_logic_vector(6 downto 0);
	
	begin
		ent1: entity work.bin2hex
			port map (
				bin (3 downto 0) => outs(3 downto 0),
				Sseg(6 downto 0) => hexone(6 downto 0)
			);
		ent2: entity work.bin2hex
			port map (
				bin (3 downto 0) => outs(7 downto 4),
				Sseg(6 downto 0) => hextwo(6 downto 0)
			);
		
		buttons <= (try, show, set);
		
		game_play: process(buttons, inputs)
		variable secret_value : std_logic_vector(7 downto 0);
		variable output		 : std_logic_vector(7 downto 0);
			begin	
				output := inputs;
				secret_value := secret_value;
				hex1 <= hexone;
				hex10 <= hextwo;
				case(buttons) is
					when "011" => --try pressed
						if (inputs = secret_value) then     --you guessed it: display "--"
							hex10 <= "0111111";
							hex1  <= "0111111";
						elsif (inputs < secret_value) then  --you guessed too low: display "Lo"
							hex10 <= "1000111";
							hex1  <= "0100011";
						elsif (inputs > secret_value) then  --you guessed too high: display: "Hi"
							hex10 <= "0001001";
							hex1  <= "1111011";
						end if;
					when "101" => --show pressed
						output := secret_value;
					when "110" => --set pressed
						secret_value := inputs;
					when others =>
						null;
				end case;
			outs <= output;
		end process game_play;
end gaming;