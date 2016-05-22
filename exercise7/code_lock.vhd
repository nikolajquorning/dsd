library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity code_lock is
	port ( 
		reset, clk, enter : in std_logic;
		code              : in std_logic_vector(3 downto 0);
		lock              : out std_logic
	);
end code_lock;

architecture fsm of code_lock is
type state is (idle, going_idle, eval_1, eval_2, getting_2, unlocked, wrong_code, permalock);
type wc_state is (err_0, err_1, err_2, err_3);
signal present_state, next_state : state;
signal wrong_code_present_state, wrong_code_next_state : wc_state;
signal code1   : std_logic_vector(3 downto 0);
signal code2   : std_logic_vector(3 downto 0);
signal err_cnt : unsigned(1 downto 0);
begin
	code1 <= "0000";
	code2 <= "1111";

	-- MAIN STATE MACHINE
	proc_state_reg: process(clk, reset)
	begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process proc_state_reg;

	-- MAIN STATE MACHINE NEXT STATE
	proc_next_state: process(present_state, enter, code, code1, code2, err_cnt)
	begin
		case present_state is
			when idle =>
				if enter = '0' then
					next_state <= eval_1;
				else
					next_state <= present_state;
				end if;
			when eval_1 =>
				if enter = '1' and code = code1 then
					next_state <= getting_2;
				elsif enter = '1' and code /= code1 then
					next_state <= wrong_code;
				else
					next_state <= present_state;
				end if;
			when getting_2 =>
				if	enter = '0' then
					next_state <= eval_2;
				else
					next_state <= present_state;
				end if;
			when eval_2 =>
				if enter = '1' and code = code2 then
					next_state <= unlocked;
				elsif enter = '1' and code /= code2 then
					next_state <= wrong_code;
				else
					next_state <= present_state;
				end if;
			when unlocked =>
				if enter = '0' then
					next_state <= going_idle;
				else
					next_state <= present_state;
				end if;
			when going_idle =>
				if enter = '1' then
					next_state <= idle;
				else
					next_state <= present_state;
				end if;
			when wrong_code =>
				if enter = '0' then
					if err_cnt = "11" then
						next_state <= permalock;
					else 
						next_state <= going_idle;
					end if;
				else
					next_state <= present_state;
				end if;
			when permalock =>
				next_state <= present_state;
		end case;
	end process proc_next_state;

	-- MAIN STATE MACHINE OUTPUT
	output: process(present_state)
	begin
		if present_state = unlocked then
			lock <= '0';
		else
			lock <= '1';
		end if;
	end process output;

	-- WRONG CODE STATE
	wrong_state_reg: process(clk, reset)
	begin
		if reset = '0' then
			wrong_code_present_state <= err_0;
		elsif rising_edge(clk) then
			wrong_code_present_state <= wrong_code_next_state;
		end if;
	end process wrong_state_reg;
	
	-- WRONG CODE NEXT STATE
	proc_wrong_code_next_state: process(wrong_code_present_state, err_cnt)
	begin
		case wrong_code_present_state is
			when err_0 =>
				wrong_code_next_state <= err_1;
			when err_1 =>
				wrong_code_next_state <= err_2;
			when err_2 =>
				wrong_code_next_state <= err_3;
			when err_3 =>
				wrong_code_next_state <= err_0;
		end case;
	end process proc_wrong_code_next_state;
	
	wrong_code_output: process(wrong_code_present_state)
	begin
		case wrong_code_present_state is
			when err_0 =>
				err_cnt <= "00";
			when err_1 =>
				err_cnt <= "01";
			when err_2 =>
				err_cnt <= "10";
			when err_3 =>
				err_cnt <= "11";
		end case;
	end process wrong_code_output;
end fsm;