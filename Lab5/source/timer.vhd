-- $Id: $
-- File name:   timer.vhd
-- Created:     9/25/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: timer block


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

Entity timer is
  port(
    clk                : in std_logic;
    rst                : in std_logic;
    enable_timer       : in std_logic;
    shift_strobe       : out std_logic;
    packet_done        : out std_logic);
end timer;


architecture archTimer of timer is
  signal finished_reading_bit : std_logic;
  signal nextCount, count: integer range 0 to 15 ;
  signal shiftStrobeInternal, currShiftStrobe : std_logic;
  type state_type is (IDLE, READ_BIT_1, READ_BIT_2, READ_BIT_3, READ_BIT_4, READ_BIT_5, READ_BIT_6, READ_BIT_7, READ_BIT_8, READ_BIT_9, STOPBITENABLE);
  signal state, nextState : state_type;
begin
  stateRegister : process(clk, rst)
  begin
    if (rst = '1') then
      state <= IDLE;
    elsif rising_edge(clk) then
      state <= nextState;
      count <= nextCount;
      shiftStrobeInternal <= currShiftStrobe;
    end if;
  end process stateRegister;

  stateMachine : process(state, enable_timer, finished_reading_bit, clk)
  begin
    nextState <= state;
    
    case state is 
      
      when IDLE =>
        if(enable_timer = '1') then
          nextState <= READ_BIT_1;
        end if;
        
      when READ_BIT_1 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_2;
        end if;
      
      when READ_BIT_2 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_3;
        end if;
      
      when READ_BIT_3 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_4;
        end if;
      
      when READ_BIT_4 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_5;
        end if;
      
      when READ_BIT_5 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_6;
        end if;
      
      when READ_BIT_6 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_7;
        end if;
      
      when READ_BIT_7 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_8;
        end if;
      
      when READ_BIT_8 =>
        if(finished_reading_bit = '1') then
          nextState <= READ_BIT_9;
        end if;
      
      when READ_BIT_9 =>
        if(finished_reading_bit = '1') then
          nextState <= STOPBITENABLE;
        end if;
        
      when STOPBITENABLE =>
        nextState <= IDLE;
      
      when OTHERS =>
        nextState <= IDLE;  
     
    end case;   
  end process stateMachine;
  
  outputLogic : process (state, clk)
  begin
    packet_done <= '0';
    finished_reading_bit <= '0';
    currShiftStrobe <= shiftStrobeInternal;
    nextCount <= count + 1;
    
    case state is 
    
      when IDLE =>
       -- shift_strobe <= '0';
        packet_done <= '0';  
       -- count <= 0;
        nextCount <= 0;  
        currShiftStrobe <= '0';
        
      when READ_BIT_1 =>
        if(count = 8) then
          finished_reading_bit <= '1';
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
          nextCount <= 0;
         end if;
        
        
      when READ_BIT_2 =>
        currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          --shift_strobe <= '1'; 
          currShiftStrobe <= '1';
          nextCount <= 0;
        end if;
        
      when READ_BIT_3 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
          nextCount <= 0;
        end if;
        
      when READ_BIT_4 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
        
      when READ_BIT_5 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
        
      when READ_BIT_6 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
      
      when READ_BIT_7 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
        
      when READ_BIT_8 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
        
      when READ_BIT_9 =>
                currShiftStrobe <= '0';
        if(count = 9) then
          finished_reading_bit <= '1';
          nextCount <= 0;
          --shift_strobe <= '1';
          currShiftStrobe <= '1';
        end if;
        
      when STOPBITENABLE =>
        currShiftStrobe <= '0';
        packet_done <= '1';
                  
      end case;
  
        
  end process outputLogic;
  
  shift_strobe <= shiftStrobeInternal;
    
--  shift_strobe <= '1' when (finished_reading_bit = '1') else '0';
end archTimer;
