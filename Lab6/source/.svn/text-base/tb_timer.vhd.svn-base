-- $Id: $
-- File name:   tb_timer.vhd
-- Created:     10/8/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_timer is
generic (Period : Time := 10 ns);
end tb_timer;

architecture TEST of tb_timer is

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

  component timer
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         rising_edge_found : in std_logic;
         falling_edge_found : in std_logic;
         stop_found : in std_logic;
         start_found : in std_logic;
         byte_received : out std_logic;
         ack_prep : out std_logic;
         check_ack : out std_logic;
         ack_done : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal rising_edge_found : std_logic;
  signal falling_edge_found : std_logic;
  signal stop_found : std_logic;
  signal start_found : std_logic;
  signal byte_received : std_logic;
  signal ack_prep : std_logic;
  signal check_ack : std_logic;
  signal ack_done : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: timer port map(
                clk => clk,
                rst_n => rst_n,
                rising_edge_found => rising_edge_found,
                falling_edge_found => falling_edge_found,
                stop_found => stop_found,
                start_found => start_found,
                byte_received => byte_received,
                ack_prep => ack_prep,
                check_ack => check_ack,
                ack_done => ack_done
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
				----------- RUN 400 ns
-- Insert TEST BENCH Code Here

    rst_n <= '0'; 

    rising_edge_found <= '0';

    falling_edge_found <= '0';

    stop_found <= '0';

    start_found <= '0';

    wait for 6 ns;

    rst_n <= '1';


    start_found <= '1';
    wait for 10 ns;
    start_found <= '0';
	----------- move to state READ_BIT_1
    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	--------- SHOULD move to state READ_BIT_8
    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------- MOVE TO PREP_ACK
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------ MOVE TO ACK_DONE
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';
                          ---- SECOND BYTE!!! go from ACK_DONE to READ_BIT_1
	------ MOVE TO READ_BIT_1
    rising_edge_found <= '1'; 
    wait for 10 ns;
    rising_edge_found <= '0';


    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	--------- SHOULD move to state READ_BIT_8
    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------- MOVE TO PREP_ACK
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------ MOVE TO ACK_DONE
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';
                    --- THIRD BYTE!!! go from ACK_DONE to IDLE
    stop_found <= '1';
    wait for 10 ns;
    stop_found <= '0';
    
    start_found <= '1';
    wait for 10 ns;
    start_found <= '0';
    
	------ MOVE TO READ_BIT_1
    rising_edge_found <= '1'; 
    wait for 10 ns;
    rising_edge_found <= '0';


    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	--------- SHOULD move to state READ_BIT_8
    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------- MOVE TO PREP_ACK
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';

    rising_edge_found <= '1';
    wait for 10 ns;
    rising_edge_found <= '0';
	------ MOVE TO ACK_DONE
    falling_edge_found <= '1';
    wait for 10 ns;
    falling_edge_found <= '0';


  end process;
end TEST;
