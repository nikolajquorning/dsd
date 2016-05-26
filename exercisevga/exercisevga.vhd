library ieee;
use ieee.std_logic_1164.all;

entity vga_tester is
	port (
		clock_25, reset : in std_logic;
		vga_r, vga_g , vga_b : out std_logic_vector(9 downto 0);
		vga_hs, vga_vs  : out std_logic;
		vga_clk   : out std_logic;
		vga_sync  : out std_logic;
		vga_blank : out std_logic
	);
end vga_tester;

architecture testing of vga_tester is
begin 
vga_ent: entity work.vga
	port map (
		clk   => clock_25,
		reset => reset,
		red(9 downto 0)   => vga_r(9 downto 0),
		green(9 downto 0) => vga_g(9 downto 0),
		blue(9 downto 0)  => vga_b(9 downto 0),
		hsync => vga_hs,
		vsync => vga_vs,
		clockOut => vga_clk,
		compSync => vga_sync,
		blank => vga_blank
	);
end testing;