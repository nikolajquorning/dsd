library ieee;
use ieee.std_logic_1164.all;

entity code_lock_tester is
	port (
		key      : in  std_logic_vector(3 downto 2);
		sw       : in  std_logic_vector(3 downto 0);
		clock_50 : in  std_logic;
		ledg     : out std_logic_vector(0 downto 0)
	);
end code_lock_tester;

architecture testing of code_lock_tester is
begin
	fsm: entity work.code_lock
		port map (
			clk   => clock_50,
			reset => key(2),
			enter => key(3),
			code  => sw(3 downto 0),
			lock  => ledg(0)
		);
end testing;