-- $Id: $
-- File name:   tx_sr.vhd
-- Created:     9/29/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: transmitter shift register


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity tx_sr is
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    tx_out : out std_logic;
    falling_edge_found : in std_logic;
    tx_enable : in std_logic;
    tx_data : in std_logic_vector(7 downto 0);
    load_data : in std_logic
  );
end entity tx_sr;


architecture archTxSr of tx_sr is
 	signal present_val : std_logic_vector(7 downto 0);
	signal next_val : std_logic_vector(7 downto 0);

begin
                                        ----- bunch of errors with next_val_reg when running the test bench!!! -- Might be because of next_val <= present_val bullshit
  REG: process (clk, rst_n)
  begin  -- process
		if('0' = rst_n) then
			present_val <= (others=>'0');
		elsif(rising_edge(clk)) then
			present_val <= next_val;
		end if; 
	end process;

	-- Next value logic: Shift in to the right when told to
	--next_val	<= tx_data when (load_data = '1') else present_val;
	
	-- Output Logic
	tx_out <= present_val(7);
	
	nextValOutputLogic : process(falling_edge_found, tx_enable, load_data, present_val)
	begin
	  next_val <= present_val;
    if(load_data = '1') then
	  	  next_val	<= tx_data;
	  elsif ((falling_edge_found = '1') and (tx_enable = '1')) then
	  	   --next_val <= present_val(6 downto 0) & '0';
	  	   next_val <= present_val(6 downto 0) & present_val(7);
	  end if;

  end process nextValOutputLogic;

end architecture archTxSr;