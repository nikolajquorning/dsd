library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alarm_watch is
	port (
		key                 : in  std_logic_vector(3 downto 0);
		bin_min1, bin_min10 : in  std_logic_vector(3 downto 0);
		bin_hrs1, bin_hrs10 : in  std_logic_vector(3 downto 0);
		clock_50            : in  std_logic;
		alarm               : out std_logic;
		hex2, hex3, hex4    : out std_logic_vector(6 downto 0);
		hex5, hex6, hex7    : out std_logic_vector(6 downto 0)
	);
end alarm_watch;

architecture arc of alarm_watch is
signal time_watch : std_logic_vector(15 downto 0);
signal time_alarm : std_logic_vector(15 downto 0);
signal alarm_hex4, alarm_hex5, alarm_hex6, alarm_hex7 : std_logic_vector(6 downto 0);
signal watch_hex2, watch_hex3, watch_hex4, watch_hex5, watch_hex6, watch_hex7 : std_logic_vector(6 downto 0);
begin
	watch: entity work.watch
		port map (
			clk    => clock_50,
			speed  => key(0),
			reset  => key(3),
			sec_1  => watch_hex2,
			sec_10 => watch_hex3,
			min_1  => watch_hex4,
			min_10 => watch_hex5,
			hrs_1  => watch_hex6,
			hrs_10 => watch_hex7,
			dsd_time => time_watch
		);

	-- Seven seg decoders for alarm display
	alarm_min_ones: entity work.bin2sevenseg
		port map (
			bin  => time_alarm(3 downto 0),
			Sseg => alarm_hex4
		);
	alarm_min_tens: entity work.bin2sevenseg
		port map (
			bin  => time_alarm(7 downto 4),
			Sseg => alarm_hex5
		);
	alarm_hrs_ones: entity work.bin2sevenseg
		port map (
			bin  => time_alarm(11 downto 8),
			Sseg => alarm_hex6
		);
	alarm_hrs_tens: entity work.bin2sevenseg
		port map (
			bin  => time_alarm(15 downto 12),
			Sseg => alarm_hex7
		);
	
	alarmproc: process(time_watch, time_alarm, key(2))
	variable time_alarm_temp : std_logic_vector(15 downto 0);
	begin
		time_alarm_temp := bin_hrs10 & bin_hrs1 & bin_min10 & bin_min1;
		--Compare alarm with time
		if time_watch = time_alarm_temp then
			alarm <= '1';
		else 
			alarm <= '0';
		end if;
		
		--If key2 is pressed, show the time the alarm is set to
		if key(2) = '0' then
			-- show alarm
			hex2 <= "1000000";
			hex3 <= "1000000";
			hex4 <= alarm_hex4;
			hex5 <= alarm_hex5;
			hex6 <= alarm_hex6;
			hex7 <= alarm_hex7;
		else 
			-- show watch
			hex2 <= watch_hex2;
			hex3 <= watch_hex3;
			hex4 <= watch_hex4;
			hex5 <= watch_hex5;
			hex6 <= watch_hex6;
			hex7 <= watch_hex7;
		end if;
		time_alarm <= time_alarm_temp;
	end process alarmproc;
end arc;