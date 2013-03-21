-- $Id: $
-- File name:   USB_Encoder.vhd
-- Created:     11/14/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: NZRI Encoder


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity USB_Encoder is
	port
	(
	   transmit_data     : in std_logic; 
	   clk               : in std_logic;
	   rst_n             : in std_logic;
	   shift_strobe      : in std_logic;
	   bitstuff          : in std_logic; 
	   eop_time          : in std_logic; 
	   data_plus         : out std_logic;
	   data_minus        : out std_logic);
		
end entity USB_Encoder;

architecture NZRI_Encoder of USB_Encoder is
    signal temp_data_plus : std_logic;
    signal shiftstrobe_reg : std_logic; 
    signal bitstuff_reg : std_logic; 
    
    --signal reg_input : std_logic;
    signal reg_output : std_logic; 
 begin  
 
  --reg_input <= not(reg_output) when (transmit_data = '1') else reg_output;
 
  	flippingReg: process (clk, rst_n)
  	begin
  	  if ( rst_n = '0') then
  	    reg_output <= '0';
	  elsif ((rising_edge(clk))) then
	      if((((shift_strobe = '1') and (shiftstrobe_reg = '0')) or ((bitstuff = '1') and (bitstuff_reg = '0'))) and transmit_data = '0') then
	        reg_output <= not(reg_output);
	      else 
	        reg_output <= reg_output; 
	     end if; 
	    end if;
	  end process; 
 
  EOP_Gen : process (rst_n, clk, eop_time, reg_output, temp_data_plus)
  begin
    --PUT IN DEFAULT IDLE LINE INFO HERE
    data_plus <= '0';
    data_minus <= '0';
    temp_data_plus <= reg_output;
    if(eop_time = '0') then
      data_plus <= temp_data_plus;
      data_minus <= not(temp_data_plus);
	end if;
  end process; 
  
 -- OLD CODE 
  REG1: process (clk, rst_n)
  begin  -- process
		if('0' = rst_n) then
			shiftstrobe_reg <= '0';
		elsif(rising_edge(clk)) then
			shiftstrobe_reg <= shift_strobe;
		end if; 
	end process; 

  REG2: process (clk, rst_n)
  begin  -- process
		if('0' = rst_n) then
			bitstuff_reg <= '0';
		elsif(rising_edge(clk)) then
			bitstuff_reg <= bitstuff;
		end if; 
	end process; 
  
  -- Data Outputs
--  temp_data_plus <= (firstreg_transmit_data xnor secondreg_transmit_data);
--  data_plus <= temp_data_plus; 
--  data_minus <= not(temp_data_plus); 
  
end architecture NZRI_Encoder;
