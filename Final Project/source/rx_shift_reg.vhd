-- $ID:			mg32
-- File Name:	rx_shift_reg
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Serial to 8-bit parallel shift register

library ieee;
use ieee.std_logic_1164.all;

entity rx_shift_reg is
	port (
		clk		 : in  std_logic;
		rst		 : in  std_logic;
		d_orig	 : in  std_logic;
		shift_en : in  std_logic;
		b_d		 : out std_logic_vector (7 downto 0));
end entity rx_shift_reg;

architecture shift_reg of rx_shift_reg is
	signal nx_data, data : std_logic_vector (7 downto 0);
begin

	nx_data <= d_orig & data(7 downto 1) when ('1' = shift_en) else data;
	b_d		<= data;

	REG: process(clk, rst)
	begin
		if ('0' = rst) then
			data	<= (others => '1');
		elsif (rising_edge(clk)) then
			data	<= nx_data;
		end if;
	end process;

end architecture shift_reg;
