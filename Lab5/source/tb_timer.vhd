-- $Id: $
-- File name:   tb_timer.vhd
-- Created:     9/26/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_timer is
generic (Period : Time := 2.5 ns);
end tb_timer;

architecture TEST of tb_timer is

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

  component timer
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         enable_timer : in std_logic;
         shift_strobe : out std_logic;
         packet_done : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal enable_timer : std_logic;
  signal shift_strobe : std_logic;
  signal packet_done : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: timer port map(
                clk => clk,
                rst => rst,
                enable_timer => enable_timer,
                shift_strobe => shift_strobe,
                packet_done => packet_done
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '1';
    wait for 5 ns;
    rst <= '0';
    
    wait for 5 ns;
    

    enable_timer <= '1';
    wait for 10 ns;
    enable_timer <= '0';
    
    wait for 300 ns;
  
    enable_timer <= '1';
    wait for 10 ns;
    enable_timer <= '0';
    
    wait for 300 ns;
  
    rst <= '1';
    wait for 5 ns;
    rst <= '0';
  
    enable_timer <= '1';
    wait for 10 ns;
    enable_timer <= '0';
    
    wait for 300 ns;
  

  
  end process;
end TEST;