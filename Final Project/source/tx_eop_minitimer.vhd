-- $Id: $
-- File name:   tx_eop_minitimer.vhd
-- Created:     11/22/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: EOP Mini Timer block.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tx_eop_minitimer is port(
    clk             : in std_logic;
    rst_n           : in std_logic;
    eop_time        : in std_logic;
    eop_done        : out std_logic); 
end tx_eop_minitimer;

architecture minitimer of tx_eop_minitimer is
    signal currentCount, nextCount : std_logic_vector(7 downto 0);    
  begin 
    
    counterReg : process (clk, rst_n)
    begin
        if(rst_n = '0') then
            currentCount <= (others => '0');
        elsif (rising_edge(clk)) then
            currentCount <= nextCount; 
        end if;
    end process; 
    
    nextCountLogic : process(currentCount, eop_time)
    begin
        if (eop_time = '1') then
            nextCount <= currentCount + '1'; 
        elsif (eop_time = '0') then
            nextCount <= "00000000"; 
        end if; 
    end process; 
    
    outputCountLogic : process (currentCount)
    begin
      eop_done <= '0';
      if (currentCount = "00101000") then --if count is 40, eop is done (lines held low 2 bits)
        eop_done <= '1'; 
      end if;
    end process;
  
end architecture;