library ieee;
use ieee.std_logic_1164.all;

entity mee_moo is
	port ( 
		a, b, reset, clk : in  std_logic;
		mee_out, moo_out : out std_logic
	);
end mee_moo;

architecture fsm of mee_moo is
type state is (actives, idle, init);
signal present_state, next_state : state;
begin

	proc_state_reg: process(clk, reset)
	begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process proc_state_reg;

	proc_next_state: process(present_state, a, b)
	begin
		case present_state is
			when actives =>
				next_state <= idle;
			when idle =>
				if b = '1' then
					next_state <= init;
				else 
					next_state <= present_state;
				end if;
			when init =>
				if a = '0' and b = '0' then
					next_state <= idle;
				elsif a = '1' and b = '0' then
					next_state <= actives;
				else 
					next_state <= present_state;
				end if;
		end case;
	end process proc_next_state;

	mee_output: process(present_state)
	begin
		if present_state = init and a = '1' and b = '1' then
			mee_out <= '1';
		else
			mee_out <= '0';
		end if;
	end process mee_output;

	moo_output: process(present_state)
	begin
		case present_state is
		when init | actives =>
			moo_out <= '1';
		when idle =>
			moo_out <= '0';
		end case;
	end process moo_output;

end fsm;