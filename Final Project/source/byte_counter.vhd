-- $Id: $
-- File name:   byte_counter.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Counts the number of bytes in a packet.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.all;

entity byte_counter is 
    port (
        clk : in std_logic;
        rst_count : in std_logic;
        inc_count : in std_logic;
        temp_ptr : out std_logic_vector(6 downto 0)  
    );
end entity;

architecture byteCounter of byte_counter is
    signal count, nCount : Integer range 0 to 78;
begin
    myReg: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (rst_count = '0') then
            	count <= 0;
            else
            	count <= nCount;
            end if;
        end if;
    end process;
    
    process (inc_count, count)
    begin
    	nCount <= count;
    	if (inc_count ='1') then
    		nCount <= count + 1;
    	end if;
    end process;
 --   nCount <= count + 1 when inc_count = '1' else count; 
    
    temp_ptr <= std_logic_vector(to_unsigned(count, 7));
end architecture;
