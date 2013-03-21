-- $Id: $
-- File name:   VHDLStylesExerciseExample3.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab2 postlab : Version 3 : selected signal assignment using integer value


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity VHDLStylesExerciseExample3 is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample3;

architecture DATAFLOW of VHDLStylesExerciseExample3 is
begin
    with to_integer(unsigned(I)) select
        O <= '1' when 11 | 19 |  7 | 14 | 13 | 22 | 21 | 15 | 23 | 27 | 29 | 30 | 31,
             '0' when others;
end DATAFLOW;

