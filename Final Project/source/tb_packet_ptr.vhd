-- $Id: $
-- File name:   tb_packet_ptr.vhd
-- Created:     11/20/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_packet_ptr is
generic (Period : Time := 4.16 ns);
end tb_packet_ptr;

architecture TEST of tb_packet_ptr is

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

  component packet_ptr
    PORT(
         clk : in std_logic;
         write_to_ptr : in std_logic;
         new_ptr : in std_logic_vector(8 downto 0);
         pkt_ptr : out std_logic_vector(8 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal write_to_ptr : std_logic;
  signal new_ptr : std_logic_vector(8 downto 0);
  signal pkt_ptr : std_logic_vector(8 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: packet_ptr port map(
                clk => clk,
                write_to_ptr => write_to_ptr,
                new_ptr => new_ptr,
                pkt_ptr => pkt_ptr
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    write_to_ptr <= '0';

    new_ptr <= "110000110";
    
    wait for 4.16 ns;
    
    write_to_ptr <= '1';
    
    wait for 4.16 ns;
    
    write_to_ptr <= '0';
    new_ptr <= "001110001";
    
    wait for 4.16 ns;
    
    write_to_ptr <= '1';

    wait for 4.16 ns;
    
    write_to_ptr <= '0';

  end process;
end TEST;
