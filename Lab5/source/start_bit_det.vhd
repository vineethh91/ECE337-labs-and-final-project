-- $Id: $ece337
-- File name:   start_bit_chk.vhd
-- Created:     1/31/2011
-- Author:      ECE 337 Course Staff
-- Lab Section: Course Staff
-- Version:     2.0  Updated Design Entry
-- Description: ECE 337 Lab 5 UART design component (start bit detect block)
-- Use a tab size of 2 for best viewing results

library ieee;
use ieee.std_logic_1164.all;

entity start_bit_det is
  port
	(
		clk									:	in	std_logic;
		rst									:	in	std_logic;
		serial_in						:	in	std_logic;
    start_bit_detected	:	out	std_logic
	);
end entity start_bit_det;

architecture falling_edge_detect_arch of start_bit_det is

  signal Q_int1	: std_logic;
	signal Q_int2	:	std_logic;
	signal Q_int3	:	std_logic;

begin

-- Signal that a start bit has been found if there is a falling edge detected on the incoming line;
start_bit_detected <= (not(Q_int2)) and Q_int3;

REG: process(clk,rst)
begin
  If ('1' = rst) then
    Q_int3	<= '1';
		Q_int2	<= '1';
		Q_int1	<= '1';
  elsif (rising_edge(clk)) then
    Q_int3	<= Q_int2;
		Q_int2	<= Q_int1;
    Q_int1	<= serial_in;
  end if;
end process;

end architecture falling_edge_detect_arch;

