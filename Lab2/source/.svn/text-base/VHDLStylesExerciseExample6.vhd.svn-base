-- $Id: $
-- File name:   VHDLStylesExerciseExample6.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab2 postlab : Version 6 : use case statement


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity VHDLStylesExerciseExample6 is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample6;

architecture style6_arch of VHDLStylesExerciseExample6 is
begin
  process(I)
    variable Iint : INTEGER;
  begin
    case to_integer(unsigned(I)) is
      when 11 | 19 | 7 | 14 | 13 | 22 | 21 | 15 | 23 | 27 | 29 | 30 | 31 => O <= '1';
      when others => O <= '0';
    end case;
  end process;
end style6_arch;
