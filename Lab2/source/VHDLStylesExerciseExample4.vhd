-- $Id: $
-- File name:   VHDLStylesExerciseExample4.vhd
-- Created:     9/3/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: lab2 postlab : Version 4 : simple minded behavioral code


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity VHDLStylesExerciseExample4  is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end VHDLStylesExerciseExample4;

architecture DATAFLOW of VHDLStylesExerciseExample4 is
begin
  process(I)
    variable SOP1,SOP2,SOP3,SOP4,SOP5,SOP6,SOP7: STD_LOGIC;
  begin
  SOP1 := I(3) and not I(2) and I(1) and I(0);
  SOP2 := I(4) and not I(2) and I(1) and I(0);
  SOP3 := I(2) and I(1) and I(0);
  SOP4 := I(3) and I(2) and I(1);
  SOP5 := I(3) and I(2) and I(0);
  SOP6 := I(4) and I(2) and I(1);
  SOP7 := I(4) and I(2) and I(0);
  O <= SOP1 or SOP2 or SOP3 or SOP4 or SOP5 or SOP6 or SOP7;
  end process;
end DATAFLOW;

