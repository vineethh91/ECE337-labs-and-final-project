-- $Id: $
-- File name:   tb_controller_decoder.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_controller_decoder is
generic (Period : Time := 4.16 ns);
end tb_controller_decoder;

architecture TEST of tb_controller_decoder is

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

  component controller_decoder
    PORT(
         clk : in std_logic;
         rst : in std_logic;
         SRAM_control : in std_logic;
         master_addr : in std_logic_vector(8 downto 0);
         cont_addr : in std_logic_vector(8 downto 0);
         SRAM_addr : out std_logic_vector(8 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst : std_logic;
  signal SRAM_control : std_logic;
  signal master_addr : std_logic_vector(8 downto 0);
  signal cont_addr : std_logic_vector(8 downto 0);
  signal SRAM_addr : std_logic_vector(8 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: controller_decoder port map(
                clk => clk,
                rst => rst,
                SRAM_control => SRAM_control,
                master_addr => master_addr,
                cont_addr => cont_addr,
                SRAM_addr => SRAM_addr
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst <= '0';
    wait for 4.16 ns;
    rst <= '1';
    master_addr <= "000101110";
    cont_addr <=  "010101010";
    SRAM_control <= '0';
    wait for 4.16 ns;
    SRAM_control <= '1';
    wait for 4.16 ns;

  end process;
end TEST;
