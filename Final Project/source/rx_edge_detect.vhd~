-- $ID:			mg32
-- File Name:	rx_edge_detect
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Detect for the start of the sync bit (detects a falling edge)

library ieee;
use ieee.std_logic_1164.all;

entity rx_edge_detect is
	port (
		clk		: in  std_logic;
		rst		: in  std_logic;
	    d_plus	: in  std_logic;
	    d_edge	: out std_logic);
end entity rx_edge_detect;

architecture edge_detect of rx_edge_detect is
	signal nx_dp   : std_logic;
	signal nx_edge : std_logic;
	signal edge    : std_logic;
begin

	d_edge <= edge and (not(nx_edge));

	REG: process(clk, rst)
	begin
		if ('0' = rst) then
			nx_edge <= '1';
			edge    <= '1';
			nx_dp   <= '1';
		elsif (rising_edge(clk)) then
			edge    <= nx_edge;
			nx_edge <= nx_dp;
			nx_dp   <= d_plus;
		end if;
	end process;
		
end architecture edge_detect;
