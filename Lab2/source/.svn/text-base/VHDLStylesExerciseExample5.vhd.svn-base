-- $Id: $
-- File name:   VHDLStylesExerciseExample5.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab2 postlab : Version 5 : use if statement


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity VHDLStylesExerciseExample5  is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample5;

architecture style5_arch of VHDLStylesExerciseExample5 is
begin
  process(I)
    variable Iint : INTEGER;
  begin
    Iint := to_integer(unsigned(I));
    if Iint=11 or Iint=19 or Iint = 7 or Iint=14 or Iint=13 or Iint=22 or Iint=21 or Iint=15 or Iint=23 or Iint=27 or Iint=29 or Iint=30 or Iint=31 then O <= '1';
    else O <= '0';
    end if;
  end process;
end style5_arch;
