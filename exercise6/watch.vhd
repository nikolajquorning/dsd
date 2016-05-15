library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity watch is
	port (
		clk, reset, speed : in std_logic;
		sec_1, sec_10     : out std_logic_vector(6 downto 0);
		min_1, min_10     : out std_logic_vector(6 downto 0);
		hrs_1, hrs_10     : out std_logic_vector(6 downto 0);
		dsd_time          : out std_logic_vector(15 downto 8)
	);
end watch;

architecture arc of watch is
signal reset_signal : std_logic;
signal clk_signal1, clk_signal2, clk_signal3, clk_signal4, clk_signal5, clk_signal6 : std_logic;
signal hex_signal1, hex_signal2, hex_signal3, hex_signal4, hex_signal5, hex_signal6 : std_logic_vector(3 downto 0);
begin
	clock_gen: entity work.clock_gen
		port map (
			clk     => clk,
			speed   => speed,
			reset   => reset_signal,
			clk_out => clk_signal1
		);
	
	reset_entity: entity work.reset_logic
		port map (
			reset_in  => reset,
			hrs_bin1  => hex_signal5,
			hrs_bin10 => hex_signal6,
			reset_out => reset_signal
		);
	
	-- SECONDS --
	
	second_ones: entity work.multi_counter
		port map (
			clk   => clk_signal1,
			mode  => "00",
			reset => reset_signal,
			count => hex_signal1,
			cout  => clk_signal2
		);
		
	sevenseg_second_ones: entity work.bin2sevenseg
		port map (
			bin  => hex_signal1,
			Sseg => sec_1
		);
		
	second_tens: entity work.multi_counter
		port map (
			clk   => clk_signal2,
			mode  => "01",
			reset => reset_signal,
			count => hex_signal2,
			cout  => clk_signal3
		);
		
	sevenseg_second_tens: entity work.bin2sevenseg
		port map (
			bin  => hex_signal2,
			Sseg => sec_10
		);
	
	-- MINUTES --
	
	minute_ones: entity work.multi_counter
		port map (
			clk   => clk_signal3,
			mode  => "00",
			reset => reset_signal,
			count => hex_signal3,
			cout  => clk_signal4
		);
		
	sevenseg_minute_ones: entity work.bin2sevenseg
		port map (
			bin  => hex_signal3,
			Sseg => min_1
		);
		
	minute_tens: entity work.multi_counter
		port map (
			clk   => clk_signal4,
			mode  => "01",
			reset => reset_signal,
			count => hex_signal4,
			cout  => clk_signal5
		);
		
	sevenseg_minute_tens: entity work.bin2sevenseg
		port map (
			bin  => hex_signal4,
			Sseg => min_10
		);
	
	-- HOURS --
	
	hour_ones: entity work.multi_counter
		port map (
			clk   => clk_signal5,
			mode  => "00",
			reset => reset_signal,
			count => hex_signal5,
			cout  => clk_signal6
		);
		
	sevenseg_hour_ones: entity work.bin2sevenseg
		port map (
			bin  => hex_signal5,
			Sseg => hrs_1
		);
	
	hour_tens: entity work.multi_counter
		port map (
			clk   => clk_signal6,
			mode  => "11",
			reset => reset_signal,
			count => hex_signal6
		);
		
	sevenseg_hour_tens: entity work.bin2sevenseg
		port map (
			bin  => hex_signal6,
			Sseg => hrs_10
		);
end arc;