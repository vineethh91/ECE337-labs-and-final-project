-- $Id: $
-- File name:   protein5_b.vhd
-- Created:     8/27/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: protein detector
-- behaviroual


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity protein5_b  is

   port ( I: in STD_LOGIC_VECTOR(4 downto 0);
          O: out STD_LOGIC) ;

end protein5_b;

architecture BEHAVIORAL of protein5_b is
begin
  COM:process(I)
    variable proteinCounter: INTEGER range 0 to 15;
  begin
    O <= '0';
    proteinCounter := 0;
    for j in 0 to 4 loop
      if(I(j) = '1') then
        proteinCounter := proteinCounter + 1;
      end if;
      if(j = 3 and I(j) = '1') then
        exit;
      end if;
   end loop;
   if(proteinCounter > 2) then
      O <= '1';
    end if;
  end process COM;
end BEHAVIORAL;

