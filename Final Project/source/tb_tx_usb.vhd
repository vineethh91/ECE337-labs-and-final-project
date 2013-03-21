-- $Id: $
-- File name:   tb_tx_usb.vhd
-- Created:     11/22/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tx_usb is
generic (Period : Time := 4.16 ns);
end tb_tx_usb;

architecture TEST of tb_tx_usb is

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

  component tx_usb
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         tx_enable : in std_logic;
         data_out : in std_logic_vector(7 downto 0);
         load_data : in std_logic;
         tx_idle : out std_logic;
         data_minus_out : out std_logic;
         data_plus_out : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal tx_enable : std_logic;
  signal data_out : std_logic_vector(7 downto 0);
  signal load_data : std_logic;
  signal tx_idle : std_logic;
  signal data_minus_out : std_logic;
  signal data_plus_out : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: tx_usb port map(
                clk => clk,
                rst_n => rst_n,
                tx_enable => tx_enable,
                data_out => data_out,
                load_data => load_data,
                tx_idle => tx_idle,
                data_minus_out => data_minus_out,
                data_plus_out => data_plus_out
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0';
    tx_enable <= '0';
    data_out <= "01010101";
    load_data <= '0';
    wait for 10 ns;
    
    rst_n <= '1';
    tx_enable <= '1';
    load_data <= '1'; 
    wait for 10 ns;
    load_data <= '0';

    wait;
  end process;
end TEST;