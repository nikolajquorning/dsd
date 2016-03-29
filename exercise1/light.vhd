library ieee;
use ieee.std_logic_1164.all;

entity light is
	port (
		x1, x2 :	in  std_logic;
		f		 :	out std_logic
	);
end light;

architecture LogicFunction of light is
begin
	f <= (x1 AND NOT x2) OR (NOT x1 AND x2);
end LogicFunction;