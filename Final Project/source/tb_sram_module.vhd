-- $Id: $
-- File name:   tb_sram_module.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_sram_module is
generic (Period : Time := 4.16 ns);
end tb_sram_module;

architecture TEST of tb_sram_module is

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

  component sram_module
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         cont1_addr : in std_logic_vector(8 downto 0);
         cont2_addr : in std_logic_vector(8 downto 0);
         cont3_addr : in std_logic_vector(8 downto 0);
         cont4_addr : in std_logic_vector(8 downto 0);
         bus_val1 : in std_logic_vector(7 downto 0);
         bus_val2 : in std_logic_vector(7 downto 0);
         bus_val3 : in std_logic_vector(7 downto 0);
         bus_val4 : in std_logic_vector(7 downto 0);
         write_enable1 : in std_logic;
         write_enable2 : in std_logic;
         write_enable3 : in std_logic;
         write_enable4 : in std_logic;
         SRAM_SELECT : in std_logic_vector (1 downto 0);
         SRAM_ADDRESS : in std_logic_vector(8 downto 0);
         read_enable : in std_logic;
         DATA_OUT : out std_logic_vector(7 downto 0);
         SRAM_control : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal cont1_addr : std_logic_vector(8 downto 0);
  signal cont2_addr : std_logic_vector(8 downto 0);
  signal cont3_addr : std_logic_vector(8 downto 0);
  signal cont4_addr : std_logic_vector(8 downto 0);
  signal bus_val1 : std_logic_vector(7 downto 0);
  signal bus_val2 : std_logic_vector(7 downto 0);
  signal bus_val3 : std_logic_vector(7 downto 0);
  signal bus_val4 : std_logic_vector(7 downto 0);
  signal write_enable1 : std_logic;
  signal write_enable2 : std_logic;
  signal write_enable3 : std_logic;
  signal write_enable4 : std_logic;
  signal SRAM_SELECT : std_logic_vector (1 downto 0);
  signal SRAM_ADDRESS : std_logic_vector(8 downto 0);
  signal read_enable : std_logic;
  signal DATA_OUT : std_logic_vector(7 downto 0);
  signal SRAM_control : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: sram_module port map(
                clk => clk,
                rst => rst,
                cont1_addr => cont1_addr,
                cont2_addr => cont2_addr,
                cont3_addr => cont3_addr,
                cont4_addr => cont4_addr,
                bus_val1 => bus_val1,
                bus_val2 => bus_val2,
                bus_val3 => bus_val3,
                bus_val4 => bus_val4,
                write_enable1 => write_enable1,
                write_enable2 => write_enable2,
                write_enable3 => write_enable3,
                write_enable4 => write_enable4,
                SRAM_SELECT => SRAM_SELECT,
                SRAM_ADDRESS => SRAM_ADDRESS,
                read_enable => read_enable,
                DATA_OUT => DATA_OUT,
                SRAM_control => SRAM_control
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    read_enable <= '0';
    SRAM_SELECT <= "00";

    SRAM_ADDRESS <= "000000000";
    wait for 4.16 ns;
    rst <= '1';

    cont1_addr <= "000000000";
    cont2_addr <= "000000000";
    cont3_addr <= "000000000";
    cont4_addr <= "000000000";
    bus_val1 <= "10101010";
    bus_val2 <= "01010101";
    bus_val3 <= "00001111";
    bus_val4 <= "11110000";
    write_enable1 <= '0';
    write_enable2 <= '0';
    write_enable3 <= '0';
    write_enable4 <= '0';
    
    wait for 41.6 ns;
    
    write_enable1 <= '1';
    write_enable2 <= '1';
    write_enable3 <= '1';
    write_enable4 <= '1';
    
    wait for 5 ns;
    
    write_enable1 <= '0';
    write_enable2 <= '0';
    write_enable3 <= '0';
    write_enable4 <= '0';
    
    wait for 36.6 ns;
    
    SRAM_SELECT <= "00";

    SRAM_ADDRESS <= "000000000";

    read_enable <= '1';
    
    wait for 4.16 ns;
    
    read_enable <= '0';
    
    SRAM_SELECT <= "01";
    
    wait for 10 ns;
    
    SRAM_SELECT <= "10";
    
    wait for 10 ns;
    
    SRAM_SELECT <= "11";
    
    wait for 11.6 ns;

  end process;
end TEST;
