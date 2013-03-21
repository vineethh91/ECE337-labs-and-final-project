-- $Id: $ece337
-- File name:   stop_bit_chk.vhd
-- Created:     2/5/2012
-- Author:      ECE 337 Course Staff
-- Lab Section: Course Staff
-- Version:     3.0  Updated Design Entry
-- Description: ECE 337 Lab 5 UART design component (stop bit check block)
-- Use a tab size of 2 for best viewing results

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stop_bit_chk is
  port
	(
    rst						: in	std_logic;
		clk  					: in  std_logic;
    sbc_clear  		: in  std_logic;
    sbc_enable	  : in  std_logic;
    stop_bit			: in  std_logic;
    framing_error : out std_logic
	);
end entity stop_bit_chk;

architecture simple_check_and_store of stop_bit_chk is

signal framing_error_reg	: std_logic;
signal nxt_framing_error	: std_logic;

begin  

	REG	: process(rst, clk)
	begin
		if('1' = rst) then
			framing_error_reg	<= '0';
		elsif(rising_edge(clk)) then
			framing_error_reg	<= nxt_framing_error;
		end if;
	end process REG;

	NXT	: process(stop_bit, sbc_enable, sbc_clear, framing_error_reg)
	begin
		nxt_framing_error	<= framing_error_reg;
		
		if('1' = sbc_clear) then
			nxt_framing_error	<= '0';
		elsif('1' = sbc_enable) then
			if ('1' = stop_bit) then
				nxt_framing_error	<= '0';
			else	-- Invalid Stop-bit
				nxt_framing_error	<= '1';
			end if;
		end if;
	end process NXT;
	
	-- Output Logic
	framing_error	<= framing_error_reg;
	
end architecture simple_check_and_store;

