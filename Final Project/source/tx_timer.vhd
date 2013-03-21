-- $Id: $
-- File name:   tx_timer.vhd
-- Created:     11/18/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Timer block.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tx_timer is port(
    clk             : in std_logic;
    rst_n           : in std_logic;
    timer_enable    : in std_logic; 
    transmit_data   : in std_logic;
    shift_done      : out std_logic;
    shift_strobe    : out std_logic;
    bitstuff        : out std_logic); 
end tx_timer;

architecture timerBlock of tx_timer is
    --Declarations
    type state_type is (idle, bitstuffer, clearstuff, nostuff, countwait, done_byte);
    signal currentState, nextState : state_type; 
    signal currentCount, nextCount : std_logic_vector(7 downto 0);
    signal strobecount, nextstrobecount : std_logic_vector(7 downto 0);
    signal countup, incrementonecount, clearonecount : std_logic;
    signal onecount, nextonecount : std_logic_vector(7 downto 0);
    signal bitstuffingflag : std_logic; 
begin

    --Counter Code
    counterReg : process (clk, rst_n)
    begin
        if(rst_n = '0') then
            currentCount <= (others => '0');
            strobecount <= (others => '0');
            onecount <= (others => '0'); 
        elsif (rising_edge(clk)) then
            currentCount <= nextCount; 
            strobecount <= nextstrobecount; 
            onecount <= nextonecount; 
        end if;
    end process; 
    
    nextCountLogic : process(currentCount, timer_enable)
    begin
        if (timer_enable = '1') then
            if (currentCount = "00010100") then --UPDATE THIS 20 in binary
                nextCount <= "00000000"; 
            else
                nextCount <= currentCount + '1'; 
            end if; 
            
        elsif (timer_enable = '0') then
            nextCount <= "00000000"; 
        end if; 
    end process; 
    
    
    countOutputLogic : process(currentCount, currentState, nextState, strobecount, transmit_data, onecount)
    begin
        countup <= '0';
        nextstrobecount <= strobecount; --Default value, to avoid inferred latch
        if (currentState <= idle) then
          nextstrobecount <= "00000000"; 
        else 
          if (currentCount = "00010011") then 
            countup <= '1';
            if (not((onecount = "00000101") and (transmit_data = '1'))) then
              nextstrobecount <= strobecount + '1'; 
            end if;
          end if;       
        end if;
    end process; 
    
    --State Machine Code
    stateReg : process (clk, rst_n)
    begin
        if (rst_n = '0') then
            currentState <= idle;
        elsif (rising_edge(clk)) then
            currentState <= nextState;
        end if; 
    end process;
    
    nextStateLogic : process (currentState, timer_enable, countup, onecount, transmit_data, strobecount)
    begin
        nextState <= currentState;
        case currentState is 
            when idle =>
                if (timer_enable = '1') then
                    nextState <= countwait;
                end if; 
                
            when countwait =>
                if ((countup = '1') and not(onecount = "00000101") and (transmit_data = '1')) then
                    nextState <= nostuff;
                elsif ((countup = '1') and (onecount = "00000101") and (transmit_data = '1')) then
                    nextState <= bitstuffer;
                elsif ((countup = '1') and (transmit_data = '0')) then
                    nextState <= clearstuff; 
                end if;
                
            when clearstuff =>
                if (strobecount = "00001000") then
                    nextState <= done_byte; 
                else
                    nextState <= countwait; 
                end if; 
                
                
            when nostuff =>
                if (strobecount = "00001000") then
                    nextState <= done_byte; 
                else
                    nextState <= countwait; 
                end if; 
                
            when bitstuffer =>
                nextState <= countwait; 
                
            when done_byte =>
                nextState <= idle; 
        end case; 
    end process; 
    
    outputLogic : process (currentState)
    begin
        --Initializations/Defaults
        --countup <= '0';
        bitstuff <= '0';
        bitstuffingflag <= '0';
        clearonecount <= '0';         
        incrementonecount <= '0'; 
        shift_strobe <= '0';
        shift_done <= '0';
        
        case currentState is 
            when idle =>
                
            when countwait =>
                
            when clearstuff =>
                --countup <= '1';             
                clearonecount <= '1'; 
                shift_strobe <= '1'; 
                
            when nostuff =>
                incrementonecount <= '1'; 
                shift_strobe <= '1'; 
                
            when bitstuffer =>
                clearonecount <= '1'; 
                bitstuff <= '1'; 
                bitstuffingflag <= '1'; 
            when done_byte =>
                shift_done <= '1'; 
                
        end case;     
    end process; 
    
    oneCounting : process (incrementonecount, clearonecount, onecount, currentstate)
    begin
      nextonecount <= onecount; --Default value to avoid inferred latch
      if (currentState = idle) then
        --onecount <= "00000000";
        nextonecount <= "00000000";
      else
        if (incrementonecount = '1') then
          nextonecount <= onecount + '1'; 
        elsif (clearonecount = '1') then
          nextonecount <= "00000000"; 
        end if;       
      end if;
    end process; 
    
end timerBlock; 
