-- $Id: $
-- File name:   decode.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: decoder


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity decode is
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    scl : in std_logic;
    sda_in : in std_logic;
    starting_byte : in std_logic_vector(7 downto 0);
    rw_mode : out std_logic;
    address_match : out std_logic;
    stop_found : out std_logic;
    start_found : out std_logic
  );
end entity decode;

architecture archDecoder of decode is 
  signal Q_int1   : std_logic;
  signal Q_int2   : std_logic;
  signal Q_int3   : std_logic;
  signal sclFF    : std_logic;
  
begin
                                                -- change to Qint2 and Qint3 if unstable
start_found <= (not(Q_int1)) and Q_int2 and sclFF;
stop_found <= Q_int1 and (not(Q_int2)) and sclFF;

-- assign R/W mode
rw_mode <= starting_byte(0);
 
address_match <= '1' when (starting_byte(7 downto 1) = "1111000") else '0';
 
  REG: process(clk,rst_n)
  begin
    If ('0' = rst_n) then
      Q_int3      <= '1';
      Q_int2  <= '1';
      Q_int1  <= '1';
      sclFF   <= '1';
    elsif (rising_edge(clk)) then
      Q_int3   <= Q_int2;
      Q_int2   <= Q_int1;
      Q_int1   <= sda_in;
      sclFF    <= scl;
    end if;
  end process;
      
end architecture archDecoder;
