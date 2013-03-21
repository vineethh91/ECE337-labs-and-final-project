-- $Id: $
-- File name:   VHDLStylesExerciseExample1.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab 2 postlab Version 1 : conditional statements


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity VHDLStylesExerciseExample1 is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample1;

architecture DATAFLOW of VHDLStylesExerciseExample1 is
  SIGNAL SOP1,SOP2,SOP3,SOP4,SOP5,SOP6,SOP7: STD_LOGIC;
begin
  SOP1 <= '1' when I(3) = '1' and I(2) = '0' and I(1) = '1' and I(0) = '1' else '0';
  SOP2 <= '1' when I(4) = '1' and I(2) = '0' and I(1) = '1' and I(0) = '1' else '0';
  SOP3 <= '1' when I(2) = '1' and I(1) = '1' and I(0) = '1' else '0';
  SOP4 <= '1' when I(3) = '1' and I(2) = '1' and I(1) = '1' else '0';
  SOP5 <= '1' when I(3) = '1' and I(2) = '1' and I(0) = '1' else '0';
  SOP6 <= '1' when I(4) = '1' and I(2) = '1' and I(1) = '1' else '0';
  SOP7 <= '1' when I(4) = '1' and I(2) = '1' and I(0) = '1' else '0';
  O <= SOP1 or SOP2 or SOP3 or SOP4 or SOP5 or SOP6 or SOP7;
end DATAFLOW;
