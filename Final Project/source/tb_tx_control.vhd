-- $Id: $
-- File name:   tb_tx_control.vhd
-- Created:     11/18/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tx_control is
generic (Period : Time := 10 ns);
end tb_tx_control;

architecture TEST of tb_tx_control is

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

  component tx_control
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         tx_enable : in std_logic;
         eop_done : in std_logic;
         sr_enable : out std_logic;
         timer_enable : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal tx_enable : std_logic;
  signal eop_done : std_logic;
  signal sr_enable : std_logic;
  signal timer_enable : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: tx_control port map(
                clk => clk,
                rst_n => rst_n,
                tx_enable => tx_enable,
                eop_done => eop_done,
                sr_enable => sr_enable,
                timer_enable => timer_enable
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0'; 
    tx_enable <= '0'; 
    eop_done <= '0'; 
    wait for 10 ns; 
    rst_n <= '1'; 
    wait for 20 ns; 
    tx_enable <= '1'; 
    wait for 40 ns; 
    tx_enable <= '0'; 
    wait for 20 ns; 
    eop_done <= '1';
    wait for 10 ns; 
    eop_done <= '0'; 
    wait; 

  end process;
end TEST;