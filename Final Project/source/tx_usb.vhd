-- File name:   tx_usb.vhd
-- Created:     11/22/2012
-- Author:      Charles Werner
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: TX USB top level block


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity tx_usb is 
  port(clk        : in std_logic;
    rst_n         : in std_logic;
    tx_enable     : in std_logic;
    data_out      : in std_logic_vector(7 downto 0);
    load_data     : in std_logic; 
    tx_idle       : out std_logic; 
    request_data  : out std_logic;
    data_minus_out    : out std_logic;
    data_plus_out     : out std_logic);
  end tx_usb; 
  
  architecture structural of tx_usb is
    
    component tx_control is 
      port(clk                  : in std_logic;
        rst_n                   : in std_logic;
        tx_enable               : in std_logic; 
        eop_done                : in std_logic; 
        eop_time                : out std_logic;
        sr_enable               : out std_logic;
        tx_idle                 : out std_logic; 
        timer_enable            : out std_logic);               
      end component; 
      
      component tx_sr is
        port(
      		  clk						         : in	std_logic;
        		rst_n					  	     : in	std_logic;
        		shift_strobe      : in	std_logic;
        		shift_done        : in std_logic; 
        		load_data         : in	std_logic;
        		sr_enable         : in std_logic; 
        		transmit_data     : out std_logic; 
        		data_out        		: in std_logic_vector(7 downto 0));
      		end component;
      		
    		component tx_timer is
    		  port(
          clk             : in std_logic;
          rst_n           : in std_logic;
          timer_enable    : in std_logic; 
          transmit_data   : in std_logic;
          shift_done      : out std_logic;
          shift_strobe    : out std_logic;
          bitstuff        : out std_logic); 
        end component;
        
        component USB_Encoder is port(
          transmit_data       : in std_logic; 
	        clk                 : in std_logic;
      	   rst_n               : in std_logic;
      	   bitstuff            : in std_logic;
      	   eop_time            : in std_logic; 
      	   shift_strobe        : in std_logic; 
      	   data_plus           : out std_logic;
      	   data_minus          : out std_logic);
          
          
        end component; 
        
        component bitstuffer is port(  
          clk : in std_logic; 
          rst_n : in std_logic;
          bitstuff : in std_logic;
          shift_strobe : in std_logic;   
          transmit_data : in std_logic;
          data_output : out std_logic);
        end component; 
        
        component tx_eop_minitimer is port(
          clk             : in std_logic;
          rst_n           : in std_logic;
          eop_time        : in std_logic;
          eop_done        : out std_logic); 
        end component;
        
     --SIGNAL DECLARATIONS   
    signal temp_timer_enable : std_logic;
    signal temp_sr_enable : std_logic;
    signal temp_eop_done : std_logic;
    signal temp_bitstuff : std_logic;
    signal temp_data_output : std_logic;
    signal temp_transmit_data : std_logic;  
    signal temp_shift_done : std_logic; 
    signal temp_shift_strobe : std_logic;
    signal temp_eop_time  : std_logic;
     
begin   
  
request_data <= temp_shift_done;
  
eop_miniBlock: tx_eop_minitimer port map(
  clk => clk,
  rst_n => rst_n,
  eop_time => temp_eop_time,
  eop_done => temp_eop_done);  
  
controlBlock: tx_control port map(
  clk => clk,
  rst_n => rst_n,
  tx_enable => tx_enable,
  eop_done => temp_eop_done, --REMOVE THIS?
  tx_idle => tx_idle,
  eop_time => temp_eop_time,
  sr_enable => temp_sr_enable,
  timer_enable => temp_timer_enable);

bitstufferBlock: bitstuffer port map(
  clk => clk, 
  rst_n => rst_n, 
  shift_strobe => temp_shift_strobe,
  bitstuff => temp_bitstuff,
  data_output => temp_data_output,
  transmit_data => temp_transmit_data);
  
USB_EncoderBlock: USB_Encoder port map(
  transmit_data => temp_data_output,
  clk => clk,
  rst_n => rst_n,
  shift_strobe => temp_shift_strobe,
  bitstuff => temp_bitstuff,
  eop_time => temp_eop_time,
  data_plus => data_plus_out,
  data_minus => data_minus_out);

tx_srBlock: tx_sr port map(
  clk => clk,
  rst_n => rst_n,
  shift_strobe => temp_shift_strobe,
  shift_done => temp_shift_done,
  load_data => load_data,
  sr_enable => temp_sr_enable,
  transmit_data => temp_transmit_data,
  data_out => data_out);

timerBlock: tx_timer port map(
  clk => clk,
  rst_n => rst_n,
  timer_enable => temp_timer_enable,
  transmit_data => temp_transmit_data,
  shift_done => temp_shift_done,
  shift_strobe => temp_shift_strobe,
  bitstuff => temp_bitstuff);
  
  
end structural;