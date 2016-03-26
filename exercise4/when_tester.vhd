library ieee;
use ieee.std_logic_1164.all;

entity when_tester is
	port 
	(
		SW   : in std_logic_vector(11 downto 0);
		KEY  : in std_logic_vector(1 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0)
	);

end when_tester;

architecture testing of when_tester is
	signal A, B, C : std_logic_vector(6 downto 0);
	begin
		i1: entity work.bin2sevenseg --HEX2
			port map
			(
				bin(3 downto 0) => SW(11 downto 8),
				Sseg(6 downto 0) => C(6 downto 0)
			);
		i2: entity work.bin2sevenseg --HEX1
			port map
			(
				bin(3 downto 0)  => SW(7 downto 4),
				Sseg(6 downto 0) => B(6 downto 0)
			);
		i3: entity work.bin2sevenseg --HEX0
			port map
			(
				bin(3 downto 0)  => SW(3 downto 0),
				Sseg(6 downto 0) => A(6 downto 0)
			);
		HEX2 <=	"1111110" when KEY="11" else	--O
					"1001111" when KEY="01" else	--E
					C;
		HEX1 <=	"0010101" when KEY="11" else --n
					"0000101" when KEY="01" else --r
					B;
		HEX0 <=	"0000000" when KEY="11" else --
					"0000101" when KEY="01" else --r
					A;
		
end testing;
