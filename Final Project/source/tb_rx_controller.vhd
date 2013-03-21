-- $Id: 	mg32
-- File name:   tb_rx_controller.vhd
-- Created:     11/20/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rx_controller is
generic (Period : Time := 4 ns);
end tb_rx_controller;

architecture TEST of tb_rx_controller is

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

  component rx_controller
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         d_edge : in std_logic;
         bit8 : in std_logic;
         eop : in std_logic;
         strobe : out std_logic;
         counting : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal d_edge : std_logic;
  signal bit8 : std_logic;
  signal eop : std_logic;
  signal strobe : std_logic;
  signal counting : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: rx_controller port map(
                clk => clk,
                rst => rst,
                d_edge => d_edge,
                bit8 => bit8,
                eop => eop,
                strobe => strobe,
                counting => counting
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    d_edge <= '0';
    bit8 <= '0';
    eop <= '0';
    wait for 20 ns;

    rst <= '1';
    wait for 4 ns;

    d_edge <= '1';
    wait for 4 ns;

    d_edge <= '0';
    wait for 20 ns;

    bit8 <= '1';
    wait for 4 ns;

    bit8 <= '0';
    wait for 16 ns;

    bit8 <= '1';
    wait for 20 ns;

    eop <= '1';
    wait for 20 ns;

    d_edge <= '1';
    eop <= '0';
    wait for 4 ns;

    eop <= '1';
    wait;

  end process;
end TEST;
