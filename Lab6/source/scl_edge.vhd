-- $Id: $
-- File name:   scl_edge.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: scl edge detector


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity scl_edge is
  port(
    clk    :  in std_logic;
    rst_n  :  in std_logic;
    scl    :  in std_logic;
    rising_edge_found : out std_logic;
    falling_edge_found : out std_logic
  );
end entity scl_edge; 

architecture archSclEdge of scl_edge is

  signal Q_int1   : std_logic;
  signal Q_int2   : std_logic;
  signal Q_int3   : std_logic;

begin
                           ------- IF SCL goes low EXACTLY on the clock edge as opposed to +/- a few ns then shit hits the roof and goes metastable
falling_edge_found <= (not(Q_int1)) and Q_int2;
rising_edge_found <= Q_int1 and (not(Q_int2));
 
REG: process(clk,rst_n)
begin
  If ('0' = rst_n) then
    Q_int3  <= '1';
    Q_int2  <= '1';
    Q_int1  <= '1';
  elsif (rising_edge(clk)) then
    Q_int3   <= Q_int2;
    Q_int2   <= Q_int1;
    Q_int1   <= scl;
  end if;
end process;

end architecture archSclEdge;


--- rising and falling edge signals are 1 clock cycle off