-- $ID:			mg32
-- File Name:	rx_timer
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Contains the timing management for the USB Receiver

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rx_timer is
	port (
		clk		 : in  std_logic;
		rst		 : in  std_logic;
		d_orig   : in  std_logic;
		counting : in  std_logic;
		bit_8	 : out std_logic;
		shift_de : out std_logic;
		shift_re : out std_logic);
end entity rx_timer;

architecture timer of rx_timer is
	type stateType is (IDLE, START, BIT1, SHIFT1, BIT2, SHIFT2, BIT3, SHIFT3, BIT4, SHIFT4, BIT5, SHIFT5, BIT6, SHIFT6, BIT7, SHIFT7, BIT8, SHIFT8);
	signal nx_state, state : stateType;
	signal start_flag : std_logic;
	signal nx_st_count, st_count : std_logic_vector (4 downto 0);  -- Counting for the shifting
	signal nx_bs_count, bs_count : std_logic_vector (2 downto 0);  -- Counting for presence of bit stuffing
begin

	start_flag <= '1' when (START = state) else '0';
	shift_de   <= '1' when ('1' = start_flag) and ("00110" = st_count) else
	              '1' when not("110" = bs_count) and ("10011" = st_count) else 
	              '0';

	REG: process(clk, rst)
	begin
		if ('0' = rst) then
			st_count <= (others => '0');
			bs_count <= (others => '0');
			state    <= IDLE;
		elsif (rising_edge(clk)) then
			state    <= nx_state;
			bs_count <= nx_bs_count;
			st_count <= nx_st_count;
		end if;
	end process;

	NX_LOGIC: process(state, counting, st_count)
	begin

		case state is

			when IDLE =>
				if ('1' = counting) then
					nx_state <= START;
				else
					nx_state <= IDLE;
				end if;

			when START =>
				if ("00111" = st_count) then
					nx_state <= SHIFT1;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= START;
				end if;

			when BIT1 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT1;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT1;
				end if;

			when SHIFT1 =>
				nx_state <= BIT2;

			when BIT2 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT2;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT2;
				end if;

			when SHIFT2 =>
				nx_state <= BIT3;

			when BIT3 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT3;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT3;
				end if;

			when SHIFT3 =>
				nx_state <= BIT4;

			when BIT4 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT4;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT4;
				end if;

			when SHIFT4 =>
				nx_state <= BIT5;

			when BIT5 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT5;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT5;
				end if;

			when SHIFT5 =>
				nx_state <= BIT6;

			when BIT6 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT6;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT6;
				end if;

			when SHIFT6 =>
				nx_state <= BIT7;

			when BIT7 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT7;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT7;
				end if;

			when SHIFT7 =>
				nx_state <= BIT8;

			when BIT8 =>
				if ("10100" = st_count) then
					nx_state <= SHIFT8;
				elsif ('0' = counting) then
					nx_state <= IDLE;
				else
					nx_state <= BIT8;
				end if;

			when SHIFT8 =>
				nx_state <= BIT1;

			when others =>
				nx_state <= IDLE;

		end case;
	end process NX_LOGIC;

	OUT_LOGIC: process(state)
	begin

		bit_8     <= '0';
		shift_re  <= '0';

		case state is

			when SHIFT1 =>
				shift_re <= '1';

			when SHIFT2 =>
				shift_re <= '1';

			when SHIFT3 =>
				shift_re <= '1';

			when SHIFT4 =>
				shift_re <= '1';

			when SHIFT5 =>
				shift_re <= '1';

			when SHIFT6 =>
				shift_re <= '1';

			when SHIFT7 =>
				shift_re <= '1';

			when SHIFT8 =>
				bit_8 <= '1';
				shift_re <= '1';

			when others =>

		end case;
	end process OUT_LOGIC;


	STCOUNT: process(st_count, counting)
	begin
		if ('1' = counting) then
			nx_st_count <= st_count + 1;
			if ("110" = bs_count) and ("10011" = st_count) then
				nx_st_count <= "00000";				
			elsif ('1' = start_flag) and ("00111" = st_count) then
				nx_st_count <= "00001";
			elsif ("10100" = st_count) then
				nx_st_count <= "00001";
			end if;
		else
			nx_st_count <= (others => '0');
		end if;
	end process STCOUNT;

	BSCOUNT: process(bs_count, st_count, d_orig, counting)
	begin
		if ('1' = counting) then
			nx_bs_count <= bs_count;
			if ('0' = d_orig) then
				nx_bs_count <= (others => '0');
			elsif ('1' = start_flag) and ("00111" = st_count) then
				nx_bs_count <= bs_count + 1;
			elsif ("00000" = st_count) and ("110" = bs_count) then
				nx_bs_count <= "000";
			elsif ("10100" = st_count) then
				nx_bs_count <= bs_count + 1;
			end if;
		else
			nx_bs_count <= (others => '0');
		end if;
	end process BSCOUNT;

end architecture timer;