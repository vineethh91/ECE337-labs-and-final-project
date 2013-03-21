-- $Id: $
-- File name:   tb_bitstuffer.vhd
-- Created:     11/20/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_bitstuffer is
end tb_bitstuffer;

architecture TEST of tb_bitstuffer is

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

  component bitstuffer
    PORT(
         bitstuff : in std_logic;
         transmit_data : in std_logic;
         data_output : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal bitstuff : std_logic;
  signal transmit_data : std_logic;
  signal data_output : std_logic;

-- signal <name> : <type>;

begin
  DUT: bitstuffer port map(
                bitstuff => bitstuff,
                transmit_data => transmit_data,
                data_output => data_output
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    bitstuff <= '0';
    transmit_data <= '1';  
    wait for 20 ns; 
    bitstuff <= '1';
    wait for 20 ns;
    bitstuff <= '0'; 
    wait for 20 ns;
    transmit_data <= '0';
    wait for 10 ns;
    transmit_data <= '1'; 
    wait; 

  end process;
end TEST;