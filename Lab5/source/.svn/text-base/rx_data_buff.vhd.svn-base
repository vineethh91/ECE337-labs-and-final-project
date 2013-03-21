-- $Id: $ece337
-- File name:   rx_data_buff.vhd
-- Created:     2/5/2012
-- Author:      ECE 337 Course Staff
-- Lab Section: Course Staff
-- Version:     1.0  Original Design Entry
-- Description: ECE 337 Lab 5 UART design component (1 entry recieved data buffer block, with overrun detection)
-- Use a tab size of 2 for best viewing results

library ieee;
use ieee.std_logic_1164.all;

entity rx_data_buff is
  port
	(
		clk						: in	std_logic;
		rst						: in	std_logic;
		load_buffer		: in	std_logic;
		packet_data		: in	std_logic_vector(7 downto 0);
		data_read			:	in	std_logic;
		rx_data				: out	std_logic_vector(7 downto 0);
		data_ready		:	out	std_logic;
		overrun_error	:	out	std_logic
	);
end entity rx_data_buff;

architecture overrun_buffer of rx_data_buff is

  signal data_reg : std_logic_vector(7 downto 0);
	signal nxt_data	: std_logic_vector(7 downto 0);
	
	signal overrun_error_reg	:	std_logic;
	signal nxt_overrun_error	:	std_logic;
	signal data_ready_reg			: std_logic;
	signal nxt_data_ready			: std_logic;

begin
	REG: process(clk,rst)
	begin
		if rst = '1' then
			data_reg					<= (others=>'0');
			overrun_error_reg	<= '0';
			data_ready_reg		<= '0';
		elsif (rising_edge(clk)) then
			data_reg					<= nxt_data;
			overrun_error_reg	<= nxt_overrun_error;
			data_ready_reg		<= nxt_data_ready;
		end if;
	end process REG;
	
	-- Next value logic
	nxt_data					<= packet_data when ('1' = load_buffer) else data_reg;
	nxt_overrun_error	<= '1' when (('1' = data_ready_reg) and ('1' = load_buffer) and ('0' = data_read)) else
											 '0' when ('1' = data_read) else overrun_error_reg;
	nxt_data_ready		<= '1' when ('1' = load_buffer) else
											 '0' when ('1' = data_read) else
											 data_ready_reg;

	-- Output logic
	rx_data				<= data_reg;
	overrun_error	<= overrun_error_reg;
	data_ready		<= data_ready_reg;
	
end architecture overrun_buffer;

