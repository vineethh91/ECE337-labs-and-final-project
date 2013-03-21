-- $Id: $
-- File name:   controller_decoder.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Switches between using the bus controller addresses and the master controller addresses.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity controller_decoder is
    port (
        clk : in std_logic;
        rst : in std_logic;
        SRAM_control : in std_logic;
        master_addr : in std_logic_vector(8 downto 0);
        cont_addr : in std_logic_vector(8 downto 0);
        SRAM_addr : out std_logic_vector(8 downto 0)
    );
end entity;

architecture address_decoder of controller_decoder is
begin
    SRAM_addr <= master_addr when (SRAM_control = '0') else cont_addr;
end architecture;

