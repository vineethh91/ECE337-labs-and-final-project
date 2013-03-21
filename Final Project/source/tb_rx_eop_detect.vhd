-- $Id: 	mg32
-- File name:   tb_rx_eop_detect.vhd
-- Created:     11/20/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rx_eop_detect is
end tb_rx_eop_detect;

architecture TEST of tb_rx_eop_detect is

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

  component rx_eop_detect
    PORT(
         d_plus : in std_logic;
         d_minus : in std_logic;
         eop : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal d_plus : std_logic;
  signal d_minus : std_logic;
  signal eop : std_logic;

-- signal <name> : <type>;

begin
  DUT: rx_eop_detect port map(
                d_plus => d_plus,
                d_minus => d_minus,
                eop => eop
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    d_plus  <= '1';
    d_minus <= '1';
    wait for 20 ns;

    d_plus  <= '0';
    d_minus <= '0';
    wait for 20 ns;

    d_plus  <= '1';
    d_minus <= '1';
    wait for 20 ns;
    
    d_plus  <= '0';
    wait for 20 ns;
    
    d_plus  <= '1';
    d_minus <= '0';
    wait for 20 ns;
    
    d_minus <= '1';
    wait for 20 ns;
    
    d_plus  <= '0';
    d_minus <= '0';
    wait;

  end process;
end TEST;
