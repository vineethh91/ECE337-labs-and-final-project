-- $Id: $
-- File name:   sync.vhd
-- Created:     9/15/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: synchronizer
-- ;


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

Entity sync is
  port(
    clk      : in std_logic;
    nReset   : in std_logic;
    A        : in std_logic;
    A_sync   : out std_logic);
end sync;

architecture archSynchronizer of sync is
  signal areg, sync_reg   : std_logic;
  signal anext, sync_next : std_logic;
begin
  synchronize: process(clk, nReset)
  begin
    if(nReset = '0') then
      areg <= '0';
      sync_reg <= '0';
    elsif rising_edge(clk) then
      areg <= anext;
      sync_reg <= sync_next;
    end if;
  end process;
  
  anext <= A;
  sync_next <= areg;
  
  A_sync <= sync_reg;
end archSynchronizer;
      
  