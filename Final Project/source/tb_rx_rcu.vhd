-- $Id: $
-- File name:   tb_rx_rcu.vhd
-- Created:     11/22/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_rx_rcu is
generic (Period : Time := 4 ns);
end tb_rx_rcu;

architecture TEST of tb_rx_rcu is

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

  component rx_rcu
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         d_orig : in std_logic;
         d_edge : in std_logic;
         eop : in std_logic;
         shift_en : out std_logic;
         strobe : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal d_orig : std_logic;
  signal d_edge : std_logic;
  signal eop : std_logic;
  signal shift_en : std_logic;
  signal strobe : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: rx_rcu port map(
                clk => clk,
                rst => rst,
                d_orig => d_orig,
                d_edge => d_edge,
                eop => eop,
                shift_en => shift_en,
                strobe => strobe
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    d_orig <= '1';
    d_edge <= '0';
    eop <= '0';
    wait for 11 ns;
    
    rst <= '1';
    wait for 8 ns;
    
    d_edge <= '1';
    wait for 4 ns;
    
    d_edge <= '0';
    wait for 1400 ns;
    
    rst <= '0';
    wait for 11 ns;
    
    rst <= '1';
    wait for 12 ns;
    
    d_edge <= '1';
    wait for 4 ns;
    
    d_edge <= '0';
    wait for 320 ns;
    
    d_orig <= '0';
    wait for 320 ns;
    
    d_orig <= '1';
    wait for 400 ns;
    
    d_orig <= '0';
    wait for 220 ns;
    
    eop <= '1';
    wait for 8 ns;
    
    eop <= '0';
    wait for 100 ns;
    
    d_edge <= '1';
    wait for 4 ns;
    
    d_edge <= '0';
    wait for 240 ns;
    
    d_orig <= '1';
    wait for 240 ns;
    
    d_orig <= '0';
    wait for 160 ns;
    
    rst <= '0';
    wait;   
    

  end process;
end TEST;