-- $Id: $
-- File name:   tb_transceiver.vhd
-- Created:     11/24/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_transceiver is
generic (Period : Time := 4.16 ns);
end tb_transceiver;

architecture TEST of tb_transceiver is

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

  component transceiver
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         d_plus : in std_logic;
         d_minus : in std_logic;
         bus_IN_data1 : in std_logic_vector(9 downto 0);
         bus_IN_data2 : in std_logic_vector(9 downto 0);
         bus_IN_data3 : in std_logic_vector(9 downto 0);
         bus_IN_data4 : in std_logic_vector(9 downto 0);
         bus_OUT_data : out std_logic_vector(9 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal d_pluss : std_logic;
  signal d_minuss : std_logic;
  signal bus_IN_data1 : std_logic_vector(9 downto 0);
  signal bus_IN_data2 : std_logic_vector(9 downto 0);
  signal bus_IN_data3 : std_logic_vector(9 downto 0);
  signal bus_IN_data4 : std_logic_vector(9 downto 0);
  signal bus_OUT_data : std_logic_vector(9 downto 0);

-- signal <name> : <type>;
 procedure send_byte(data : std_logic_vector(7 downto 0); signal dplus	: inout std_logic;
		      signal dminus : inout std_logic) is
    begin
	-- Send data bits
	for i in 0 to 7 loop
           dplus <= data(i);
       	   dminus <= not data(i);
	         wait for 20*Period;
  end loop;
  end procedure send_byte;
begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: transceiver port map(
                clk => clk,
                rst_n => rst_n,
                d_plus => d_pluss,
                d_minus => d_minuss,
                bus_IN_data1 => bus_IN_data1,
                bus_IN_data2 => bus_IN_data2,
                bus_IN_data3 => bus_IN_data3,
                bus_IN_data4 => bus_IN_data4,
                bus_OUT_data => bus_OUT_data
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    rst_n <= '0';

    wait for 5 ns;
    rst_n <= '1';
    wait for 10*Period;
    send_byte("11111111", d_pluss, d_minuss);
   -- wait for 5 ns;
    send_byte("00001111", d_pluss, d_minuss);
  --  wait for 5 ns;
    
  end process;
end TEST;