-- $ID:			mg32
-- File Name:	rx_controller
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Controls the actions of the USB Receiver

library ieee;
use ieee.std_logic_1164.all;

entity rx_controller is
	port (
		clk		 : in  std_logic;
		rst 	 : in  std_logic;
		d_edge	 : in  std_logic;
		bit8	 : in  std_logic;
		eop		 : in  std_logic;
		strobe	 : out std_logic;
		counting : out std_logic);
end entity rx_controller;

architecture controller of rx_controller is
	type stateType is (IDLE, TIMERON, STROBING);
	signal nx_state, state : stateType;
begin

	REG: process(clk, rst)
	begin
		if ('0' = rst) then
			state <= IDLE;
		elsif (rising_edge(clk)) then
			state <= nx_state;
		end if;
	end process;

	NX_LOGIC: process(state, d_edge, bit8, eop)
	begin

		case state is
			when IDLE =>
				if ('1' = d_edge) then
					nx_state <= TIMERON;
				else
					nx_state <= IDLE;
				end if;

			when TIMERON =>
				if ('1' = eop) then
					nx_state <= IDLE;
				elsif ('1' = bit8) then
					nx_state <= STROBING;
				else
					nx_state <= TIMERON;
				end if;

			when STROBING =>
				if ('1' = eop) then
					nx_state <= IDLE;
				else
					nx_state <= TIMERON;
				end if;

		end case;
	end process NX_LOGIC;

	OUT_LOGIC: process(state)
	begin

		counting <= '1';
		strobe   <= '0';
		
		case state is

			when IDLE =>
				counting <= '0';

			when TIMERON =>

			when STROBING =>
				strobe <= '1';

		end case;
	end process OUT_LOGIC;

end architecture controller;
