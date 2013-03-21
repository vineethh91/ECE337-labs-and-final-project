-- $Id: $
-- File name:   addr1Bit.vhd
-- Created:     9/4/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: 1 bit adder


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity addr1Bit is
  port (
    A, B, Cin : in std_logic;
    S, Cout : out std_logic);
end addr1Bit;

architecture DATAFLOW of addr1Bit is
begin
  S <= Cin xor (A xor B);
  Cout <= ((not Cin) and B and A) or (Cin and (B or A));
end DATAFLOW;

