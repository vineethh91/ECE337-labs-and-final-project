-- $Id: $
-- File name:   i2c_slave.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: i2c slave top leve .


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity i2c_slave is
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    scl : in std_logic;
    sda_in : in std_logic;
    sda_out : out std_logic;
    write_enable : in std_logic;
    write_data : in std_logic_vector(7 downto 0);
    fifo_empty : out std_logic;
    fifo_full : out std_logic
  );
end entity i2c_slave;

architecture archI2CSlave of i2c_slave is
  
  
  COMPONENT controller
  port (
      clk : in std_logic;
      rst_n : in std_logic;
      stop_found : in std_logic;
      start_found : in std_logic;
      byte_received : in std_logic;
      ack_prep : in std_logic;
      check_ack : in std_logic;
      ack_done : in std_logic;
      rw_mode : in std_logic;
      address_match : in std_logic;
      sda_in : in std_logic;
      rx_enable : out std_logic;
      tx_enable : out std_logic;
      read_enable : out std_logic;
      sda_mode : out std_logic_vector(1 downto 0);
      load_data : out std_logic
  );
  end COMPONENT;
  
  COMPONENT decode
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
  end COMPONENT;
  
  COMPONENT rx_sr
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    sda_in : in std_logic;
    rising_edge_found : in std_logic;
    rx_enable : in std_logic;
    rx_data : out std_logic_vector(7 downto 0)
  );
  END COMPONENT;
  
  COMPONENT scl_edge
  port(
    clk    :  in std_logic;
    rst_n  :  in std_logic;
    scl    :  in std_logic;
    rising_edge_found : out std_logic;
    falling_edge_found : out std_logic
  );
  END COMPONENT; 
  
  COMPONENT sda_sel
  port(
    tx_out : in std_logic;
    sda_mode : in std_logic_vector(1 downto 0);
    sda_out : out std_logic
  );
  END COMPONENT;
  
  COMPONENT timer
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    rising_edge_found : in std_logic;
    falling_edge_found : in std_logic;
    stop_found : in std_logic;
    start_found : in std_logic;
    byte_received : out std_logic;
    ack_prep : out std_logic;
    check_ack : out std_logic;
    ack_done : out std_logic
    );
  END COMPONENT;
  
  COMPONENT tx_fifo
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
  END COMPONENT;
  
  COMPONENT tx_sr is
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    tx_out : out std_logic;
    falling_edge_found : in std_logic;
    tx_enable : in std_logic;
    tx_data : in std_logic_vector(7 downto 0);
    load_data : in std_logic
  );
  END COMPONENT;
  
  signal stopFound : std_logic;
  signal startFound : std_logic;
  signal byteReceived : std_logic;
  signal ackPrep : std_logic;
  signal checkAck : std_logic;
  signal ackDone : std_logic;
  signal rwMode : std_logic;
  signal addressMatch : std_logic;
  signal rxEnable : std_logic;
  signal txEnable : std_logic;
  signal readEnable : std_logic;
  signal sdaMode : std_logic_vector(1 downto 0);
  signal loadData : std_logic;
  signal readData : std_logic_vector(7 downto 0);
  signal rxData : std_logic_vector(7 downto 0);
  signal risingEdgeFound : std_logic;
  signal fallingEdgeFound : std_logic;
  signal txOut : std_logic;
  
begin
  
  A_1 : controller
  port map(
    clk => clk,
    rst_n => rst_n,
    stop_found => stopFound,
    start_found => startFound,
    byte_received => byteReceived,
    ack_prep => ackPrep,
    check_ack => checkAck,
    ack_done => ackDone,
    rw_mode => rwMode,
    address_match => addressMatch,
    sda_in => sda_in,
    rx_enable => rxEnable,
    tx_enable => txEnable,
    read_enable => readEnable,
    sda_mode => sdaMode,
    load_data => loadData
  );
  
  A_2 : decode
  port map(
    clk => clk,
    rst_n => rst_n,
    scl => scl,
    sda_in => sda_in,
    starting_byte => rxData,
    rw_mode => rwMode,
    address_match => addressMatch,
    stop_found => stopFound,
    start_found => startFound
  );
  
  A_3 : rx_sr
  port map(
    clk => clk,
    rst_n => rst_n,
    sda_in => sda_in,
    rising_edge_found => risingEdgeFound,
    rx_enable => rxEnable,
    rx_data => rxData
  );
  
  A_4 : scl_edge
  port map(
    clk => clk,
    rst_n  => rst_n,
    scl  => scl,
    rising_edge_found => risingEdgeFound,
    falling_edge_found => fallingEdgeFound
  );
  
  A_5 : sda_sel
  port map(
    tx_out => txOut,
    sda_mode => sdaMode,
    sda_out => sda_out
  );
  
  A_6 :  timer
  port map( 
    clk => clk,
    rst_n => rst_n,
    rising_edge_found => risingEdgeFound,
    falling_edge_found => fallingEdgeFound,
    stop_found => stopFound,
    start_found => startFound,
    byte_received => byteReceived,
    ack_prep => ackPrep,
    check_ack => checkAck,
    ack_done => ackDone
    );
  
  A_7 : tx_fifo
  port map(
    clk => clk,
    rst_n => rst_n,
    read_enable => readEnable,
    read_data => readData,
    fifo_empty => fifo_empty,
    fifo_full => fifo_full,
    write_enable => write_enable,
    write_data => write_data
  );
  
  A_8 : tx_sr
  port map(
    clk => clk,
    rst_n => rst_n, 
    tx_out => txOut,
    falling_edge_found => fallingEdgeFound,
    tx_enable => txEnable,
    tx_data => readData,
    load_data => loadData
  );
  
end  architecture archI2CSlave;