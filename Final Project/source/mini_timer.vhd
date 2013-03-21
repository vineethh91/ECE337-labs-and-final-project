-- $Id: $
-- File name:   mini_timer.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Gives equal time to both the master controller and bus controllers to write and read from SRAM.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity mini_timer is
    port (
        clk : in std_logic;
        rst : in std_logic;
        SRAM_control : out std_logic
    );
end entity;

architecture Mini_Timer of mini_timer is
    signal counter, nCounter : Integer range 0 to 19;
begin
    myReg: process (clk, rst)
    begin
        if (rst = '0') then
            counter <= 0;
        elsif (clk'event and clk = '1') then
            counter <= nCounter;
        end if;
    end process;
    
    SRAM_control <= '0' when (counter < 10) else '1';
    nCounter <= 0 when (counter = 19) else counter + 1;
end architecture;
