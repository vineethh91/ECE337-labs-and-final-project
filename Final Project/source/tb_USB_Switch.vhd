-- $Id: $
-- File name:   tb_USB_Switch.vhd
-- Created:     12/1/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
library  ece337_ip;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.math_real.ALL;  
use ece337_ip.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_USB_Switch is
generic (Period : Time := 10 ns);
end tb_USB_Switch;

architecture TEST of tb_USB_Switch is

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

  component USB_Switch
    PORT(
         clk : in std_logic;
         nRst : in std_logic;
    	 USB1_DPI : in std_logic;
    	 USB1_DMI : in std_logic;
    	 USB1_DPO : out std_logic;
   		 USB1_DMO : out std_logic;
    	 USB2_DPI : in std_logic;
    	 USB2_DMI : in std_logic;
    	 USB2_DPO : out std_logic;
    	 USB2_DMO : out std_logic;
    	 USB3_DPI : in std_logic;
    	 USB3_DMI : in std_logic;
    	 USB3_DPO : out std_logic;
    	 USB3_DMO : out std_logic;
    	 USB4_DPI : in std_logic;
    	 USB4_DMI : in std_logic;
    	 USB4_DPO : out std_logic;
    	 USB4_DMO : out std_logic;
   	   	 USB5_DPI : in std_logic;
    	 USB5_DMI : in std_logic;
    	 USB5_DPO : out std_logic;
    	 USB5_DMO : out std_logic;
         read_out11 : in std_logic_vector(7 downto 0);
         read_out12 : in std_logic_vector(7 downto 0);
         read_out13 : in std_logic_vector(7 downto 0);
         read_out14 : in std_logic_vector(7 downto 0);
         SRAM1_addr1 : out std_logic_vector(8 downto 0);
         SRAM2_addr1 : out std_logic_vector(8 downto 0);
         SRAM3_addr1 : out std_logic_vector(8 downto 0);
         SRAM4_addr1 : out std_logic_vector(8 downto 0);
         Write_Enable11 : out std_logic;
         Write_Enable12 : out std_logic;
         Write_Enable13 : out std_logic;
         Write_Enable14 : out std_logic;
         BUS_VAL11 : out std_logic_vector (7 downto 0);
         BUS_VAL12 : out std_logic_vector (7 downto 0);
         BUS_VAL13 : out std_logic_vector (7 downto 0);
         BUS_VAL14 : out std_logic_vector (7 downto 0);
         read_enable1 : out std_logic;
         read_out21 : in std_logic_vector(7 downto 0);
         read_out22 : in std_logic_vector(7 downto 0);
         read_out23 : in std_logic_vector(7 downto 0);
         read_out24 : in std_logic_vector(7 downto 0);
         SRAM1_addr2 : out std_logic_vector(8 downto 0);
         SRAM2_addr2 : out std_logic_vector(8 downto 0);
         SRAM3_addr2 : out std_logic_vector(8 downto 0);
         SRAM4_addr2 : out std_logic_vector(8 downto 0);
         Write_Enable21 : out std_logic;
         Write_Enable22 : out std_logic;
         Write_Enable23 : out std_logic;
         Write_Enable24 : out std_logic;
         BUS_VAL21 : out std_logic_vector (7 downto 0);
         BUS_VAL22 : out std_logic_vector (7 downto 0);
         BUS_VAL23 : out std_logic_vector (7 downto 0);
         BUS_VAL24 : out std_logic_vector (7 downto 0);
         read_enable2 : out std_logic;
         read_out31 : in std_logic_vector(7 downto 0);
         read_out32 : in std_logic_vector(7 downto 0);
         read_out33 : in std_logic_vector(7 downto 0);
         read_out34 : in std_logic_vector(7 downto 0);
         SRAM1_addr3 : out std_logic_vector(8 downto 0);
         SRAM2_addr3 : out std_logic_vector(8 downto 0);
         SRAM3_addr3 : out std_logic_vector(8 downto 0);
         SRAM4_addr3 : out std_logic_vector(8 downto 0);
         Write_Enable31 : out std_logic;
         Write_Enable32 : out std_logic;
         Write_Enable33 : out std_logic;
         Write_Enable34 : out std_logic;
         BUS_VAL31 : out std_logic_vector (7 downto 0);
         BUS_VAL32 : out std_logic_vector (7 downto 0);
         BUS_VAL33 : out std_logic_vector (7 downto 0);
         BUS_VAL34 : out std_logic_vector (7 downto 0);
         read_enable3 : out std_logic;
         read_out41 : in std_logic_vector(7 downto 0);
         read_out42 : in std_logic_vector(7 downto 0);
         read_out43 : in std_logic_vector(7 downto 0);
         read_out44 : in std_logic_vector(7 downto 0);
         SRAM1_addr4 : out std_logic_vector(8 downto 0);
         SRAM2_addr4 : out std_logic_vector(8 downto 0);
         SRAM3_addr4 : out std_logic_vector(8 downto 0);
         SRAM4_addr4 : out std_logic_vector(8 downto 0);
         Write_Enable41 : out std_logic;
         Write_Enable42 : out std_logic;
         Write_Enable43 : out std_logic;
         Write_Enable44 : out std_logic;
         BUS_VAL41 : out std_logic_vector (7 downto 0);
         BUS_VAL42 : out std_logic_vector (7 downto 0);
         BUS_VAL43 : out std_logic_vector (7 downto 0);
         BUS_VAL44 : out std_logic_vector (7 downto 0);
         read_enable4 : out std_logic;
         read_out51 : in std_logic_vector(7 downto 0);
         read_out52 : in std_logic_vector(7 downto 0);
         read_out53 : in std_logic_vector(7 downto 0);
         read_out54 : in std_logic_vector(7 downto 0);
         SRAM1_addr5 : out std_logic_vector(8 downto 0);
         SRAM2_addr5 : out std_logic_vector(8 downto 0);
         SRAM3_addr5 : out std_logic_vector(8 downto 0);
         SRAM4_addr5 : out std_logic_vector(8 downto 0);
         Write_Enable51 : out std_logic;
         Write_Enable52 : out std_logic;
         Write_Enable53 : out std_logic;
         Write_Enable54 : out std_logic;
         BUS_VAL51 : out std_logic_vector (7 downto 0);
         BUS_VAL52 : out std_logic_vector (7 downto 0);
         BUS_VAL53 : out std_logic_vector (7 downto 0);
         BUS_VAL54 : out std_logic_vector (7 downto 0);
         read_enable5 : out std_logic
    );
  end component;
  
      component simple_scale_mem is
        generic (
            -- Memory Model parameters
            ADDR_SIZE_BITS  : natural  := 12;    -- Address bus size in bits/pins with addresses corresponding to 
                                                -- the starting word of the accesss
            WORD_SIZE_BYTES  : natural  := 1;      -- Word size of the memory in bytes
            DATA_SIZE_WORDS  : natural  := 1;      -- Data bus size in "words"
            READ_DELAY      : time    := 5 ns;  -- Delay/latency per read access (total time between start of supplying address and when the data read from memory appears on the r_data port)
                                                -- Keep the 5 ns delay for on-chip SRAM
            WRITE_DELAY      : time    := 5 ns    -- Delay/latency per write access (total time between start of supplying address and when the w_data value is written into memory)
                                                -- Keep the 5 ns delay for on-chip SRAM
            );
                
        port   (
            -- Test bench control signals
            mem_clr        : in  boolean;
            mem_init      : in  boolean;
            mem_dump      : in  boolean;
            verbose        : in  boolean;
            init_filename  : in   string;
            dump_filename  : in   string;
            start_address  : in  natural;
            last_address  : in  natural;

            -- Memory interface signals
            r_enable  : in  std_logic;
            w_enable  : in  std_logic;
            addr      : in  std_logic_vector((addr_size_bits - 1) downto 0);
            r_data    : out  std_logic_vector(((data_size_words * word_size_bytes * 8) - 1) downto 0);
            w_data    : in  std_logic_vector(((data_size_words * word_size_bytes * 8) - 1) downto 0)
            );
    end component simple_scale_mem;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal nRst : std_logic;
  signal USB1_DPI : std_logic;
  signal USB1_DMI : std_logic;
  signal USB1_DPO : std_logic;
  signal USB1_DMO : std_logic;
  signal USB2_DPI : std_logic;
  signal USB2_DMI : std_logic;
  signal USB2_DPO : std_logic;
  signal USB2_DMO : std_logic;
  signal USB3_DPI : std_logic;
  signal USB3_DMI : std_logic;
  signal USB3_DPO : std_logic;
  signal USB3_DMO : std_logic;
  signal USB4_DPI : std_logic;
  signal USB4_DMI : std_logic;
  signal USB4_DPO : std_logic;
  signal USB4_DMO : std_logic;
  signal USB5_DPI : std_logic;
  signal USB5_DMI : std_logic;
  signal USB5_DPO : std_logic;
  signal USB5_DMO : std_logic;
  signal read_out11 : std_logic_vector(7 downto 0);
  signal read_out12 : std_logic_vector(7 downto 0);
  signal read_out13 : std_logic_vector(7 downto 0);
  signal read_out14 : std_logic_vector(7 downto 0);
  signal SRAM1_addr1 : std_logic_vector(8 downto 0);
  signal SRAM2_addr1 : std_logic_vector(8 downto 0);
  signal SRAM3_addr1 : std_logic_vector(8 downto 0);
  signal SRAM4_addr1 : std_logic_vector(8 downto 0);
  signal Write_Enable11 : std_logic;
  signal Write_Enable12 : std_logic;
  signal Write_Enable13 : std_logic;
  signal Write_Enable14 : std_logic;
  signal BUS_VAL11 : std_logic_vector (7 downto 0);
  signal BUS_VAL12 : std_logic_vector (7 downto 0);
  signal BUS_VAL13 : std_logic_vector (7 downto 0);
  signal BUS_VAL14 : std_logic_vector (7 downto 0);
  signal read_enable1 : std_logic;
  signal read_out21 : std_logic_vector(7 downto 0);
  signal read_out22 : std_logic_vector(7 downto 0);
  signal read_out23 : std_logic_vector(7 downto 0);
  signal read_out24 : std_logic_vector(7 downto 0);
  signal SRAM1_addr2 : std_logic_vector(8 downto 0);
  signal SRAM2_addr2 : std_logic_vector(8 downto 0);
  signal SRAM3_addr2 : std_logic_vector(8 downto 0);
  signal SRAM4_addr2 : std_logic_vector(8 downto 0);
  signal Write_Enable21 : std_logic;
  signal Write_Enable22 : std_logic;
  signal Write_Enable23 : std_logic;
  signal Write_Enable24 : std_logic;
  signal BUS_VAL21 : std_logic_vector (7 downto 0);
  signal BUS_VAL22 : std_logic_vector (7 downto 0);
  signal BUS_VAL23 : std_logic_vector (7 downto 0);
  signal BUS_VAL24 : std_logic_vector (7 downto 0);
  signal read_enable2 : std_logic;
  signal read_out31 : std_logic_vector(7 downto 0);
  signal read_out32 : std_logic_vector(7 downto 0);
  signal read_out33 : std_logic_vector(7 downto 0);
  signal read_out34 : std_logic_vector(7 downto 0);
  signal SRAM1_addr3 : std_logic_vector(8 downto 0);
  signal SRAM2_addr3 : std_logic_vector(8 downto 0);
  signal SRAM3_addr3 : std_logic_vector(8 downto 0);
  signal SRAM4_addr3 : std_logic_vector(8 downto 0);
  signal Write_Enable31 : std_logic;
  signal Write_Enable32 : std_logic;
  signal Write_Enable33 : std_logic;
  signal Write_Enable34 : std_logic;
  signal BUS_VAL31 : std_logic_vector (7 downto 0);
  signal BUS_VAL32 : std_logic_vector (7 downto 0);
  signal BUS_VAL33 : std_logic_vector (7 downto 0);
  signal BUS_VAL34 : std_logic_vector (7 downto 0);
  signal read_enable3 : std_logic;
  signal read_out41 : std_logic_vector(7 downto 0);
  signal read_out42 : std_logic_vector(7 downto 0);
  signal read_out43 : std_logic_vector(7 downto 0);
  signal read_out44 : std_logic_vector(7 downto 0);
  signal SRAM1_addr4 : std_logic_vector(8 downto 0);
  signal SRAM2_addr4 : std_logic_vector(8 downto 0);
  signal SRAM3_addr4 : std_logic_vector(8 downto 0);
  signal SRAM4_addr4 : std_logic_vector(8 downto 0);
  signal Write_Enable41 : std_logic;
  signal Write_Enable42 : std_logic;
  signal Write_Enable43 : std_logic;
  signal Write_Enable44 : std_logic;
  signal BUS_VAL41 : std_logic_vector (7 downto 0);
  signal BUS_VAL42 : std_logic_vector (7 downto 0);
  signal BUS_VAL43 : std_logic_vector (7 downto 0);
  signal BUS_VAL44 : std_logic_vector (7 downto 0);
  signal read_enable4 : std_logic;
  signal read_out51 : std_logic_vector(7 downto 0);
  signal read_out52 : std_logic_vector(7 downto 0);
  signal read_out53 : std_logic_vector(7 downto 0);
  signal read_out54 : std_logic_vector(7 downto 0);
  signal SRAM1_addr5 : std_logic_vector(8 downto 0);
  signal SRAM2_addr5 : std_logic_vector(8 downto 0);
  signal SRAM3_addr5 : std_logic_vector(8 downto 0);
  signal SRAM4_addr5 : std_logic_vector(8 downto 0);
  signal Write_Enable51 : std_logic;
  signal Write_Enable52 : std_logic;
  signal Write_Enable53 : std_logic;
  signal Write_Enable54 : std_logic;
  signal BUS_VAL51 : std_logic_vector (7 downto 0);
  signal BUS_VAL52 : std_logic_vector (7 downto 0);
  signal BUS_VAL53 : std_logic_vector (7 downto 0);
  signal BUS_VAL54 : std_logic_vector (7 downto 0);
  signal read_enable5 : std_logic;

