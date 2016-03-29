library ieee;
use ieee.std_logic_1164.all;

entity bin2sevenseg_tester is
	port (
		SW   : in  std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
end bin2sevenseg_tester;

architecture testing of bin2sevenseg_tester is
	begin
	i0: entity work.bin2sevenseg
		port map (
			bin(3 downto 0)  => SW(3 downto 0),
			Sseg(6 downto 0) => HEX0(6 downto 0)
		);
end testing;
