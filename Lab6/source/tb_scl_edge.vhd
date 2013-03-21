-- $Id: $
-- File name:   tb_scl_edge.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_scl_edge is
generic (Period : Time := 10 ns);
end tb_scl_edge;

architecture TEST of tb_scl_edge is

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

  component scl_edge
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         scl : in std_logic;
         rising_edge_found : out std_logic;
         falling_edge_found : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal scl : std_logic;
  signal rising_edge_found : std_logic;
  signal falling_edge_found : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: scl_edge port map(
                clk => clk,
                rst_n => rst_n,
                scl => scl,
                rising_edge_found => rising_edge_found,
                falling_edge_found => falling_edge_found
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
                                    -- run for 230ns
-- Insert TEST BENCH Code Here
    scl <= '1';
    rst_n <= '0';
    wait for 10 ns;
    rst_n <= '1';
    wait for 10 ns;
    
    wait for 51 ns;
    scl <= '0';
    wait for 50 ns;
    scl <= '1';
    wait for 50 ns;
    scl <= '0';
    wait for 50 ns;

  end process;
end TEST;