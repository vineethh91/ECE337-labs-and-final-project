-- $Id: 	mg32
-- File name:   tb_rx_decode.vhd
-- Created:     11/20/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rx_decode is
generic (Period : Time := 4 ns);
end tb_rx_decode;

architecture TEST of tb_rx_decode is

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

  component rx_decode
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         d_plus : in std_logic;
         shift_en : in std_logic;
         d_orig : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal d_plus : std_logic;
  signal shift_en : std_logic;
  signal d_orig : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: rx_decode port map(
                clk => clk,
                rst => rst,
                d_plus => d_plus,
                shift_en => shift_en,
                d_orig => d_orig
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    d_plus <= '1';
    shift_en <= '0';
    wait for 18 ns;

    rst <= '1';
    d_plus <= '0';
    wait for 8 ns;

    shift_en <= '1';
    wait for 4 ns;

    shift_en <= '0';
    wait for 4 ns;

    d_plus <= '1';
    wait for 8 ns;

    shift_en <= '1';
    wait for 4 ns;

    shift_en <= '0';
    wait for 4 ns;

    d_plus <= '0';
    wait for 8 ns;

    shift_en <= '1';
    wait for 4 ns;

    shift_en <= '0';
    wait for 8 ns;
    
    shift_en <= '1';
    wait for 4 ns;
    
    shift_en <= '0';
    wait;

  end process;
end TEST;
