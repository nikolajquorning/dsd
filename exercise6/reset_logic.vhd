library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_logic is
	port (
		hrs_bin1, hrs_bin10 : in std_logic_vector(3 downto 0);
		reset_in            : in std_logic;
		reset_out           : out std_logic
	);
end reset_logic;

architecture arc of reset_logic is
begin
	reset: process(hrs_bin1, hrs_bin10)
	begin
		if (hrs_bin10 = "0010" and hrs_bin1 = "0100") or reset_in = '0' then
			reset_out <= '0';
		else 
			reset_out <= '1';
		end if;
	end process reset;
end arc;