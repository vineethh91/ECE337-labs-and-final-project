-- $Id: $
-- File name:   tb_tx_timer.vhd
-- Created:     11/20/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tx_timer is
generic (Period : Time := 10 ns);
end tb_tx_timer;

architecture TEST of tb_tx_timer is

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

  component tx_timer
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         timer_enable : in std_logic;
         transmit_data : in std_logic;
         shift_done : out std_logic;
         shift_strobe : out std_logic;
         bitstuff : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal timer_enable : std_logic;
  signal transmit_data : std_logic;
  signal shift_done : std_logic;
  signal shift_strobe : std_logic;
  signal bitstuff : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: tx_timer port map(
                clk => clk,
                rst_n => rst_n,
                timer_enable => timer_enable,
                transmit_data => transmit_data,
                shift_done => shift_done,
                shift_strobe => shift_strobe,
                bitstuff => bitstuff
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0'; 
    timer_enable <= '0';
    transmit_data <= '1';
    wait for 10 ns; 
    rst_n <= '1'; 
    wait for 20 ns; 
    timer_enable <= '1'; 
    wait for 1920 ns;
    timer_enable <= '0';
    wait for 10 ns;
    transmit_data <= '0';
    wait for 10 ns;
    timer_enable <= '1'; 
    wait for 1920 ns; 
    wait;  
    --timer_enable <= '0'; 
    --wait for 10 ns; 
    --transmit_data <= '1';
    --wait for 10 ns; 
    --timer_enable <= '1'; 
    --wait for 80 ns;
    --timer_enable <= '0';
    --wait; 

  end process;
end TEST;