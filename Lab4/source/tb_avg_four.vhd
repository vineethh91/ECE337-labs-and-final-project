-- $Id: $
-- File name:   tb_avg_four.vhd
-- Created:     9/18/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_avg_four is
generic (Period : Time := 5 ns);
end tb_avg_four;

architecture TEST of tb_avg_four is

  function UINT_TO_STDV( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
  begin
    return std_logic_vector(to_unsigned(X, NumBits));
  end;

  function STDV_TO_UINT( X: std_logic_vector)
     return integer is
  begin
    return to_integer(unsigned(x));
  end;

  component avg_four
    PORT(
         clk : IN std_logic;
         nReset : IN std_logic;
         sample_data : IN std_logic_vector (15 DOWNTO 0);
         data_ready : IN std_logic;
         one_k_samples : OUT std_logic;
         modwait : OUT std_logic;
         avg_out : OUT std_logic_vector (15 DOWNTO 0);
         err : OUT std_logic
    );
  end component;
  
  component GOLD_avg_four
    PORT(
         clk : IN std_logic;
         nReset : IN std_logic;
         sample_data : IN std_logic_vector (15 DOWNTO 0);
         data_ready : IN std_logic;
         one_k_samples : OUT std_logic;
         modwait : OUT std_logic;
         avg_out : OUT std_logic_vector (15 DOWNTO 0);
         err : OUT std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal nReset : std_logic;
  signal sample_data : std_logic_vector (15 DOWNTO 0);
  signal data_ready : std_logic;
  signal one_k_samples : std_logic;
  signal modwait : std_logic;
  signal avg_out : std_logic_vector (15 DOWNTO 0);
  signal err : std_logic;
  
  signal GOLD_one_k_samples : std_logic;
  signal GOLD_modwait : std_logic;
  signal GOLD_avg_out : std_logic_vector (15 DOWNTO 0);
  signal GOLD_err : std_logic;
  
-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: avg_four port map(
                clk => clk,
                nReset => nReset,
                sample_data => sample_data,
                data_ready => data_ready,
                one_k_samples => one_k_samples,
                modwait => modwait,
                avg_out => avg_out,
                err => err
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);
  GOLD: GOLD_avg_four port map(
                clk => clk,
                nReset => nReset,
                sample_data => sample_data,
                data_ready => data_ready,
                one_k_samples => GOLD_one_k_samples,
                modwait => GOLD_modwait,
                avg_out => GOLD_avg_out,
                err => GOLD_err
                );
process

  begin

-- Insert TEST BENCH Code Here
    -- resets to 0
    nReset <= '0';
    wait for 10 ns;
    nReset <= '1';
    -- sends the data = 4
    data_ready <= '1';
    
    sample_data <= UINT_TO_STDV(4, 16);

    wait for 100 ns;

    -- sends the data = 8    
    data_ready <= '1';
    
    sample_data <= UINT_TO_STDV(8, 16);

    wait for 100 ns;
    
        -- sends the data = 12
    data_ready <= '1';
    
    sample_data <= UINT_TO_STDV(12, 16);

    wait for 100 ns;

        -- sends the data = 16
    data_ready <= '1';
    
    sample_data <= UINT_TO_STDV(16, 16);

    wait for 100 ns;
    
    -- sends the data = 1 one thousand and ten times
    -- just to make sure that the one_k_samples outputs one
    -- and avg_out should stay 1 throughout
    for i in 0 to 1009 loop
          sample_data <= UINT_TO_STDV(1,16);
--          wait for 20ns;
--          data_ready <= '0';
          wait for 100 ns;
    end loop;

    
  end process;
end TEST;
