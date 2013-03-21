-- $Id: $
-- File name:   rcv_block.vhd
-- Created:     9/26/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: top level block


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY rcv_block IS
   PORT( 
      clk           : IN     std_logic;
      rst           : IN     std_logic;
      serial_in     : IN     std_logic;
      data_read     : IN     std_logic;
      rx_data       : OUT    std_logic_vector(7 downto 0);
      data_ready    : OUT    std_logic;
      overrun_error : OUT    std_logic;
      framing_error : OUT    std_logic);

-- Declarations

END rcv_block ;

architecture archRCVBlock of rcv_block is
  
  signal enableTimer : std_logic;
  signal shiftStrobe : std_logic;
  signal packetDone  : std_logic;
  signal startBitDetected : std_logic;
  signal sbcClear : std_logic;
  signal sbcEnable : std_logic;
  signal loadBuffer : std_logic;
  signal framingError : std_logic;
  signal packetData : std_logic_vector(7 downto 0);
  signal stopBit : std_logic;
  
  COMPONENT timer
    port(
    clk                : in std_logic;
    rst                : in std_logic;
    enable_timer       : in std_logic;
    shift_strobe       : out std_logic;
    packet_done        : out std_logic);
   END COMPONENT;
 
  COMPONENT rcu
    port(
    clk                : in std_logic;
    rst                : in std_logic;
    start_bit_detected : in std_logic;
    packet_done        : in std_logic;
    framing_error      : in std_logic;
    sbc_clear          : out std_logic;
    sbc_enable         : out std_logic;
    load_buffer        : out std_logic;
    enable_timer       : out std_logic);
  END COMPONENT;

  COMPONENT rx_data_buff
  port
        (
                clk  : in    std_logic;
                rst  : in    std_logic;
                load_buffer   : in    std_logic;
                packet_data  : in    std_logic_vector(7 downto 0);
                data_read   :       in      std_logic;
                rx_data    : out   std_logic_vector(7 downto 0);
                data_ready   :       out     std_logic;
                overrun_error   :       out     std_logic
        );
   END COMPONENT;

   COMPONENT sr_9bit
     port
        (
                clk      : in    std_logic;
                rst      : in    std_logic;
                shift_strobe    : in    std_logic;
                serial_in       : in    std_logic;
                packet_data     : out std_logic_vector(7 downto 0);
                stop_bit        : out std_logic
        );
   END COMPONENT;
   
   COMPONENT start_bit_det
     port
        (
                clk      :       in      std_logic;
                rst      :       in      std_logic;
                serial_in    :       in      std_logic;
                start_bit_detected  :    out     std_logic
        );
   END COMPONENT;

   COMPONENT stop_bit_chk
     port
        (
        rst    : in    std_logic;
        clk    : in  std_logic;
        sbc_clear  : in  std_logic;
        sbc_enable  : in  std_logic;
        stop_bit  : in  std_logic;
        framing_error : out std_logic
        );
    END COMPONENT;


BEGIN  
  
  A_1 : timer 
     port map(
    clk => clk,      
    rst => rst,         
    enable_timer => enableTimer,   
    shift_strobe => shiftStrobe, 
    packet_done  => packetDone  );
  
  A_2 : rcu
    port map(
    clk => clk,
    rst => rst,
    start_bit_detected => startBitDetected,
    packet_done => packetDone,
    framing_error => framingError,
    sbc_clear => sbcClear,
    sbc_enable => sbcEnable,
    load_buffer => loadBuffer,
    enable_timer => enableTimer );
  
  A_3 : rx_data_buff
    port map
        (       clk  => clk,
                rst  => rst,
                load_buffer  => loadBuffer,
                packet_data => packetData,
                data_read  => data_read,
                rx_data   => rx_data,
                data_ready  => data_ready,
                overrun_error => overrun_error
        );
        
  A_4 : sr_9bit
     port map
        (
                clk  => clk,
                rst  => rst, 
                shift_strobe => shiftStrobe,
                serial_in  => serial_in,
                packet_data  => packetData,
                stop_bit => stopBit
        );
        
  A_5 : start_bit_det
     port map
        (
                clk => clk,
                rst => rst, 
                serial_in => serial_in,
                start_bit_detected  => startBitDetected
        );
        
  A_6 : stop_bit_chk
     port map
        (
        rst => rst,
        clk => clk,
        sbc_clear => sbcClear,
        sbc_enable => sbcEnable,
        stop_bit => stopBit,
        framing_error => framingError
        );
        
   framing_error <= framingError;
   
end archRCVBlock;