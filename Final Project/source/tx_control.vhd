-- $Id: $
-- File name:   tx_control.vhd
-- Created:     11/17/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: State Machine that controls the serial reciever.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL; 

entity tx_control is
    port(clk                    : in std_logic;
        rst_n                   : in std_logic;
        tx_enable               : in std_logic; 
        eop_done                : in std_logic;
        eop_time                : out std_logic; 
        sr_enable               : out std_logic;
        tx_idle                 : out std_logic; 
        timer_enable            : out std_logic);
end tx_control; 

architecture ControlUnit of tx_control is
    type state_type is (idle, init_tx, processing, send_eop);
    signal currentState, nextState : state_type; 
    
begin

    -- *** stateReg : HANDLES STATE TRANSITION ON CLK EDGE
    stateReg : process(clk, rst_n)
    begin
        if(rst_n = '0') then
            currentState <= idle;
        elsif (rising_edge(clk)) then
            currentState <= nextState;
        end if;
    end process; 

    -- *** nextStateLogic : HANDLES NEXT STATE LOGIC
    nextStateLogic : process (tx_enable, currentState, eop_done)
    begin
        nextState <= currentState; 
        case currentState is
            when idle =>
              if(tx_enable = '1') then
                nextState <= processing; 
              end if;
                
            when init_tx =>
              nextState <= processing; 
                
            when processing =>
              if(tx_enable = '0') then
                nextState <= send_eop;
              else
                nextState <= processing; 
              end if;
              
            when send_eop =>
              if(eop_done = '1') then
                nextState <= idle;
              end if;
              
            when others =>
                nextState <= idle; 
        end case;       
    end process;
    
    -- *** outputLogic : HANDLES THE OUTPUTS
    outputLogic : process (currentState)    
    begin
      
    --Initializations
    timer_enable <= '0';
    sr_enable <= '0';
    tx_idle <= '0'; 
    eop_time <= '0';
      case currentState is
            when idle =>
              tx_idle <= '1'; 
            when init_tx =>
              tx_idle <= '0';
            when processing =>
              timer_enable <= '1'; 
              sr_enable <= '1'; 
              tx_idle <= '0';
            when send_eop =>
              eop_time <= '1';
              tx_idle <= '0';

      end case;         
    end process; 
        
end ControlUnit; 

