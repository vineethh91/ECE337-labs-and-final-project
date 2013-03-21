-- $Id: $
-- File name:   transceiver.vhd
-- Created:     11/22/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: transceiver level entity


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity transceiver is
  port (
      clk : in std_logic;
      rst_n : in std_logic;
      d_plus_in		: in  std_logic;  --  USB D+
      d_plus_out		: out std_logic;  --  USB D+
      d_minus_in		: in  std_logic;  --  USB D-
      d_minus_out		: out std_logic;  --  USB D-
      d_enable		: out std_logic;  --  USB data pin enable
      bus_IN_data1 : in std_logic_vector(9 downto 0); -- incoming 10 bit bus data from other transceivers      
      bus_IN_data2 : in std_logic_vector(9 downto 0); -- incoming 10 bit bus data from other transceivers      
      bus_IN_data3 : in std_logic_vector(9 downto 0); -- incoming 10 bit bus data from other transceivers      
      bus_IN_data4 : in std_logic_vector(9 downto 0); -- incoming 10 bit bus data from other transceivers      
      
      bus_OUT_data : out std_logic_vector(9 downto 0) -- outgoing 10 bit bus data to other transceivers
  );
end entity transceiver;

architecture archTransceiver of transceiver is
   signal state : std_logic;
  
begin
  stateRegister : process(clk, rst_n)
  begin
    if (rst_n = '0') then
      state <= '0';
    elsif(rising_edge(clk)) then
      state <= '1';
    end if;
  end process;

  bus_OUT_data <= "111100000" & state;
  
end architecture archTransceiver;