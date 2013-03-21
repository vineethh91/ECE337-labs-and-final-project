-- $Id: $
-- File name:   tb_i2c_slave.vhd
-- Created:     10/9/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_i2c_slave is
generic (Period : Time := 10 ns);
end tb_i2c_slave;

architecture TEST of tb_i2c_slave is

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

  component i2c_slave
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         scl : in std_logic;
         sda_in : in std_logic;
         sda_out : out std_logic;
         write_enable : in std_logic;
         write_data : in std_logic_vector(7 downto 0);
         fifo_empty : out std_logic;
         fifo_full : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal scl : std_logic;
  signal sda_in : std_logic;
  signal sda_out : std_logic;
  signal write_enable : std_logic;
  signal write_data : std_logic_vector(7 downto 0);
  signal fifo_empty : std_logic;
  signal fifo_full : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: i2c_slave port map(
                clk => clk,
                rst_n => rst_n,
                scl => scl,
                sda_in => sda_in,
                sda_out => sda_out,
                write_enable => write_enable,
                write_data => write_data,
                fifo_empty => fifo_empty,
                fifo_full => fifo_full
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0';

    scl <= '1';

    sda_in <= '1';

    write_enable <= '0';

    write_data <= "00000000";
    
    wait for 6 ns;
    
    rst_n <= '1';
    
       ---- write data to the stupid fifo

    write_data <= "10101010";
    wait for 10 ns;
    write_enable <= '1';
    wait for 10 ns;
    write_enable <= '0';

    write_data <= "01111110";
    wait for 10 ns;
    write_enable <= '1';
    wait for 10 ns;
    write_enable <= '0';
  
    write_data <= "00110011";
    wait for 10 ns;
    write_enable <= '1';
    wait for 10 ns;
    write_enable <= '0';
       
    
    -- start condition
    sda_in <= '0';
    wait for 100 ns;
    scl <= '0';
            ---- make sda_in and scl = 0 and wait there
    wait for 500 ns;
    
                        ---------- FIRST BYTE BEGINS
          -- first bit
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;


    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
        
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
          ------ FINISHED ONE BYTE!
          
          ---- ACK phase
          
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    wait for 500 ns;
          --- LET slave transmit that byte brah.
          
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
          ---- ACK PHASE at the end of the first byte
    wait for 50 ns;
    sda_in <= '0';
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
       
    write_data <= "01111110";
    wait for 10 ns;
    write_enable <= '1';
    wait for 10 ns;
    write_enable <= '0';
  
          --- SECOND BYTE
          
                --- LET slave transmit that byte brah.
     
    wait for 100 ns;     
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
          ---- ACK PHASE at the end of the first byte
    wait for 50 ns;
    sda_in <= '1';
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    
            ----- STOP CONDITION
    scl <= '1';
    sda_in <= '0';
    wait for 100 ns;
    sda_in <= '1';
    
    wait for 100 ns;
          
          
                      ----------  ADDRESS
                      
       -- start condition
    sda_in <= '1';      
    scl <= '1';
    wait for 100 ns;
    sda_in <= '0';
    wait for 200 ns;
    scl <= '0';
    wait for 500 ns;
    
                        ---------- SECOND BYTE BEGINS
          -- first bit
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;


    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
        
    
    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '0';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
    
    sda_in <= '1';
    scl <= '1';
          -- assert for 100ns ( 33.3% duty cycle on 300ns period)
    wait for 100 ns;
    scl <= '0';
          -- deassert for 200ns
    wait for 200 ns;
          ------ FINISHED ONE BYTE!
          
          ---- ACK phase

    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    
                   --- LET slave transmit that byte brah.
     
    wait for 100 ns;     
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
    
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
          ---- ACK PHASE at the end of the first byte
    wait for 50 ns;
    sda_in <= '1';
    scl <= '1';
    wait for 100 ns;
    scl <= '0';
    wait for 200 ns;
 
            ---- STOP CONDITION
            
               ----- STOP CONDITION
    scl <= '1';
    sda_in <= '0';
    wait for 100 ns;
    sda_in <= '1';
    
    wait for 100 ns;

    

  end process;
end TEST;