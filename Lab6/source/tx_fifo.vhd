-- $Id: $
-- File name:   tx_fifo.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: fifo wrapper


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
LIBRARY ECE337_IP;
USE ECE337_IP.all;

entity tx_fifo is
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    read_enable : in std_logic;
    read_data : out std_logic_vector(7 downto 0);
    fifo_empty : out std_logic;
    fifo_full : out std_logic;
    write_enable : in std_logic;
    write_data : in std_logic_vector(7 downto 0)
  );
end entity tx_fifo;

architecture archTxFifo of tx_fifo is
  component Fifo
    port (
    RCLK : in std_logic;
    WCLK : in std_logic;
    RST_N : in std_logic;
    RENABLE : in std_logic;
    WENABLE : in std_logic;
    WDATA : in std_logic_vector(7 downto 0);
    RDATA : out std_logic_vector(7 downto 0);
    EMPTY : out std_logic;
    FULL : out std_logic);
  end component;
  
begin
  myAwesomeLabel : Fifo
    port map(
     RCLK => clk,
     WCLK => clk,
     RST_N => rst_n,
     RENABLE => read_enable,
     WENABLE => write_enable,
     WDATA => write_data,
     RDATA => read_data,
     EMPTY => fifo_empty,
     FULL => fifo_full
   );
  
end architecture archTxFifo;
 
      