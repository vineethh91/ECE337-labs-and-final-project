-- $Id: $
-- File name:   tb_tx_sr.vhd
-- Created:     11/18/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_tx_sr is
generic (Period : Time := 10 ns);
end tb_tx_sr;

architecture TEST of tb_tx_sr is

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

  component tx_sr
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         shift_strobe : in std_logic;
         shift_done : in std_logic;
         load_data : in std_logic;
         sr_enable : in std_logic;
         transmit_data : out std_logic;
         data_out : in std_logic_vector(7 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal shift_strobe : std_logic;
  signal shift_done : std_logic;
  signal load_data : std_logic;
  signal sr_enable : std_logic;
  signal transmit_data : std_logic;
  signal data_out : std_logic_vector(7 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: tx_sr port map(
                clk => clk,
                rst_n => rst_n,
                shift_strobe => shift_strobe,
                shift_done => shift_done,
                load_data => load_data,
                sr_enable => sr_enable,
                transmit_data => transmit_data,
                data_out => data_out
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0'; 
    shift_strobe <= '0'; 
    shift_done <= '0';
    load_data <= '0';
    sr_enable <= '0';
    data_out <= "11001101";
    wait for 10 ns; 
    rst_n <= '1'; 
    sr_enable <= '1'; 
    load_data<= '1';
   
    wait for 10 ns; 
   
    load_data <= '0';
   
    wait for 10 ns;    
    shift_strobe <= '1'; --1
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --2
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --3
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --4
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --5
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --6
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --7
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --8
    wait for 10 ns;
    shift_strobe <= '0'; 
    
    data_out <= "01010101"; 

    wait for 10 ns;
    shift_done <= '1'; 
    wait for 10 ns; 
    load_data <= '1'; 
    shift_done <= '0';
    wait for 10 ns; 
    load_data <= '0'; 
 
    wait for 10 ns;    
    shift_strobe <= '1'; --1
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --2
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --3
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --4
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --5
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --6
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --7
    wait for 10 ns;
    shift_strobe <= '0'; 
    wait for 10 ns;    
    shift_strobe <= '1'; --8
    wait for 10 ns;
    shift_strobe <= '0'; 

    wait for 10 ns;
    
    
    wait; 
  end process;
end TEST;