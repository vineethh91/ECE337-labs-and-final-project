-- $Id: $
-- File name:   tb_USB_rx.vhd
-- Created:     11/22/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_USB_rx is
generic (Period : Time := 4 ns);
end tb_USB_rx;

architecture TEST of tb_USB_rx is

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

  component USB_rx
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         d_plus : in std_logic;
         d_minus : in std_logic;
         USB_Data : out std_logic_vector (7 downto 0);
         Byte_Done : out std_logic;
         EOP : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal d_plus : std_logic;
  signal d_minus : std_logic;
  signal USB_Data : std_logic_vector (7 downto 0);
  signal Byte_Done : std_logic;
  signal EOP : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: USB_rx port map(
                clk => clk,
                rst => rst,
                d_plus => d_plus,
                d_minus => d_minus,
                USB_Data => USB_Data,
                Byte_Done => Byte_Done,
                EOP => EOP
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    d_plus <= '1';
    d_minus <= '1';
    wait for 11 ns;
    
    rst <= '1';
    wait for 80 ns;
    
    d_plus <= '0';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    wait for 20 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    rst <= '0';
    wait for 10 ns;
    
    rst <= '1';
    wait for 10 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    rst <= '0';
    wait for 40 ns;
    
    rst <= '1';
    wait for 40 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 730 ns;
    
    d_plus <= '0';
    d_minus <= '0';
    wait for 160 ns;
    
    d_plus <= '1';
    d_minus <= '1';
    wait for 160 ns;
    
    -- After EOP
    
    d_plus <= '0';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    wait for 20 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    rst <= '0';
    wait for 10 ns;
    
    rst <= '1';
    wait for 10 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 80 ns;
    
    d_plus <= '1';
    d_minus <= '0';
    wait for 80 ns;
    
    rst <= '0';
    wait for 40 ns;
    
    rst <= '1';
    wait for 40 ns;
    
    d_plus <= '0';
    d_minus <= '1';
    wait for 730 ns;
    
    d_plus <= '0';
    d_minus <= '0';
    wait for 160 ns;
    
    

  end process;
end TEST;