library ieee;
use ieee.std_logic_1164.all;


entity mee_moo is
	port ( 
		a, b, reset, clk : in  std_logic;
		mee_out, moo_out : out std_logic
		);
end mee_moo;

architecture moore_fsm of mee_moo is
type state is (actives, idle, init);
signal present_state, next_state : state;
begin
	state_reg: process(clk, reset)
	begin
		if reset = '0' then
			present_state <= actives;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process state_reg;

	moo_next_state: process(present_state, a)
	begin
		case present_state is
			when actives =>
				if a = '0' then
					next_state <= idle;
				else next_state <= present_state;
				end if;
			when idle =>
				if a = '1' then
					next_state <= init;
				else next_state <= present_state;
				end if;
			when init =>
				if a = '0' then
					next_state <= idle;
				else next_state <= actives;
				end if;
		end case;
	end process moo_next_state;

	moo_output: process(present_state)
	begin
		case present_state is
		when init | actives =>
			moo_out <= '1';
		when idle =>
			moo_out <= '0';
		end case;
	end process moo_output;
	
--	mee_next_state: process(present_state, b)
--	begin
--		case present_state is
--			when actives =>
--				if b = '0' then
--					next_state <= idle;
--				else next_state <= present_state;
--				end if;
--			when idle =>
--				if b = '1' then
--					next_state <= init;
--				else next_state <= present_state;
--				end if;
--			when init =>
--				if b = '0' then
--					next_state <= idle;
--				else next_state <= actives;
--				end if;
--		end case;
--	end process mee_next_state;
--	
--	mee_output: process(present_state, b)
--	begin
--		case present_state is
--			when idle =>
--				if b = '0' then
--					mee_out <= '0';
--				else
--					mee_out <= '0';
--				end if;
--			when actives =>
--				mee_out <= '0';
--			when others =>
--				if b = '0' then
--					mee_out <= '0';
--				elsif b = '1' and a = '0' then
--					mee_out <= '0';
--				else
--					mee_out <= '1';
--				end if;
--		end case;
--	end process mee_output;		
end moore_fsm;

