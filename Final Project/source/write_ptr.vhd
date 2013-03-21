-- $Id: $
-- File name:   write_ptr.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: This block holds a ptr of where to write in SRAM.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.all;

entity write_ptr is 
    port (
        clk : in std_logic;
        rst_ptr : in std_logic;
        inc_ptr : in std_logic;
        data_ptr : out std_logic_vector(8 downto 0)  
    );
end entity;

architecture writePtr of write_ptr is
    signal count, nCount : Integer range 0 to 390;
begin
    myReg: process (clk, rst_ptr)
    begin
        if (rst_ptr = '0') then
            count <= 0;
        elsif (clk'event and clk = '1') then
            count <= nCount;
        end if;
    end process;
    
    nCount <= count + 1 when inc_ptr = '1' else count; 
    
    data_ptr <= std_logic_vector(to_unsigned(count, 9));
end architecture;
