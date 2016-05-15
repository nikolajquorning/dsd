library ieee;
use ieee.std_logic_1164.all;

entity one_digit_clock_tester is
	port (
		clock_50 : in  std_logic;
		key      : in  std_logic_vector(3 downto 0);
		sw       : in  std_logic_vector(17 downto 16);
		hex0     : out std_logic_vector(6 downto 0);
		ledr     : out std_logic_vector(0 downto 0)
	);
end one_digit_clock_tester;

architecture testing of one_digit_clock_tester is
	signal counter_signal : std_logic_vector(3 downto 0);
	signal clk_signal     : std_logic;
	begin
	
	clock: entity work.clock_gen
		port map (
			clk     => clock_50,
			speed   => key(0),
			reset   => key(3),
			clk_out => clk_signal
		);
	
	counter: entity work.multi_counter
		port map (
			clk   => clk_signal,
			reset => key(3),
			cout  => ledr(0),
			mode(1 downto 0)  => sw(17 downto 16),
			count(3 downto 0) => counter_signal(3 downto 0)
		);
	
	sevenseg: entity work.bin2sevenseg
		port map (
			bin(3 downto 0)  => counter_signal(3 downto 0),
			Sseg(6 downto 0) => hex0(6 downto 0)
		);
end testing;
