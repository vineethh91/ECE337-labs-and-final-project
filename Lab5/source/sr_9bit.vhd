-- $Id: $ece337
-- File name:   sr_9bit.vhd
-- Created:     2/5/2012
-- Author:      ECE 337 Course Staff
-- Lab Section: Course Staff
-- Version:     1.0  Original Design Entry
-- Description: ECE 337 Lab 5 UART design component (9 bit shift register block)
-- Use a tab size of 2 for best viewing results

library ieee;
use ieee.std_logic_1164.all;

entity sr_9bit is
	port
	(
		clk						: in	std_logic;
		rst						: in	std_logic;
		shift_strobe	: in	std_logic;
		serial_in			: in	std_logic;
		packet_data		: out std_logic_vector(7 downto 0);
		stop_bit			: out std_logic
	);
end entity sr_9bit;


architecture simple_shift_reg of sr_9bit is
	signal present_val : std_logic_vector(8 downto 0);
	signal next_val : std_logic_vector(8 downto 0);
  
begin
    
   
  REG: process (clk, rst)
  begin  -- process
		if('1' = rst) then
			present_val <= (others=>'0');
		elsif(rising_edge(clk)) then
			present_val <= next_val;
		end if; 
	end process;

	-- Next value logic: Shift in to the right when told to
	next_val	<= serial_in & present_val(8 downto 1) when ('1' = shift_strobe) else present_val;
	
	-- Output Logic
  packet_data	<= present_val(7 downto 0);
  stop_bit		<= present_val(8);
  
end architecture simple_shift_reg;

