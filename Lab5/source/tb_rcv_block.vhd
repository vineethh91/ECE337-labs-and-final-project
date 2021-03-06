-- $Id: $ece337
-- File name:   tb_rcv_block.vhd
-- Created:     2/5/2012
-- Author:      ECE 337 Course Staff
-- Lab Section: Course Staff
-- Version:     3.0  Updated Design Entry
-- Description: ECE 337 Lab 5 UART design starter test bench file
-- Use a tab size of 2 for best viewing results

--- Test Bench from blackboard
library ieee;
--library gold_lib;
use ieee.std_logic_1164.all;
--use gold_lib.all;

entity tb_rcv_block is
	generic
	(
		CLK_PERIOD				: Time := 2.5 ns;
		NORM_DATA_PERIOD	: Time := 25 ns
	);
end tb_rcv_block;

architecture TEST of tb_rcv_block is

  component rcv_block
    port
		( 
			clk       		: in	std_logic;
			rst       		: in	std_logic;
			serial_in			: in	std_logic;
			data_read			: in	std_logic;
			rx_data				: out	std_logic_vector (7 downto 0);
			data_ready		: out	std_logic;
			overrun_error	: out	std_logic;
			framing_error	: out	std_logic
		);
  end component;
	
	-- Type conversion functions
	function uint_to_string (number : natural) return string is
	begin
		return natural'image(number);
	end function uint_to_string;
	
	-- Test vector custom data types, access functions, procedures, constants
	constant NUM_TEST_CASES	: natural := 9;		-- Set this constnat to always be the number of test cases you want to run
	
	type test_case is
		record
			-- Test Inputs
			test_data			: std_logic_vector(7 downto 0);	-- Data sent in the packet
			stop_bit			: std_logic;										-- Stop bit for testing for correct stop bit detection
			data_period		: time;													-- Data transmission rate for this test case
			
			-- Test Outputs
			framing_error	: std_logic;	-- The correct value for the framing error flag signal
			overrun_error	: std_logic;	-- The correct value for the overrrun error flag signal
			data_ready		:	std_logic;	-- The correct value for the data_ready flag signal signal
			
			-- Test information
			read_data	:	boolean;	-- Flag for whether or not to signal that the data was read (false duirng the first transmission in an overrun sequence and true in last transmission of overrun sequence and in all others
			reset_dut	: boolean;	-- Flag for whether or not to reset the design to isolate the test case from prior ones. Generally this should be done (value of true), except for before an overrun sequence.
		end record;
	
	type test_case_array is array(1 to NUM_TEST_CASES) of test_case;
	
	-- Test case array used by the test bench, add additonal testcases here and the test bench will adapt to them
	constant	test_cases : test_case_array := (	
	                                            -- Test Case 1: Completely normal transmission
	                                            -- Specific Coverage: none (normal)
                                              -- Time Region: 0 - 320 ns
																							(X"D5", '1', NORM_DATA_PERIOD,						'0', '0', '1', TRUE, TRUE),
																							
																							-- Test Case 2: Faster than normal error free transmision
																							-- Specific Coverage: Fast signal (41.6 Mbps)
                                              -- Time Region: 320 - 640 ns	
																							(X"E5", '1', (NORM_DATA_PERIOD * 0.96),	'0', '0', '1', TRUE, TRUE),
																							
																							-- Test Case 3: Slower than normal error free transmision
																							-- Specific Coverage: Slow signal (38.4 Mbps)
                                              -- Time Region: 640 - 980 ns	
																							(X"F5", '1', (NORM_DATA_PERIOD * 1.04),	'0', '0', '1', TRUE, TRUE),
																							
																							-- Test Case 4: Framing Error Check
																							-- Specific Coverage: Framing error
                                              -- Time Region: 980 - 1310 ns	
																							(X"C5", '0', (NORM_DATA_PERIOD),	'1', '0', '0', TRUE, TRUE),
																							
																							-- Test Case 5 & 6: Bit Toggle
																							-- Specific Coverage: Making sure every bit gets changing
                                              -- Time Region: 1310 - 1940 ns	
																							(X"55", '1', (NORM_DATA_PERIOD),	'0', '0', '1', TRUE, TRUE),
																						  (X"AA", '1', (NORM_DATA_PERIOD),	'0', '0', '1', TRUE, FALSE),
																						  
																						  -- Test Case 7, 8, & 9: Overrun Error Check (After Overrun Error Test)
																						  -- Specific Coverage: Overrun error (with a test after to see if the reciever still works)
                                              -- Time Region: 1940 - 2860 ns
																							(X"60", '1', (NORM_DATA_PERIOD),	'0', '0', '1', FALSE, TRUE),
																						  (X"84", '1', (NORM_DATA_PERIOD),	'0', '1', '1', FALSE, FALSE),
																						  (X"AA", '1', (NORM_DATA_PERIOD),	'0', '0', '1', TRUE, FALSE)
																						);
	
	procedure send_bits(	data										: in		std_logic_vector(7 downto 0);
												stop_bit								:	in		std_logic;
												data_period							: in		time;
												signal serial_in_signal	:	inout	std_logic) is
	begin
		-- Send the start bit
		serial_in_signal	<= '0';
		wait for data_period;
		
		-- Send data bits
		for i in 0 to 7 loop
			-- Send apropriate bit value
      serial_in_signal	<= data(i);
			
			-- Wait for a full bit period
			wait for data_period;
    end loop;
		
		-- Send the stop bit
		serial_in_signal	<= stop_bit;
		wait for data_period;

	end procedure send_bits;
	
	procedure run_test_case(test_case_number						: in		natural;
													signal serial_in_signal			: inout std_logic;
													signal data_read_signal			: inout	std_logic;
													signal reset_signal					: inout	std_logic;
													signal framing_error_signal	: in		std_logic;
													signal overrun_error_signal	: in		std_logic;
													signal data_ready_signal		: in		std_logic;
													signal rx_data_signal				: in		std_logic_vector(7 downto 0);
													signal clk_signal						: in		std_logic) is
		
		variable data_period	: time;
	begin
		-- Grab the data period for the test case
		data_period	:= test_cases(test_case_number).data_period;
		
		-- If test case is supposed to be isolated from prior ones the put connection idle, reset the dut, then continue
		if(test_cases(test_case_number).reset_dut) then
			-- Make the connection idle
			serial_in_signal	<= '1';
			
			-- Perform a chip reset
			reset_signal	<= '1';
			wait for 5*CLK_PERIOD;
			reset_signal	<= '0';
			wait for 5*CLK_PERIOD;
		end if;
		
		-- Send the test case's data packet
		send_bits(test_cases(test_case_number).test_data, test_cases(test_case_number).stop_bit, data_period, serial_in_signal);
		
		-- Wait for 1 idle data bit to allow the controller to finish processing the packet
		wait for data_period;
		
		-- Test for errors
		-- Test for the correct value of the the SBE
		if (test_cases(test_case_number).framing_error = framing_error_signal) then
			report "Correct framing_error value found for test case " & uint_to_string(test_case_number) severity NOTE;
		else
			report "Incorrect framing_error value found for test case " & uint_to_string(test_case_number) severity ERROR;
		end if;
		
		if ('1' /= test_cases(test_case_number).framing_error) then
			-- This test case should have stored some valid data to be read
			if (test_cases(test_case_number).data_ready = data_ready_signal) then
				report "Correct data_ready value found for test case " & uint_to_string(test_case_number) severity NOTE;
			else
				report "Incorrect data_ready value found for test case " & uint_to_string(test_case_number) severity ERROR;
			end if;

			if (test_cases(test_case_number).test_data = rx_data_signal) then
				report "Correct rx_data value found for test case " & uint_to_string(test_case_number) severity NOTE;
			else
				report "Incorrect rx_data value found for test case " & uint_to_string(test_case_number) severity ERROR;
			end if;
		end if;
			
		if (test_cases(test_case_number).overrun_error = overrun_error_signal) then
			report "Correct overrun_error value found for test case " & uint_to_string(test_case_number) severity NOTE;
		else
			report "Incorrect overrun_error value found for test case " & uint_to_string(test_case_number) severity ERROR;
		end if;
		
		-- Clear the rbuf full flag if asked
		if (test_cases(test_case_number).read_data) then
			data_read_signal	<= '1';
			wait for CLK_PERIOD;
			data_read_signal	<= '0';
		end if;
		
		-- Add the 1 additonal idle data bit
		wait for data_period;
		
	end procedure run_test_case;
	
	-- Testbench Signals Declarations
	-- signal <name> : <type>;
  signal tb_overrun_error		: std_logic;
  signal tb_data_ready			: std_logic;
  signal tb_rx_data					: std_logic_vector(7 downto 0);
  signal tb_framing_error		: std_logic;
  signal tb_clk							: std_logic;
  signal tb_data_read				: std_logic;
  signal tb_rst							: std_logic;
  signal tb_serial_in				: std_logic;
	signal tb_test_data				: std_logic_vector(7 downto 0);
	signal tb_test_packet			: std_logic_vector(9 downto 0);
	signal tb_test_packet_rev	: std_logic_vector(9 downto 0);
	signal tb_test_case_num		: natural;


begin

	CLKGEN : process
	begin
		tb_clk <= '0';
		wait for CLK_PERIOD / 2;
		tb_clk <= '1';
		wait for CLK_PERIOD / 2;
	end process;

  DUT: rcv_block 
		port map
		(
			clk						=> tb_clk,
			rst						=> tb_rst,
			serial_in			=> tb_serial_in,
			data_read			=> tb_data_read,
			rx_data				=> tb_rx_data,
			data_ready		=> tb_data_ready,
			overrun_error	=> tb_overrun_error,
			framing_error	=> tb_framing_error
		);

	TEST_BENCH : process

  begin
	-- Initialize all input signals
	tb_data_read	<= '0';
  tb_rst				<= '0';	-- Active high reset signal
  tb_serial_in	<= '1';	-- Line idle is '1'
	
	-- Run Test Cases
	for i in 1 to NUM_TEST_CASES loop
		-- Set some debuging/viewing signals
		tb_test_case_num		<= i;
		tb_test_data				<= test_cases(i).test_data;
		tb_test_packet			<= '0' & test_cases(i).test_data & test_cases(i).stop_bit;
		
		-- Run the test case
		run_test_case(i, tb_serial_in, tb_data_read, tb_rst, tb_framing_error, tb_overrun_error, tb_data_ready, tb_rx_data, tb_clk);
	end loop;
  
  wait;
  end process;
	
	-- Create a reverse packet signal for easier comparisions with the serial in signal
	tb_test_packet_rev	<= tb_test_packet(9) & tb_test_packet(8) & tb_test_packet(7) & tb_test_packet(6) & tb_test_packet(5) & tb_test_packet(4) & tb_test_packet(3) & tb_test_packet(2) & tb_test_packet(1) & tb_test_packet(0);
end TEST;
