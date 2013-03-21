-- $Id: $
-- File name:   addr16bit.vhd
-- Created:     9/4/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: 16 bit added


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity addr16Bit is
  port (
    A : in std_logic_vector(15 downto 0);
    B : in std_logic_vector(15 downto 0);
    CARRYIN : in std_logic;
    SUM : out std_logic_vector(15 downto 0);
    OVERFLOW : out std_logic);
end addr16Bit;

architecture structural of addr16Bit is
  component addr1Bit
    port (
      A, B, Cin : in std_logic;
      S, Cout   : out std_logic);
  end component;

  signal carrys : STD_LOGIC_VECTOR(15 downto 0);
  signal sums : STD_LOGIC_VECTOR(15 downto 0);

begin
  
  
  I00 : addr1Bit port map (A(0), B(0), CARRYIN, sums(0), carrys(0));
  I01 : addr1Bit port map (A(1), B(1), carrys(0), sums(1), carrys(1));
  I02 : addr1Bit port map (A(2), B(2), carrys(1), sums(2), carrys(2));
  I03 : addr1Bit port map (A(3), B(3), carrys(2), sums(3), carrys(3));
  I04 : addr1Bit port map (A(4), B(4), carrys(3), sums(4), carrys(4));
  I05 : addr1Bit port map (A(5), B(5), carrys(4), sums(5), carrys(5));
  I06 : addr1Bit port map (A(6), B(6), carrys(5), sums(6), carrys(6));
  I07 : addr1Bit port map (A(7), B(7), carrys(6), sums(7), carrys(7));
  I08 : addr1Bit port map (A(8), B(8), carrys(7), sums(8), carrys(8));
  I09 : addr1Bit port map (A(9), B(9), carrys(8), sums(9), carrys(9));
  I10 : addr1Bit port map (A(10), B(10), carrys(9), sums(10), carrys(10));
  I11 : addr1Bit port map (A(11), B(11), carrys(10), sums(11), carrys(11));
  I12 : addr1Bit port map (A(12), B(12), carrys(11), sums(12), carrys(12));
  I13 : addr1Bit port map (A(13), B(13), carrys(12), sums(13), carrys(13));
  I14 : addr1Bit port map (A(14), B(14), carrys(13), sums(14), carrys(14));
  I15 : addr1Bit port map (A(15), B(15), carrys(14), sums(15), carrys(15));

  SUM <= sums;
  OVERFLOW <= carrys(15);
end structural;



architecture gen_structural of addr16Bit is
  component addr1Bit
    port (
      A, B, Cin : in std_logic;
      S, Cout   : out std_logic);
  end component;

  signal carrys : STD_LOGIC_VECTOR(16 downto 0);
  signal sums : STD_LOGIC_VECTOR(15 downto 0);

begin
  carrys(0) <= CARRYIN;
  GEN : for I in 0 to 15 generate
    IX : addr1Bit port map (A(i), B(i), carrys(i), sums(i), carrys(i+1));
  end generate;
  
  SUM <= sums;
  OVERFLOW <= carrys(16);
end gen_structural;
