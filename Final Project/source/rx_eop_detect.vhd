-- $ID:			mg32
-- File Name:	rx_eop_detect
-- Created:
-- Author:		Edward Kidarsa
-- Lab Section:	337-04
-- Version:		1.0 Initial Design
-- Description:	Detect for the end of the transmission (detects a low on both d+ and d-)

library ieee;
use ieee.std_logic_1164.all;

entity rx_eop_detect is
	port (
		d_plus	: in  std_logic;
		d_minus	: in  std_logic;
		eop		: out std_logic);
end entity rx_eop_detect;

architecture eop_detect of rx_eop_detect is
begin
  
	eop <= not(d_plus or d_minus);

end architecture eop_detect;
