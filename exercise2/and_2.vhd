library ieee;
use ieee.std_logic_1164.all;

entity and_2 is -- Entity declaration for 2 input AND gate 
	port (i1, i2 : in std_logic;
				 o1 : out std_logic);
end and_2;

architecture dataflow of and_2 is -- Architecture body for 2 input AND 
begin
	o1 <= i1 and i2; 
end dataflow;