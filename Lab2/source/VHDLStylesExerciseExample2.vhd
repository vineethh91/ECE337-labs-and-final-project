-- $Id: $
-- File name:   VHDLStylesExerciseExample2.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab2 postlab : Version 2 : selected signal assignment


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity VHDLStylesExerciseExample2  is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample2;

architecture DATAFLOW of VHDLStylesExerciseExample2 is
begin
    with I select
        O <=    '1' when "00111",
		'1' when "01011",
		'1' when "01101",
		'1' when "01110",
		'1' when "01111",
		'1' when "10011",
		'1' when "10101",
		'1' when "10110",
		'1' when "10111",
		'1' when "11011",
		'1' when "11101",
		'1' when "11110",
		'1' when "11111",
		'0' when others;
end DATAFLOW;
