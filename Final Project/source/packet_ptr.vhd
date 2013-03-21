-- $Id: $
-- File name:   packet_ptr.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Holds a pointer to SRAM memory where the packet currently is.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.all;

entity packet_ptr is 
    port (
        clk : in std_logic;
        write_to_ptr : in std_logic;
        new_ptr : in std_logic_vector(8 downto 0);
        pkt_ptr : out std_logic_vector(8 downto 0)  
    );
end entity;

architecture packetPtr of packet_ptr is
    signal temp, nTemp : Integer range 0 to 390;
begin
    myReg: process (clk)
    begin
        if (clk'event and clk = '1') then
            temp <= nTemp;
        end if;
    end process;
    
    nTemp <= temp when write_to_ptr = '0' else to_integer(unsigned(new_ptr)); 
    
    pkt_ptr <= std_logic_vector(to_unsigned(temp, 9));
end architecture;
