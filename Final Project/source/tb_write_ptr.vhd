-- $Id: $
-- File name:   tb_write_ptr.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_write_ptr is
generic (Period : Time := 4.16 ns);
end tb_write_ptr;

architecture TEST of tb_write_ptr is

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

  component write_ptr
    PORT(
         clk : in std_logic;
         rst_ptr : in std_logic;
         inc_ptr : in std_logic;
         data_ptr : out std_logic_vector(8 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_ptr : std_logic;
  signal inc_ptr : std_logic;
  signal data_ptr : std_logic_vector(8 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: write_ptr port map(
                clk => clk,
                rst_ptr => rst_ptr,
                inc_ptr => inc_ptr,
                data_ptr => data_ptr
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_ptr <= '0';
    inc_ptr <= '0';
    wait for 4.16 ns;
    rst_ptr <= '1';

    inc_ptr <= '1';
    wait for 4.16 ns;
    inc_ptr <= '0';
    wait for 4.16 ns;
    inc_ptr <= '1';
    wait for 4.16 ns;
    inc_ptr <= '0';
    wait for 4.16 ns;
    inc_ptr <= '1';
    wait for 4.16 ns;
    inc_ptr <= '0';
    wait for 4.16 ns;
    inc_ptr <= '1';
    wait for 4.16 ns;
    inc_ptr <= '0';
    wait for 4.16 ns;
    inc_ptr <= '1';
    wait for 4.16 ns;
    inc_ptr <= '0';
    rst_ptr <= '1';

  end process;
end TEST;
