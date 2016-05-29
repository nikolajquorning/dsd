library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_counter is
  port (
    clk, reset : in std_logic;
    mode       : in std_logic_vector(1 downto 0);
    count      : out std_logic_vector(3 downto 0);
    cout       : out std_logic
  );
end multi_counter;

architecture arc of multi_counter is
begin
  counter: process(clk, reset)
  variable temp_count : unsigned(3 downto 0);
  variable temp_cout  : std_logic;
  begin
    if reset = '0' then
      temp_count := "0000";
    elsif rising_edge(clk) then
      temp_count := temp_count + 1;
      if mode = "00" then
        if temp_count = "1010" then
          temp_count := "0000";
          temp_cout := '1';
        else
          temp_count := temp_count;
          temp_cout := '0';
        end if;
      elsif mode = "01" then
        if temp_count = "0110" then
          temp_count := "0000";
          temp_cout := '1';
        else
          temp_count := temp_count;
          temp_cout := '0';
        end if;
      else
        if temp_count = "0011" then
          temp_count := "0000";
          temp_cout := '1';
        else
          temp_count := temp_count;
          temp_cout := '0';
        end if;
      end if;	
    end if;
    count <= std_logic_vector(temp_count);
    cout  <= std_logic(temp_cout);
  end process counter;
end arc;