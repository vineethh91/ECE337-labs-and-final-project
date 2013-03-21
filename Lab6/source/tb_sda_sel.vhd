-- $Id: $
-- File name:   tb_sda_sel.vhd
-- Created:     9/30/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_sda_sel is
end tb_sda_sel;

architecture TEST of tb_sda_sel is

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

  component sda_sel
    PORT(
         tx_out : in std_logic;
         sda_mode : in std_logic_vector(1 downto 0);
         sda_out : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal tx_out : std_logic;
  signal sda_mode : std_logic_vector(1 downto 0);
  signal sda_out : std_logic;

-- signal <name> : <type>;

begin
  DUT: sda_sel port map(
                tx_out => tx_out,
                sda_mode => sda_mode,
                sda_out => sda_out
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
                                          ---------- run for 180ns
-- Insert TEST BENCH Code Here

    tx_out <= '0';

    sda_mode <= "00";
    wait for 20 ns;
    
    sda_mode <= "01";
    wait for 20 ns;
    
    sda_mode <= "10";
    wait for 20 ns;
    
    sda_mode <= "11";
    wait for 20 ns;
    
    
    
    tx_out <= '1';

    sda_mode <= "00";
    wait for 20 ns;
    
    sda_mode <= "01";
    wait for 20 ns;
    
    sda_mode <= "10";
    wait for 20 ns;
    
    sda_mode <= "11";
    wait for 20 ns;
  end process;
end TEST;