-- $Id: $
-- File name:   tb_byte_counter.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_byte_counter is
generic (Period : Time := 4.16 ns);
end tb_byte_counter;

architecture TEST of tb_byte_counter is

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

  component byte_counter
    PORT(
         clk : in std_logic;
         rst_count : in std_logic;
         inc_count : in std_logic;
         temp_ptr : out std_logic_vector(5 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_count : std_logic;
  signal inc_count : std_logic;
  signal temp_ptr : std_logic_vector(5 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: byte_counter port map(
                clk => clk,
                rst_count => rst_count,
                inc_count => inc_count,
                temp_ptr => temp_ptr
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_count <= '0';
    inc_count <= '0';
    wait for 4.16 ns;
    rst_count <= '1';

    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    wait for 4.16 ns;
    inc_count <= '1';
    wait for 4.16 ns;
    inc_count <= '0';
    rst_count <= '0';
    wait for 4.16 ns;
    rst_count <= '1';

  end process;
end TEST;
