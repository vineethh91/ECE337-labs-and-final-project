-- $Id: $
-- File name:   counter.vhd
-- Created:     9/15/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: counter script


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity counter is
  port(
    clk           : in std_logic;
    nReset        : in std_logic;
    cnt_up        : in std_logic;
    one_k_samples : out std_logic);
end counter;

architecture archCounter of counter is
  signal count, nxt_count: std_logic_vector(9 downto 0);
begin
  ctrReg: process(clk, nReset, nxt_count)
  begin
    if nReset = '0' then
      count <= (others => '0');
    elsif rising_edge(clk) then
      count <= nxt_count;
    end if;
  end process;

  ctrAdd: process(count, cnt_up)
  begin
    nxt_count <= count;
    if (cnt_up = '1') and (count = "1111101000") then -- Roll over after value of 1000
        nxt_count <= "0000000001";
    elsif(cnt_up = '1') then
        nxt_count <= count + 1;
    end if;
  end process;

  oneKSample: process(count)
  begin
    one_k_samples <= '0';
    if(count = "1111101000") then
      one_k_samples <= '1';
    else
      one_k_samples <= '0';
    end if;
  end process;

end archCounter;