library ieee;
use ieee.std_logic_1164.all;

entity bin2sevenseg is
	port 
	(
		bin  : in std_logic_vector(3 downto 0);
		Sseg : out std_logic_vector(6 downto 0)
	);

end bin2sevenseg;

architecture dataflow of bin2sevenseg is
begin
	 with bin select
	 Sseg <= "0110000" when "0001",
				"1101101" when "0010",
				"1111001" when "0011",
				"0110011" when "0100",
				"1011011" when "0101",
				"1011111" when "0110",
				"1110000" when "0111",
				"1111111" when "1000",
				"1111011" when "1001",
				"1111110" when others; --the default
end dataflow;
