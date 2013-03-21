-- $Id: $
-- File name:   sda_sel.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: sda select .


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity sda_sel is
  port(
    tx_out : in std_logic;
    sda_mode : in std_logic_vector(1 downto 0);
    sda_out : out std_logic
  );
end entity sda_sel;

architecture archSdaSel of sda_sel is
begin
  
  -- tx_out
  with sda_mode select
    sda_out <= tx_out when "11",
      -- ACK
               '0' when "01",
    -- NACK
               '1' when "10",
    -- idle line value
               '1' when OTHERS;
end architecture archSdaSel;
