-- $Id: $
-- File name:   tx_sr.vhd
-- Created:     11/25/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Transmitting Shift Register.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity tx_sr is
	port
	(
		clk						      : in	std_logic;
		rst_n					  	     : in	std_logic;
		shift_strobe      : in	std_logic;
		shift_done        : in std_logic; 
		load_data         : in	std_logic;
		sr_enable         : in std_logic; 
		transmit_data     : out std_logic; 
		data_out        		: in std_logic_vector(7 downto 0));
		
end entity tx_sr;

architecture TransShiftReg of tx_sr is
  signal buffered_data_out      : std_logic_vector(7 downto 0);
  signal next_shifting_data     : std_logic_vector(7 downto 0);
  signal present_shifting_data  : std_logic_vector(7 downto 0);
  signal temp_transmit_data     : std_logic; 
begin
  
  -- OUTPUTS
  temp_transmit_data <= present_shifting_data(0); 
  transmit_data <= temp_transmit_data; 
  
  
  -- PROCESSES
  HoldREG: process (clk, rst_n, data_out, load_data, sr_enable)
  begin  -- When load data is pulsed, pull in new data to the holding register
		if('0' = rst_n) then
			buffered_data_out <= "00101101";
		elsif (sr_enable = '0') then
			buffered_data_out <= "00101101";
		elsif((rising_edge(clk))) then
			if ((sr_enable = '1') and (load_data = '1')) then
				buffered_data_out <= data_out;
			else
				buffered_data_out <= buffered_data_out;
			end if;
		end if; 
	end process;

  ShiftLogic: process (shift_done, present_shifting_data, sr_enable, shift_strobe, buffered_data_out)
  begin
    if ((shift_done = '1') and (sr_enable = '1')) then
      next_shifting_data <= buffered_data_out;       
    elsif (('1' = sr_enable) and ('1' = shift_strobe)) then
      next_shifting_data <= '0' & present_shifting_data(7 downto 1);
    elsif (sr_enable = '0') then
      next_shifting_data <= "10000000"; --sync byte prep for next packet
    else
      next_shifting_data <= present_shifting_data; 
    end if ; 
  end process; 

  ShiftREG: process (clk, rst_n, sr_enable)
  begin
		if('0' = rst_n) then
			present_shifting_data <= "10000000";
		elsif(sr_enable = '0') then
		  present_shifting_data <= "10000000";
		elsif(rising_edge(clk)) then
			present_shifting_data <= next_shifting_data;
		end if;     
  end process; 

end TransShiftReg; 
