-- $Id: $
-- File name:   rcu.vhd
-- Created:     9/25/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: receive control unit


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

Entity rcu is
  port(
    clk                : in std_logic;
    rst                : in std_logic;
    start_bit_detected : in std_logic;
    packet_done        : in std_logic;
    framing_error      : in std_logic;
    sbc_clear          : out std_logic;
    sbc_enable         : out std_logic;
    load_buffer        : out std_logic;
    enable_timer       : out std_logic);
end rcu;


architecture archRCU of rcu is
  type state_type is (IDLE, ACCEPTDATA, ENABLETIMER, WAITFORPACKET, SETSBCENABLE, LOADBUFFER);
  signal  state, nextState : state_type;
begin
    
  stateRegister : process(clk, rst)
  begin
    if (rst = '1') then
      state <= IDLE;
    elsif rising_edge(clk) then
      state <= nextState;
    end if;
  end process stateRegister;

  nextStateLogic: process(state, start_bit_detected, packet_done, framing_error )
  begin
    nextState <= state;
        
    case state is
     
      when IDLE =>
        if( start_bit_detected = '1') then
          nextState <= ACCEPTDATA;
        end if;  
        
      when ACCEPTDATA =>
        nextState <= ENABLETIMER;
        
      when ENABLETIMER =>
        nextState <= WAITFORPACKET;
        
      when WAITFORPACKET =>
         if( packet_done = '1') then
          nextState <= SETSBCENABLE;
        end if;
      
      when SETSBCENABLE =>
        if( framing_error = '0') then
          nextState <= LOADBUFFER;
        else
          nextState <= IDLE;
        end if;
      
   --   when ERRORSTATE =>
   --     if( start_bit_detected = '1') then
   --       nextState <= ACCEPTDATA;
   --     end if;
        
      when LOADBUFFER =>
        nextState <= IDLE;
        
      when OTHERS =>
        nextState <= IDLE;
    end case;
    
  end process nextStateLogic;
  
  outputLogic: process(state)
  begin
    sbc_clear <= '0';
    sbc_enable <= '0';
    load_buffer <= '0';
    enable_timer <= '0'; 
    
    case state is
     
      when IDLE => 
        sbc_clear <= '0';
        sbc_enable <= '0';
        load_buffer <= '0';
        enable_timer <= '0';
        
      when ACCEPTDATA =>
        sbc_clear <= '1';
        
      when ENABLETIMER =>
        sbc_clear <= '0';
        enable_timer <= '1';
      
      when WAITFORPACKET =>
        sbc_clear <= '0';
        enable_timer <= '0';
        
      when SETSBCENABLE =>
        enable_timer <= '0';
        sbc_enable <= '1';
       
      when LOADBUFFER =>
        sbc_enable <= '0';
        load_buffer <= '1';
        
   -- when ERRORSTATE =>
   --   sbc_enable <= '0';
      
      when OTHERS =>
        sbc_clear <= '0';
        sbc_enable <= '0';
        load_buffer <= '0';
        enable_timer <= '0';    
      
    end case;
    
  end process outputLogic;
  
end archRCU;  
--  cnt_up <= '1' when (state = STORE) and (dr = '1') else '0';
  
--  O <= '1' when state = RCV1101 else '0';
  
