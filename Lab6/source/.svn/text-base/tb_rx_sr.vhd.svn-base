-- $Id: $
-- File name:   tb_rx_sr.vhd
-- Created:     10/1/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_rx_sr is
generic (Period : Time := 10 ns);
end tb_rx_sr;

architecture TEST of tb_rx_sr is

  function UINT_TO_STDV( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
  begin
    return std_logic_vector(to_unsigned(X, NumBits));
  end;

  function STDV_TO_UINT( X: std_logic_vector)
     return integer is
  begin
    return to_integer(unsigned(x));
  end;

  component rx_sr
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         sda_in : in std_logic;
         rising_edge_found : in std_logic;
         rx_enable : in std_logic;
         rx_data : out std_logic_vector(7 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal sda_in : std_logic;
  signal rising_edge_found : std_logic;
  signal rx_enable : std_logic;
  signal rx_data : std_logic_vector(7 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: rx_sr port map(
                clk => clk,
                rst_n => rst_n,
                sda_in => sda_in,
                rising_edge_found => rising_edge_found,
                rx_enable => rx_enable,
                rx_data => rx_data
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
                                                      ------ RUN 650 ns
-- Insert TEST BENCH Code Here

    rst_n <= '0';

    sda_in <= '0';

    rising_edge_found <= '0';

    rx_enable <= '0';
    
    wait for 7 ns;
    rst_n <= '1';
    
    wait for 10 ns;
                      ---- SENDING 11111111
    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;
    
  --  rst <= '0';
  --  wait for 10 ns;
  -- rst <= '1';
    wait for 50 ns; 
                        ---- SENDING 00001111
    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;
    

    wait for 50 ns;
    
                        ---- SENDING 10101010
    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '1';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;

    -- send a bit
    sda_in <= '0';
    rising_edge_found <= '1';
    rx_enable <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
    rx_enable <= '0';
    wait for 10 ns;
    
    wait for 50 ns;
    
  end process;
end TEST;