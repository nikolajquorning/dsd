library ieee;
use ieee.std_logic_1164.all;

package my_gates is
  function my_xor(x: std_logic; y: std_logic) return std_logic;
  procedure my_and_or(x, y: std_logic; signal and_res, or_res: out std_logic);
end my_gates;

package body my_gates is
  function my_xor(x, y: std_logic) return std_logic is
  begin
    return x xor y;
  end my_xor;
	
  procedure my_and_or(x, y: std_logic; signal and_res, or_res: out std_logic) is
  begin
    and_res <= x and y;
    or_res  <= x or y;
  end my_and_or;
end my_gates;