-- $Id: $
-- File name:   tb_bus_controller.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_bus_controller is
generic (Period : Time := 4.16 ns);
end tb_bus_controller;

architecture TEST of tb_bus_controller is

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

  component bus_controller
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         SRAM_control : in std_logic;
         BUS_IN : in std_logic_vector(9 downto 0);
         MASTER_ADDRESS : in std_logic_vector(7 downto 0);
         cont_addr : out std_logic_vector(8 downto 0);
         write_enable : out std_logic;
         BUS_VAL : out std_logic_vector(7 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal SRAM_control : std_logic;
  signal BUS_IN : std_logic_vector(9 downto 0);
  signal MASTER_ADDRESS : std_logic_vector(7 downto 0);
  signal cont_addr : std_logic_vector(8 downto 0);
  signal write_enable : std_logic;
  signal BUS_VAL : std_logic_vector(7 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

stEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  SRAM_control <= clk_tmp;
  wait for Period*10;
end process;

  DUT: bus_controller port map(
                clk => clk,
                rst => rst,
                SRAM_control => SRAM_control,
                BUS_IN => BUS_IN,
                MASTER_ADDRESS => MASTER_ADDRESS,
                cont_addr => cont_addr,
                write_enable => write_enable,
                BUS_VAL => BUS_VAL
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    MASTER_ADDRESS <= "00000000";
    BUS_IN <= "0000000000";
    wait for 4.16 ns;
    rst <= '1';
    BUS_IN <= "0100000001";
    wait for 100 ns;
    BUS_IN <= "1100000001";
    wait for 100 ns;
    BUS_IN <= "0110101010";
    wait for 100 ns;
    BUS_IN <= "1110101010";
    wait for 100 ns;
    BUS_IN <= "0100001111";
    wait for 100 ns;
    BUS_IN <= "1100001111";
    wait for 100 ns;
    BUS_IN <= "0111110000";
    wait for 100 ns;
    BUS_IN <= "1111110000";
    wait for 100 ns;
    BUS_IN <= "0101010101";
    wait for 100 ns;
    BUS_IN <= "1101010101";
    wait for 100 ns;
    BUS_IN <= "0111100010";
    wait for 100 ns;
    BUS_IN <= "1111100010";
    wait for 100 ns;
    BUS_IN <= "0010101010";
    wait for 500 ns;
   
  end process;
end TEST;
