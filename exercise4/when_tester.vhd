library ieee;
use ieee.std_logic_1164.all;

entity when_tester is
  port (
    SW  : in std_logic_vector(11 downto 0);
    KEY : in std_logic_vector( 1 downto 0);
    HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
    -- For appearance on the de2-board we clear HEX3
  );
end when_tester;

architecture testing of when_tester is
signal A, B, C : std_logic_vector(6 downto 0);
begin
  h2: entity work.bin2sevenseg --HEX2
    port map (
      bin(3 downto 0)  => SW(11 downto 8),
      Sseg(6 downto 0) => C(6 downto 0)
    );

  h1: entity work.bin2sevenseg --HEX1
    port map (
      bin(3 downto 0)  => SW(7 downto 4),
      Sseg(6 downto 0) => B(6 downto 0)
    );

  h0: entity work.bin2sevenseg --HEX0
    port map (
      bin(3 downto 0)  => SW(3 downto 0),
      Sseg(6 downto 0) => A(6 downto 0)
    );

  HEX3 <= "1111111"; -- For appearance on the de2-board we clear HEX3

  HEX2 <= "1000000" when KEY="11" else --O
          "0000110" when KEY="01" else --E
          C;

  HEX1 <= "0101011" when KEY="11" else --n
          "0101111" when KEY="01" else --r
          B;

  HEX0 <= "1111111" when KEY="11" else --
          "0101111" when KEY="01" else --r
          A;
end testing;