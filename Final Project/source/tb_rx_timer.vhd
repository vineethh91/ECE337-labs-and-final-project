-- $Id: 	mg32
-- File name:   tb_rx_timer.vhd
-- Created:     11/20/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rx_timer is
generic (Period : Time := 4 ns);
end tb_rx_timer;

architecture TEST of tb_rx_timer is

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

  component rx_timer
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         d_orig : in std_logic;
         counting : in std_logic;
         bit_8 : out std_logic;
         shift_de : out std_logic;
         shift_re : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal d_orig : std_logic;
  signal counting : std_logic;
  signal bit_8 : std_logic;
  signal shift_de : std_logic;
  signal shift_re : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: rx_timer port map(
                clk => clk,
                rst => rst,
                d_orig => d_orig,
                counting => counting,
                bit_8 => bit_8,
                shift_de => shift_de,
                shift_re => shift_re
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    d_orig <= '1';
    counting <= '0';
    wait for 20 ns;

    rst <= '1';
    counting <= '1';
    wait for 320 ns;

    counting <= '0';
    wait for 20 ns;

    counting <= '1';
    wait for 20 ns;

    d_orig <= '0';
    wait for 160 ns;

    rst <= '0';
    counting <= '0';
    wait for 12 ns;

    rst <= '1';
    wait for 8 ns;

    d_orig <= '1';
    counting <= '1';
    wait for 540 ns;

    d_orig <= '0';
    wait;

  end process;
end TEST;
