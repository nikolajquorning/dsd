library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_gen is
  port (
    clk, reset, speed : in std_logic;
    clk_out           : out std_logic
  );
end clock_gen;

architecture arc of clock_gen is
begin
  clock: process(clk, reset)
  variable temp_count : integer;
  begin
    if reset = '0' then
      temp_count := 0;
    elsif rising_edge(clk) then
      temp_count := temp_count + 1;
      if speed = '1' then             -- speed is normal
        if temp_count = 50000000 then -- may be wrong
          temp_count := 0;
          clk_out    <= '1';
        else 
          temp_count := temp_count;
          clk_out    <= '0';
        end if;
      else                           -- speed is fast
        if temp_count >= 250000 then -- may be wrong
          temp_count := 0;
          clk_out    <= '1';
        else
          temp_count := temp_count;
          clk_out    <= '0';
        end if;
      end if;
    end if;
  end process clock;
end arc;