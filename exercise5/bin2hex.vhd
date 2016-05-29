library ieee;
use ieee.std_logic_1164.all;

entity bin2hex is
  port (
    bin  : in  std_logic_vector(3 downto 0);
    Sseg : out std_logic_vector(6 downto 0)
  );
end bin2hex;

architecture combinatorial of bin2hex is
begin
  case_convert: process(bin)
  begin
    case (bin) is
      when "0001" =>
        Sseg <= "1111001"; --1
      when "0010" =>
        Sseg <= "0100100"; --2
      when "0011" =>
        Sseg <= "0110000"; --3
      when "0100" =>
        Sseg <= "0011001"; --4
      when "0101" =>
        Sseg <= "0010010"; --5
      when "0110" =>
        Sseg <= "0000010"; --6
      when "0111" =>
        Sseg <= "1111000"; --7
      when "1000" =>
        Sseg <= "0000000"; --8
      when "1001" =>
        Sseg <= "0010000"; --9
      when "1010" =>
        Sseg <= "0001000"; --A
      when "1011" =>
        Sseg <= "0000011"; --B
      when "1100" =>
        Sseg <= "1000110"; --C
      when "1101" =>
        Sseg <= "0100001"; --D
      when "1110" =>
        Sseg <= "0000110"; --E
      when "1111" =>
        Sseg <= "0001110"; --F
      when others =>
        Sseg <= "1000000"; --default
    end case;
  end process case_convert;
end combinatorial;