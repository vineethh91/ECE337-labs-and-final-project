-- $Id: $
-- File name:   bitstuffer.vhd
-- Created:     11/19/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Timer block.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bitstuffer is port(
  clk : in std_logic; 
  rst_n : in std_logic;
  bitstuff : in std_logic;
  shift_strobe : in std_logic;   
  transmit_data : in std_logic;
  data_output : out std_logic);
end bitstuffer;

architecture bitstuffmux of bitstuffer is
  type state_type is (transmitting, bitstuffing);
  signal currentState, nextState : state_type; 

begin
  
  stateReg : process (clk, rst_n)
  begin
    if(rst_n = '0') then
      currentState <= transmitting; 
    elsif (rising_edge(clk)) then
      currentState <= nextState;      
    end if;    
  end process; 
  
  nextStateLogic : process (currentState, nextState, bitstuff, shift_strobe)
  begin
    nextState <= currentState; 
    case currentState is 
      when transmitting =>
        if (bitstuff = '1') then
          nextState <= bitstuffing;
        end if; 
      when bitstuffing =>
        if (shift_strobe = '1') then
          nextState <= transmitting;
        end if;
    end case; 
  end process;
  
  outputLogic : process (currentState, transmit_data)
  begin
    case currentState is 
      when transmitting =>
        data_output <= transmit_data; 
      when bitstuffing =>
        data_output <= '0'; 
    end case;    
  end process; 
  
  --data_output <= '0' when (bitstuff = '1') else transmit_data; 
  
  
  
end bitstuffmux;