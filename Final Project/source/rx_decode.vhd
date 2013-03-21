-- $ID:			mg32
-- File Name:	rx_decode
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Decode input NRZi encoded data into original data

library ieee;
use ieee.std_logic_1164.all;

entity rx_decode is
	port(
		clk		 : in  std_logic;
		rst		 : in  std_logic;
		d_plus	 : in  std_logic;
		shift_en : in  std_logic;
		eop   : in  std_logic;
		d_orig	 : out std_logic);
end entity rx_decode;

architecture decode of rx_decode is
	signal nx_dp, dp_2, dp_3 : std_logic;
begin

	d_orig <= not(dp_2 xor dp_3);

	REG: process(clk, rst)
	begin
		if ('0' = rst) or ('1' = eop) then
			nx_dp <= '1';
			dp_2  <= '1';
			dp_3  <= '1';
		elsif (rising_edge(clk)) then
		  if ('1' = shift_en) then
		    dp_3 <= dp_2;
		    dp_2 <= nx_dp;
		  end if;
			nx_dp <= d_plus;
		end if;
	end process;

end architecture decode;
			
