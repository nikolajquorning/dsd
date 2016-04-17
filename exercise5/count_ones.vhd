library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity count_ones is
	port(
		a    : in  std_logic_vector(7 downto 0);
		ones : out std_logic_vector(3 downto 0)
	); 
end count_ones;

architecture counting of count_ones is
	begin
		l1: process(a)
			variable numOnes : unsigned(3 downto 0);
			begin
				numOnes := "0000";
				for i in 7 downto 0 loop
					if a(i)='1' then
						numOnes := numOnes + 1;
					else numOnes := numOnes;
					end if;
				end loop;
				ones <= std_logic_vector(numOnes);
		end process l1;
end counting;