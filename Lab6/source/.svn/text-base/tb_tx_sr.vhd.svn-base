-- $Id: $
-- File name:   tb_tx_sr.vhd
-- Created:     9/30/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tx_sr is
generic (Period : Time := 10 ns);
end tb_tx_sr;

architecture TEST of tb_tx_sr is

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

  component tx_sr
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         tx_out : out std_logic;
         falling_edge_found : in std_logic;
         tx_enable : in std_logic;
         tx_data : in std_logic_vector(7 downto 0);
         load_data : in std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal tx_out : std_logic;
  signal falling_edge_found : std_logic;
  signal tx_enable : std_logic;
  signal tx_data : std_logic_vector(7 downto 0);
  signal load_data : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: tx_sr port map(
                clk => clk,
                rst_n => rst_n,
                tx_out => tx_out,
                falling_edge_found => falling_edge_found,
                tx_enable => tx_enable,
                tx_data => tx_data,
                load_data => load_data
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
                                          ---- run 650ns
-- Insert TEST BENCH Code Here

    rst_n <= '0';
    
    falling_edge_found <= '0';

    tx_enable <= '0';

    tx_data <= "00000000";

    load_data <= '0';
    
    wait for 2 ns;
    rst_n <= '1';
  
  -- load the tx_data
    tx_data <= "10101101";
    load_data <= '1';
    wait for 10 ns;
    load_data <= '0';
    
-- shift out bit 1111111 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
-- shift out bit 2222222 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 333333 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
     
 -- shift out bit 44444444 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 55555555 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 66666666 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 777777 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
  
  
-- shift out bit 8888888 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
          
    wait for 50 ns;

  
    -- load the tx_data
    tx_data <= "11111111";
    load_data <= '1';
    wait for 10 ns;
    load_data <= '0';
    
-- shift out bit 1111111 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
-- shift out bit 2222222 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 333333 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
     
 -- shift out bit 44444444 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 55555555 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 66666666 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 777777 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
  
  
-- shift out bit 8888888 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
          
    wait for 50 ns;
  
      -- load the tx_data
    tx_data <= "00000000";
    load_data <= '1';
    wait for 10 ns;
    load_data <= '0';
    
-- shift out bit 1111111 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
-- shift out bit 2222222 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 333333 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
     
 -- shift out bit 44444444 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 55555555 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 66666666 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
    
 -- shift out bit 777777 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
  
  
-- shift out bit 8888888 by generating pulse on falling_edge and tx_enable
    falling_edge_found <= '1';
    tx_enable <= '1';
    wait for 10 ns;
    
    falling_edge_found <= '0';
    tx_enable <= '0';
    wait for 10 ns;
          
    wait for 50 ns;
    
  end process;
end TEST;