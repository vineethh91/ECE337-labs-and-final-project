-- $Id: $
-- File name:   tb_masterController.vhd
-- Created:     11/18/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_masterController is
generic (Period : Time := 4.16 ns);
end tb_masterController;

architecture TEST of tb_masterController is

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

  component masterController
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         byte_done : in std_logic;
         eopDetect : in std_logic;
         usb_data : in std_logic_vector(7 downto 0);
         sram_control : in std_logic;
         sram_data_out : in std_logic_vector(7 downto 0);
         next_byte : in std_logic;
         master_address : out std_logic_vector(7 downto 0);
         load_data : out std_logic;
         tx_enable : out std_logic;
         data_transmission_live : out std_logic;
         byte_strobe : out std_logic;
         bus_data : out std_logic_vector(7 downto 0);
         sram_select : out std_logic_vector(1 downto 0);
         sram_address : out std_logic_vector(8 downto 0);
         read_enable : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal byte_done : std_logic;
  signal eopDetect : std_logic;
  signal usb_data : std_logic_vector(7 downto 0);
  signal sram_control : std_logic;
  signal sram_data_out : std_logic_vector(7 downto 0);
  signal next_byte : std_logic;
  signal master_address : std_logic_vector(7 downto 0);
  signal load_data : std_logic;
  signal tx_enable : std_logic;
  signal data_transmission_live : std_logic;
  signal byte_strobe : std_logic;
  signal bus_data : std_logic_vector(7 downto 0);
  signal sram_select : std_logic_vector(1 downto 0);
  signal sram_address : std_logic_vector(8 downto 0);
  signal read_enable : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: masterController port map(
                clk => clk,
                rst_n => rst_n,
                byte_done => byte_done,
                eopDetect => eopDetect,
                usb_data => usb_data,
                sram_control => sram_control,
                sram_data_out => sram_data_out,
                next_byte => next_byte,
                master_address => master_address,
                load_data => load_data,
                tx_enable => tx_enable,
                data_transmission_live => data_transmission_live,
                byte_strobe => byte_strobe,
                bus_data => bus_data,
                sram_select => sram_select,
                sram_address => sram_address,
                read_enable => read_enable
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here
-- Insert TEST BENCH Code Here

    rst_n <= '0';
    
    
    byte_done <= '0';

    eopDetect <= '0';

    usb_data <= "00000000"; 

    sram_control <= '0';

    sram_data_out <= "00000000";
    
    next_byte <= '0';
    
    wait for 5 ns;
    
    rst_n <= '1';
    
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------START OF IN PACKET------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

                    --- CURRENT STATE = IDLE    
    byte_done <= '1';
    usb_data <= "10000000";
    
    wait for 5 ns;
                    --- CURRENT STATE = CHECK_SETUP_SYNC_BYTE
    byte_done <= '0';
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_1
    byte_done <= '1';
    usb_data <= "11010010";
                    --- CURRENT STATE = CHECK_SETUP_PID    
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_2                   
    byte_done <= '0';
    wait for 5 ns;

    byte_done <= '1';
    usb_data <= "10101010";
                    --- CURRENT STATE = GRAB_MASTER_ADDRESS    
    wait for 5 ns; 
                    --- CURRENT STATE = WAIT_FOR_SETUP_EOP
    byte_done <= '0';

    wait for 15 ns;
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    wait for 15 ns;    
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    wait for 15 ns;    
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    
    byte_done <= '1';
    usb_data <= "10000000";  
                    --- CURRENT STATE = CHECK_MDATA_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_4    
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_MDATA_PID    
    usb_data <= "11110000";
    wait for 5 ns;
                --- CURRENT STATE = WAIT_FOR_BYTE_DONE_5
    byte_done <= '0';
    wait for 5 ns;
    
    byte_done <= '1';
    usb_data <= "00000010";
                    --- CURRENT STATE = PUT_ADDRESS_BYTE_ON_BUS
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_MDATA_EOP
    byte_done <= '0';
    wait for 50 ns;
    eopDetect <= '1';

    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_6
    eopDetect <= '0';
    usb_data <= "10000000";
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_INOUT_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_7
    wait for 5 ns;
    byte_done <= '1';
    usb_data <= "00011110";
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = CHECK_INOUT_PID
                    --- CURRENT STATE = OUT_STATE
    wait for 5 ns;
    usb_data <= "10000000";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';

    wait for 5 ns;
    usb_data <= "01000000";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    
    
    wait for 5 ns;
    usb_data <= "00100000";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    
    
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';  --- EOPDETECT = 1
    usb_data <= "00010000";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00001000";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';  --- EOPDETECT = 2
    usb_data <= "00000100";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00000010";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00010010";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00110010";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "01110010";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "11110010";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00001110";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00000011";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    

    wait for 5 ns;
    usb_data <= "00000111";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    


    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';  --- EOPDETECT = 3
    usb_data <= "00000001";
    byte_done <= '1';
    wait for 5 ns;
    byte_done <= '0';                    
                    --- CURRENT STATE = OUT_STATE_FINISHED    
                    --- CURRENT STATE = IDLE
                    
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------END OF OUT PACKET--------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
    

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------START OF FIRST IN PACKET-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
    
                        --- CURRENT STATE = IDLE 
    wait for 500 ns;   
    byte_done <= '1';
    usb_data <= "10000000";
    wait for 5 ns;
                    --- CURRENT STATE = CHECK_SETUP_SYNC_BYTE
    byte_done <= '0';
    usb_data <= "10000000";
    
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_1
    byte_done <= '1';
    usb_data <= "11010010";
                    --- CURRENT STATE = CHECK_SETUP_PID    
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_2                   
    byte_done <= '0';
    wait for 5 ns;

    byte_done <= '1';
    usb_data <= "10101010";
                    --- CURRENT STATE = GRAB_MASTER_ADDRESS    
    wait for 5 ns; 
                    --- CURRENT STATE = WAIT_FOR_SETUP_EOP
    byte_done <= '0';

    wait for 15 ns;
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    wait for 15 ns;    
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    wait for 15 ns;    
    eopDetect <= '1';
    wait for 5 ns;
    eopDetect <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_3
    wait for 20 ns;
    byte_done <= '1';
    usb_data <= "10000000";  
                    --- CURRENT STATE = CHECK_MDATA_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_4    
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_MDATA_PID    
    usb_data <= "11110000";
    wait for 5 ns;
                --- CURRENT STATE = WAIT_FOR_BYTE_DONE_5
    byte_done <= '0';
    wait for 5 ns;
    
    byte_done <= '1';
    usb_data <= "00000010";
                    --- CURRENT STATE = PUT_ADDRESS_BYTE_ON_BUS
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_MDATA_EOP
    byte_done <= '0';
    wait for 50 ns;
    eopDetect <= '1';

    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_6
    eopDetect <= '0';
    usb_data <= "10000000";
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_INOUT_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_7
    wait for 5 ns;
    byte_done <= '1';
    usb_data <= "10010110";
    sram_data_out <= "00001000";
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = CHECK_INOUT_PID
                    --- CURRENT STATE = IN_STATE
                    --- CURRENT STATE = WAIT_FOR_SRAM_DATA_1
                    --- CURRENT STATE = TRANSMIT_STATE                    
             
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------START OF SECOND IN PACKET-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
    wait for 20 ns;
    byte_done <= '1';
    usb_data <= "10000000";  
                    --- CURRENT STATE = CHECK_MDATA_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_4    
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_MDATA_PID    
    usb_data <= "11110000";
    wait for 5 ns;
                --- CURRENT STATE = WAIT_FOR_BYTE_DONE_5
    byte_done <= '0';
    wait for 5 ns;
    
    byte_done <= '1';
    usb_data <= "00000001";
                    --- CURRENT STATE = PUT_ADDRESS_BYTE_ON_BUS
    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_MDATA_EOP
    byte_done <= '0';
    wait for 50 ns;
    eopDetect <= '1';

    wait for 5 ns;
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_6
    eopDetect <= '0';
    usb_data <= "10000000";
    wait for 5 ns;
    byte_done <= '1';
                    --- CURRENT STATE = CHECK_INOUT_SYNC_BYTE
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = WAIT_FOR_BYTE_DONE_7
    wait for 5 ns;
    byte_done <= '1';
    usb_data <= "10010110";
    sram_data_out <= "00001000";
    wait for 5 ns;
    byte_done <= '0';
                    --- CURRENT STATE = CHECK_INOUT_PID
                    --- CURRENT STATE = IN_STATE
                    --- CURRENT STATE = WAIT_FOR_SRAM_DATA_1
                    --- CURRENT STATE = TRANSMIT_STATE                    
             
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
    wait for 20 ns;       
    next_byte <= '1';
    wait for 5 ns;
    next_byte <= '0';
    
----------------------------------------------------- WORKS PERFECTLY UP UNTIL THIS POINT ---------------------------------------------------------------------
    wait for 500 ns;
  end process;
end TEST;