-- signal <name> : <type>;

  signal currentTestByte : std_logic_vector(7 downto 0);
  constant NUM_TEST_CASES	: natural := 9;		-- Set this constnat to always be the number of test cases you want to run
  
  type packet_t is (SETUP_P, OUT_P, IN_P);
  
  	type test_case is
		record
			packet_type : packet_t; -- Type of packet
			address : std_logic_vector(7 downto 0); -- Address of recieving device
			data_byte_length : integer range 0 to 64; -- length of data in bytes
			data : std_logic_vector(7 downto 0); -- the data to send
		end record;
	
	type test_case_array is array(1 to NUM_TEST_CASES) of test_case;
	
	constant	test_cases : test_case_array := (	
																							(SETUP_P, "11001110", 0, "00000000"),
																							(OUT_P, "11001110", 64, "00000010"), -- talking to 2
																							(OUT_P, "11001110", 64, "00000011"), -- talking to 3
																							(OUT_P, "11001110", 64, "00000100"), -- talking to 4
																							(OUT_P, "11001110", 64, "00000101"), -- talking to 5
																							(IN_P, "11001110", 64, "00000010"),  -- reading from 2
																							(IN_P, "11001110", 64, "00000011"),  -- reading from 3
																							(IN_P, "11001110", 64, "00000100"),  -- reading from 4
																							(IN_P, "11001110", 64, "00000101")  -- reading from 5
																						);
																						
	constant	test_cases2 : test_case_array := (	
																							(SETUP_P, "11001110", 0, "00000000"),
																							(OUT_P, "11001110", 64, "00000011"), -- talking to 3
																							(OUT_P, "11001110", 64, "00000100"),-- talking to 4
																							(OUT_P, "11001110", 64, "00000101"),-- talking to 5
																							(OUT_P, "11001110", 64, "00000001"),-- talking to 1
																							(IN_P, "11001110", 64, "00000011"),  -- reading from 3
																							(IN_P, "11001110", 64, "00000100"),  -- reading from 4
																							(IN_P, "11001110", 64, "00000101"),  -- reading from 5
																							(IN_P, "11001110", 64, "00000001")  -- reading from 1
																						);
																						
	constant	test_cases3 : test_case_array := (	
																							(SETUP_P, "11001110", 0, "00000000"),
																							(OUT_P, "11001110", 64, "00000100"),-- talking to 4
																							(OUT_P, "11001110", 64, "00000101"),-- talking to 5
																							(OUT_P, "11001110", 64, "00000001"),-- talking to 1 
																							(OUT_P, "11001110", 64, "00000010"),-- talking to 2
																							(IN_P, "11001110", 64, "00000100"),  -- reading from 4
																							(IN_P, "11001110", 64, "00000101"),  -- reading from 5
																							(IN_P, "11001110", 64, "00000001"),  -- reading from 1
																							(IN_P, "11001110", 64, "00000010")  -- reading from 2
																						);
																						
	constant	test_cases4 : test_case_array := (	
																							(SETUP_P, "11001110", 0, "00000000"),
																							(OUT_P, "11001110", 64, "00000101"),-- talking to 5
																							(OUT_P, "11001110", 64, "00000001"),-- talking to 1
																							(OUT_P, "11001110", 64, "00000010"),-- talking to 2
																							(OUT_P, "11001110", 64, "00000011"),-- talking to 3
																							(IN_P, "11001110", 64, "00000101"),  -- reading from 5
																							(IN_P, "11001110", 64, "00000001"),  -- reading from 1
																							(IN_P, "11001110", 64, "00000010"),  -- reading from 2
																							(IN_P, "11001110", 64, "00000011")  -- reading from 3
																						);
																						
  constant	test_cases5 : test_case_array := (	
																							(SETUP_P, "11001110", 0, "00000000"),
																							(OUT_P, "11001110", 64, "00000001"),-- talking to 1
																							(OUT_P, "11001110", 64, "00000010"),-- talking to 2
																							(OUT_P, "11001110", 64, "00000011"),-- talking to 3
																							(OUT_P, "11001110", 64, "00000100"),-- talking to 4
																							(IN_P, "11001110", 64, "00000001"),  -- reading from 1
																							(IN_P, "11001110", 64, "00000010"),  -- reading from 2
																							(IN_P, "11001110", 64, "00000011"),  -- reading from 3
																							(IN_P, "11001110", 64, "00000100")  -- reading from 4
																						);
																					
 procedure send_byte_serially_nrzi(data : std_logic_vector(7 downto 0); signal dplus	: inout std_logic;
		      signal dminus : inout std_logic; signal currTestByte : inout std_logic_vector(7 downto 0)) is
		      variable lineval : std_logic;
		      variable count : Integer;
    begin
    currTestByte <= data;
    lineval := dplus;
	-- Send data bits
	for i in 0 to 7 loop
	    -- bit stuffing
	    if (count = 5) then
	        lineval := not lineval;
	        dplus <= lineval;
       	    dminus <= not lineval;
       	    count := 0;
            wait for 20*Period; -- Hold value for one bit length --> 20*4.16ns = 1 USB Bit leng
        end if;
        
        --encoding
	    if (data(i) = '0') then
       	   lineval := not lineval;
       	else
           count := count + 1;
        end if;
	    dplus <= lineval;
       	dminus <= not lineval;
        wait for 20*Period; -- Hold value for one bit length --> 20*4.16ns = 1 USB Bit length
    end loop;
  end procedure send_byte_serially_nrzi;
  
    procedure run_test_case( mycase : test_case; signal data_p : inout std_logic; signal data_m : inout std_logic; signal curr_byte : inout std_logic_vector(7 downto 0) ) is
        -- Random generation taken from the site: http://www.markharvey.info/vhdl/rnd/rnd.html
        VARIABLE seed1, seed2: positive;               -- Seed values for random generator
        VARIABLE rand: real;                           -- Random real-number value in range 0 to 1.0
        VARIABLE int_rand: integer;                    -- Random integer value in range 0..4095
        VARIABLE stim: std_logic_vector(7 DOWNTO 0);  -- Random 12-bit stimulus
    begin
        if (mycase.packet_type = SETUP_P) then
            -- Setup Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("11010010", data_p, data_m, curr_byte); -- SETUP PID
            send_byte_serially_nrzi(mycase.address, data_p, data_m, curr_byte); -- Address
            send_byte_serially_nrzi("00000111", data_p, data_m, curr_byte); -- Endpoint & CRC5

            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Data 0 Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00111100", data_p, data_m, curr_byte); -- Data 0 PID
            
            for i in 0 to 7 loop -- Insert Random Data
                UNIFORM(seed1, seed2, rand);                                   -- generate random number
                int_rand := INTEGER(TRUNC(rand*255.0));                       -- rescale to 0..255, find integer part
                stim := std_logic_vector(to_unsigned(int_rand, stim'LENGTH));  -- convert to std_logic_vector
                send_byte_serially_nrzi(stim, data_p, data_m, curr_byte);
            end loop;
            
            send_byte_serially_nrzi("11100011", data_p, data_m, curr_byte); -- CRC16
            send_byte_serially_nrzi("10101010", data_p, data_m, curr_byte); -- CRC16 Part 2
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Wait for ACK
           -- data_p <= 'Z';
            --data_m <= 'Z';
            
            wait for 420*Period; -- Wait for 18 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 20*Period; -- Wait for 18 bit times
        elsif (mycase.packet_type = OUT_P) then
            -- MDATA Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("11110000", data_p, data_m, curr_byte); -- MDATA PID
            send_byte_serially_nrzi(mycase.address, data_p, data_m, curr_byte); -- Address
            send_byte_serially_nrzi("00000111", data_p, data_m, curr_byte); -- Endpoint & CRC5
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Data 0 Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00111100", data_p, data_m, curr_byte); -- Data 0 PID
            send_byte_serially_nrzi(mycase.data, data_p, data_m, curr_byte); -- Address to Port
            send_byte_serially_nrzi("11100011", data_p, data_m, curr_byte); -- CRC16
            send_byte_serially_nrzi("10101010", data_p, data_m, curr_byte); -- CRC16 Part 2
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times  
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- OUT Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00011110", data_p, data_m, curr_byte); -- OUT PID
            send_byte_serially_nrzi(mycase.address, data_p, data_m, curr_byte); -- Address
            send_byte_serially_nrzi("00000111", data_p, data_m, curr_byte); -- Endpoint & CRC5
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Data 0 Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00111100", data_p, data_m, curr_byte); -- Data 0 PID
            
            for i in 0 to mycase.data_byte_length loop -- Insert Random Data
                UNIFORM(seed1, seed2, rand);                                   -- generate random number
                int_rand := INTEGER(TRUNC(rand*255.0));                       -- rescale to 0..255, find integer part
                stim := std_logic_vector(to_unsigned(int_rand, stim'LENGTH));  -- convert to std_logic_vector
                send_byte_serially_nrzi(stim, data_p, data_m, curr_byte);
            end loop;
            
            send_byte_serially_nrzi("11100011", data_p, data_m, curr_byte); -- CRC16
            send_byte_serially_nrzi("10101010", data_p, data_m, curr_byte); -- CRC16 Part 2
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Wait for ACK
           -- data_p <= 'Z';
          --  data_m <= 'Z';
            
            wait for 420*Period; -- Wait for 4 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 20*Period;
        elsif (mycase.packet_type = IN_P) then
            -- MDATA Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("11110000", data_p, data_m, curr_byte); -- MDATA PID
            send_byte_serially_nrzi(mycase.address, data_p, data_m, curr_byte); -- Address
            send_byte_serially_nrzi("00000111", data_p, data_m, curr_byte); -- Endpoint & CRC5
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Data 0 Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00111100", data_p, data_m, curr_byte); -- Data 0 PID
            send_byte_serially_nrzi(mycase.data, data_p, data_m, curr_byte); -- Address to Port
            send_byte_serially_nrzi("11100011", data_p, data_m, curr_byte); -- CRC16
            send_byte_serially_nrzi("10101010", data_p, data_m, curr_byte); -- CRC16 Part 2
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- IN Packet
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("10010110", data_p, data_m, curr_byte); -- IN PID
            send_byte_serially_nrzi(mycase.address, data_p, data_m, curr_byte); -- Address
            send_byte_serially_nrzi("00000111", data_p, data_m, curr_byte); -- Endpoint & CRC5
            
			--EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 2*Period;
            
            -- Wait for DATA
          --  data_p <= 'Z';
          --  data_m <= 'Z';
            
            wait for (mycase.data_byte_length+40)*8*20*Period; -- Wait for mycase.data_byte_length bit times
            
            data_p <= '1';
            data_m <= '1';
            
            wait for 2*Period;
            
            send_byte_serially_nrzi("10000000", data_p, data_m, curr_byte); -- Sync
            send_byte_serially_nrzi("00101101", data_p, data_m, curr_byte); -- ACK PID
            
            --EOP
            data_p <= '0';
            data_m <= '0';
            wait for 40*Period; -- Wait for 2 bit times
            data_p <= '1';
            data_m <= '1';
            wait for 10*Period;
        end if;
    end procedure run_test_case;
    signal mem_clr_all : boolean; 

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: USB_Switch port map(
                clk => clk,
                nRst => nRst,
                USB1_DPI => USB1_DPI,
                USB1_DMI => USB1_DMI,
                USB1_DPO => USB1_DPO,
                USB1_DMO => USB1_DMO,
                USB2_DPI => USB2_DPI,
                USB2_DMI => USB2_DMI,
                USB2_DPO => USB2_DPO,
                USB2_DMO => USB2_DMO,
                USB3_DPI => USB3_DPI,
                USB3_DMI => USB3_DMI,
                USB3_DPO => USB3_DPO,
                USB3_DMO => USB3_DMO,
                USB4_DPI => USB4_DPI,
                USB4_DMI => USB4_DMI,
                USB4_DPO => USB4_DPO,
                USB4_DMO => USB4_DMO,
                USB5_DPI => USB5_DPI,
                USB5_DMI => USB5_DMI,
                USB5_DPO => USB5_DPO,
                USB5_DMO => USB5_DMO,
                read_out11 => read_out11,
                read_out12 => read_out12,
                read_out13 => read_out13,
                read_out14 => read_out14,
                SRAM1_addr1 => SRAM1_addr1,
                SRAM2_addr1 => SRAM2_addr1,
                SRAM3_addr1 => SRAM3_addr1,
                SRAM4_addr1 => SRAM4_addr1,
                Write_Enable11 => Write_Enable11,
                Write_Enable12 => Write_Enable12,
                Write_Enable13 => Write_Enable13,
                Write_Enable14 => Write_Enable14,
                BUS_VAL11 => BUS_VAL11,
                BUS_VAL12 => BUS_VAL12,
                BUS_VAL13 => BUS_VAL13,
                BUS_VAL14 => BUS_VAL14,
                read_enable1 => read_enable1,
                read_out21 => read_out21,
                read_out22 => read_out22,
                read_out23 => read_out23,
                read_out24 => read_out24,
                SRAM1_addr2 => SRAM1_addr2,
                SRAM2_addr2 => SRAM2_addr2,
                SRAM3_addr2 => SRAM3_addr2,
                SRAM4_addr2 => SRAM4_addr2,
                Write_Enable21 => Write_Enable21,
                Write_Enable22 => Write_Enable22,
                Write_Enable23 => Write_Enable23,
                Write_Enable24 => Write_Enable24,
                BUS_VAL21 => BUS_VAL21,
                BUS_VAL22 => BUS_VAL22,
                BUS_VAL23 => BUS_VAL23,
                BUS_VAL24 => BUS_VAL24,
                read_enable2 => read_enable2,
                read_out31 => read_out31,
                read_out32 => read_out32,
                read_out33 => read_out33,
                read_out34 => read_out34,
                SRAM1_addr3 => SRAM1_addr3,
                SRAM2_addr3 => SRAM2_addr3,
                SRAM3_addr3 => SRAM3_addr3,
                SRAM4_addr3 => SRAM4_addr3,
                Write_Enable31 => Write_Enable31,
                Write_Enable32 => Write_Enable32,
                Write_Enable33 => Write_Enable33,
                Write_Enable34 => Write_Enable34,
                BUS_VAL31 => BUS_VAL31,
                BUS_VAL32 => BUS_VAL32,
                BUS_VAL33 => BUS_VAL33,
                BUS_VAL34 => BUS_VAL34,
                read_enable3 => read_enable3,
                read_out41 => read_out41,
                read_out42 => read_out42,
                read_out43 => read_out43,
                read_out44 => read_out44,
                SRAM1_addr4 => SRAM1_addr4,
                SRAM2_addr4 => SRAM2_addr4,
                SRAM3_addr4 => SRAM3_addr4,
                SRAM4_addr4 => SRAM4_addr4,
                Write_Enable41 => Write_Enable41,
                Write_Enable42 => Write_Enable42,
                Write_Enable43 => Write_Enable43,
                Write_Enable44 => Write_Enable44,
                BUS_VAL41 => BUS_VAL41,
                BUS_VAL42 => BUS_VAL42,
                BUS_VAL43 => BUS_VAL43,
                BUS_VAL44 => BUS_VAL44,
                read_enable4 => read_enable4,
                read_out51 => read_out51,
                read_out52 => read_out52,
                read_out53 => read_out53,
                read_out54 => read_out54,
                SRAM1_addr5 => SRAM1_addr5,
                SRAM2_addr5 => SRAM2_addr5,
                SRAM3_addr5 => SRAM3_addr5,
                SRAM4_addr5 => SRAM4_addr5,
                Write_Enable51 => Write_Enable51,
                Write_Enable52 => Write_Enable52,
                Write_Enable53 => Write_Enable53,
                Write_Enable54 => Write_Enable54,
                BUS_VAL51 => BUS_VAL51,
                BUS_VAL52 => BUS_VAL52,
                BUS_VAL53 => BUS_VAL53,
                BUS_VAL54 => BUS_VAL54,
                read_enable5 => read_enable5
                );

    SSM11: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable1,
                    w_enable => Write_Enable11,
                    addr => SRAM1_addr1,
                    r_data => read_out11,
                    w_data => BUS_VAL11
                    );

    SSM12: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable1,
                    w_enable => Write_Enable12,
                    addr => SRAM2_addr1,
                    r_data => read_out12,
                    w_data => BUS_VAL12
                    );
                    
    SSM13: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable1,
                    w_enable => Write_Enable13,
                    addr => SRAM3_addr1,
                    r_data => read_out13,
                    w_data => BUS_VAL13
                    );

    SSM14: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable1,
                    w_enable => Write_Enable14,
                    addr => SRAM4_addr1,
                    r_data => read_out14,
                    w_data => BUS_VAL14
                    );
                    
    SSM21: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable2,
                    w_enable => Write_Enable21,
                    addr => SRAM1_addr2,
                    r_data => read_out21,
                    w_data => BUS_VAL21
                    );

    SSM22: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable2,
                    w_enable => Write_Enable22,
                    addr => SRAM2_addr2,
                    r_data => read_out22,
                    w_data => BUS_VAL22
                    );
                    
    SSM23: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable2,
                    w_enable => Write_Enable23,
                    addr => SRAM3_addr2,
                    r_data => read_out23,
                    w_data => BUS_VAL23
                    );

    SSM24: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable2,
                    w_enable => Write_Enable24,
                    addr => SRAM4_addr2,
                    r_data => read_out24,
                    w_data => BUS_VAL24
                    );

    SSM31: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable3,
                    w_enable => Write_Enable31,
                    addr => SRAM1_addr3,
                    r_data => read_out31,
                    w_data => BUS_VAL31
                    );

    SSM32: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable3,
                    w_enable => Write_Enable32,
                    addr => SRAM2_addr3,
                    r_data => read_out32,
                    w_data => BUS_VAL32
                    );
                    
    SSM33: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable3,
                    w_enable => Write_Enable33,
                    addr => SRAM3_addr3,
                    r_data => read_out33,
                    w_data => BUS_VAL33
                    );

    SSM34: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable3,
                    w_enable => Write_Enable34,
                    addr => SRAM4_addr3,
                    r_data => read_out34,
                    w_data => BUS_VAL34
                    );
                    
    SSM41: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable4,
                    w_enable => Write_Enable41,
                    addr => SRAM1_addr4,
                    r_data => read_out41,
                    w_data => BUS_VAL41
                    );

    SSM42: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable4,
                    w_enable => Write_Enable42,
                    addr => SRAM2_addr4,
                    r_data => read_out42,
                    w_data => BUS_VAL42
                    );
                    
    SSM43: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable4,
                    w_enable => Write_Enable43,
                    addr => SRAM3_addr4,
                    r_data => read_out43,
                    w_data => BUS_VAL43
                    );

    SSM44: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable4,
                    w_enable => Write_Enable44,
                    addr => SRAM4_addr4,
                    r_data => read_out44,
                    w_data => BUS_VAL44
                    );
                    
    SSM51: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable5,
                    w_enable => Write_Enable51,
                    addr => SRAM1_addr5,
                    r_data => read_out51,
                    w_data => BUS_VAL51
                    );

    SSM52: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable5,
                    w_enable => Write_Enable52,
                    addr => SRAM2_addr5,
                    r_data => read_out52,
                    w_data => BUS_VAL52
                    );
                    
    SSM53: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable5,
                    w_enable => Write_Enable53,
                    addr => SRAM3_addr5,
                    r_data => read_out53,
                    w_data => BUS_VAL53
                    );

    SSM54: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => mem_clr_all,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable5,
                    w_enable => Write_Enable54,
                    addr => SRAM4_addr5,
                    r_data => read_out54,
                    w_data => BUS_VAL54
                    );

  process

  begin

