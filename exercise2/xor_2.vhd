library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is -- Entity declaration for 2 input XOR gate 
port (i1, i2 : in std_logic;
			 o1 : out std_logic);
end xor_2;

architecture dataflow of xor_2 is -- Architecture body for 2 input XOR 
begin
	o1 <= i1 xor i2; 
end dataflow;