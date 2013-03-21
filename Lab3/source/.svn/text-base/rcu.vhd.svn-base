-- $Id: rcu.vhd,v 1.3 2003/08/05 20:31:36 mg00 Exp $
-- File name:   rcu.vhd
-- Created:     08/05/2003
-- Author:      ECE337 TA
-- Version:     1.0  Initial Design Entry
-- Description: This is the RCU (control unit) for the tutorial in Lab 3

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity rcu is
  
  port (
    CLK    : in  std_logic;
    nRST   : in  std_logic;
    START  : in  std_logic;
    STROBE : in  std_logic;
    STOP   : out std_logic);

end rcu;

architecture rcu_arch of rcu is

  type stateType is (IDLE,STRT,DATA1,DATA2,DATA3,DATA4,STP);
  signal state, nextstate : stateType;
  
begin  -- rcu_arch

  -- purpose: state register
  -- type   : sequential
  -- inputs : CLK, nRST
  -- outputs: state
  reg: process (CLK, nRST)
  begin  -- process reg
    if nRST = '0' then                  -- asynchronous reset (active low)
      state <= IDLE;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      state <= nextstate;
    end if;
  end process reg;

  -- purpose: next state combinational logic
  -- type   : combinational
  -- inputs : state,START,STROBE
  -- outputs: STOP
  comb: process (state,START,STROBE)
  begin  -- process comb

    STOP <= '0';
    nextstate <= state;
    
    case state is
      when IDLE =>
        if START = '1' then
          nextstate <= STRT;
        end if;

      when STRT =>
        if STROBE = '1' then
          nextstate <= DATA1;
        end if;
        
      when DATA1 => 
        if STROBE = '1' then
          nextstate <= DATA2;
        end if;
        
      when DATA2 => 
        if STROBE = '1' then
          nextstate <= DATA3;
        end if;
        
      when DATA3 => 
        if STROBE = '1' then
          nextstate <= DATA4;
        end if;
        
      when DATA4 => 
        if STROBE = '1' then
          nextstate <= STP;
        end if;
        
      when STP =>
        nextstate <= IDLE;
        STOP <= '1';
                   
      when others => nextstate <= IDLE;
    end case;
    
  end process comb;

end rcu_arch;
