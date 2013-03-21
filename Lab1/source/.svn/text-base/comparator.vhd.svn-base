-- VHDL for EE337 Lab 1
-- The Following code is used to compare 2 16-bit quantites, A and B. The code 
-- determines whether or not:
-- A is greater than B, GT = 1, LT = 0, EQ = 0
-- A is less than B, GT = 0, LT = 1, EQ = 0
-- A is equal to B, GT = 0, LT = 0, EQ = 1 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparator  is

   port ( A, B:  in STD_LOGIC_VECTOR(15 downto 0);
     GT: out STD_LOGIC;
     LT: out STD_LOGIC;
     EQ: out STD_LOGIC) ;

end comparator;

architecture BEHAVIORAL of comparator is
begin
  COM:process(A,B)
    variable gte, lte: STD_LOGIC;
  begin
   lte := '0';
   gte := '0';
   if (A < B) then
     lte := '1';
   elsif(A > B) then
     gte := '1';
   end if;
   if (gte = '1') then
       gt <= '1';
       lt <= '0';
       eq <= '0';
   elsif (lte = '1') then
       gt <= '0';
       lt <= '1';
       eq <= '0';
   else
       gt <= '0';
       lt <= '0';
       eq <= '1';  
  end if;
  end process COM;
end BEHAVIORAL;