-- Insert TEST BENCH Code Here

    nRst <= '0';
    mem_clr_all <= TRUE;
    wait for 5 ns;
    mem_clr_all <= FALSE;
    nRst <= '1';
    USB1_DPI <= '1';
    USB1_DMI <= '1';
    wait for 10*Period;
    
    -- run test cases
    for i in 1 to NUM_TEST_CASES loop
        run_test_case(test_cases(i), USB1_DPI, USB1_DMI, currentTestByte);
    end loop;

  end process;
  
  process

  begin

-- Insert TEST BENCH Code Here
    wait for 5 ns;
    USB2_DPI <= '1';
    USB2_DMI <= '1';
    wait for 10*Period;
    
    -- run test cases
    for i in 1 to NUM_TEST_CASES loop
        run_test_case(test_cases2(i), USB2_DPI, USB2_DMI, currentTestByte);
    end loop;

  end process;
  
  
    process

  begin

-- Insert TEST BENCH Code Here
    wait for 5 ns;
    USB3_DPI <= '1';
    USB3_DMI <= '1';
    wait for 10*Period;
    
    -- run test cases
    for i in 1 to NUM_TEST_CASES loop
        run_test_case(test_cases3(i), USB3_DPI, USB3_DMI, currentTestByte);
    end loop;

  end process;
  
  process

  begin

-- Insert TEST BENCH Code Here
    wait for 5 ns;
    USB4_DPI <= '1';
    USB4_DMI <= '1';
    wait for 10*Period;
    
    -- run test cases
    for i in 1 to NUM_TEST_CASES loop
        run_test_case(test_cases4(i), USB4_DPI, USB4_DMI, currentTestByte);
    end loop;

  end process;
  
  process

  begin

-- Insert TEST BENCH Code Here
    wait for 5 ns;
    USB5_DPI <= '1';
    USB5_DMI <= '1';
    wait for 10*Period;
    
    -- run test cases
    for i in 1 to NUM_TEST_CASES loop
        run_test_case(test_cases5(i), USB5_DPI, USB5_DMI, currentTestByte);
    end loop;

  end process;
  
end TEST;
