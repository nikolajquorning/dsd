library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alarm_watch is
	port (
		? : in std_logic_vector(3 downto 0);
		bin_min1, bin_min10, bin_hrs1, bin_hrs10 : in std_logic_vector(3 downto 0);
		clock_50 : in std_logic;
		
	);
end alarm_watch;

architecture arc of alarm_watch is
begin



end arc;