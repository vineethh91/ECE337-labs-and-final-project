-- $Id: $
-- File name:   tb_decode.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_decode is
generic (Period : Time := 10 ns);
end tb_decode;

architecture TEST of tb_decode is

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

  component decode
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         scl : in std_logic;
         sda_in : in std_logic;
         starting_byte : in std_logic_vector(7 downto 0);
         rw_mode : out std_logic;
         address_match : out std_logic;
         stop_found : out std_logic;
         start_found : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal scl : std_logic;
  signal sda_in : std_logic;
  signal starting_byte : std_logic_vector(7 downto 0);
  signal rw_mode : std_logic;
  signal address_match : std_logic;
  signal stop_found : std_logic;
  signal start_found : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: decode port map(
                clk => clk,
                rst_n => rst_n,
                scl => scl,
                sda_in => sda_in,
                starting_byte => starting_byte,
                rw_mode => rw_mode,
                address_match => address_match,
                stop_found => stop_found,
                start_found => start_found
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here
                                      ------------- run 160ns
    rst_n <= '0';
    scl <= '0';
    sda_in <= '0';
    starting_byte <= "00000000";
    wait for 12 ns;
    rst_n <= '1';
    scl <= '0';

    sda_in <= '0';
    -- trigger WRITE mode
    starting_byte <= "00000000";
    wait for 5 ns;
    starting_byte <= "11111111";
    wait for 5 ns;
    starting_byte <= "00000000";
    
    wait for 10 ns;
    -- trigger stop bit
    scl <= '0';

    sda_in <= '1';
    -- trigger READ mode
    starting_byte <= "11010101";    
    wait for 20 ns;
    -- trigger start bit
    scl <= '1';
    -- trigger WRITE mode
    starting_byte <= "00010100";    
    wait for 10 ns;
    sda_in <= '0';
    -- trigger READ mode
    starting_byte <= "11111101";    
    wait for 20 ns;
    
    -- trigger address match and write mode
    starting_byte <= "11111000";        
    wait for 20 ns;
    starting_byte <= "00000000";
    wait for 20 ns;
    -- trigger address match and read mode
    starting_byte <= "01111000";
    wait for 20 ns;
    


  end process;
end TEST;