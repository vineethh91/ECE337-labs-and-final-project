-- $Id: $
-- File name:   USB_Switch.vhd
-- Created:     11/29/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Top Level of Awesomeness


LIBRARY IEEE;
library ece337_ip;
USE IEEE.std_logic_1164.ALL;
use ece337_ip.all;

entity USB_Switch is
  port (
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
    USB1_EN  : out std_logic;
    USB2_EN  : out std_logic;
    USB3_EN  : out std_logic;
    USB4_EN  : out std_logic;
    USB5_EN  : out std_logic;
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
    BUS_VAL11	  : out std_logic_vector (7 downto 0);
    BUS_VAL12	  : out std_logic_vector (7 downto 0);
    BUS_VAL13	  : out std_logic_vector (7 downto 0);
    BUS_VAL14	  : out std_logic_vector (7 downto 0);
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
    BUS_VAL21	  : out std_logic_vector (7 downto 0);
    BUS_VAL22	  : out std_logic_vector (7 downto 0);
    BUS_VAL23	  : out std_logic_vector (7 downto 0);
    BUS_VAL24	  : out std_logic_vector (7 downto 0);
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
    BUS_VAL31	  : out std_logic_vector (7 downto 0);
    BUS_VAL32	  : out std_logic_vector (7 downto 0);
    BUS_VAL33	  : out std_logic_vector (7 downto 0);
    BUS_VAL34	  : out std_logic_vector (7 downto 0);
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
    BUS_VAL41	  : out std_logic_vector (7 downto 0);
    BUS_VAL42	  : out std_logic_vector (7 downto 0);
    BUS_VAL43	  : out std_logic_vector (7 downto 0);
    BUS_VAL44	  : out std_logic_vector (7 downto 0);
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
    BUS_VAL51	  : out std_logic_vector (7 downto 0);
    BUS_VAL52	  : out std_logic_vector (7 downto 0);
    BUS_VAL53	  : out std_logic_vector (7 downto 0);
    BUS_VAL54	  : out std_logic_vector (7 downto 0);
    read_enable5 : out std_logic
    );
end entity;

architecture USBSwitch of USB_Switch is
  component transceiver
    generic ( 
  	portaddress : std_logic_vector(7 downto 0) := "00000001"
    );
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         d_plus_in : in std_logic;
         d_plus_out : out std_logic;
         d_minus_in : in std_logic;
         d_minus_out : out std_logic;
         d_enable : out std_logic;
         bus_IN_data1 : in std_logic_vector(9 downto 0);
         bus_IN_data2 : in std_logic_vector(9 downto 0);
         bus_IN_data3 : in std_logic_vector(9 downto 0);
         bus_IN_data4 : in std_logic_vector(9 downto 0);
         bus_OUT_data : out std_logic_vector(9 downto 0);
         read_out1 : in std_logic_vector(7 downto 0);
    	 read_out2 : in std_logic_vector(7 downto 0);
    	 read_out3 : in std_logic_vector(7 downto 0); 
    	 read_out4 : in std_logic_vector(7 downto 0);
    	 SRAM1_addr : out std_logic_vector(8 downto 0);
   	  	 SRAM2_addr : out std_logic_vector(8 downto 0);
    	 SRAM3_addr : out std_logic_vector(8 downto 0); 
    	 SRAM4_addr : out std_logic_vector(8 downto 0);
    	 Write_Enable1 : out std_logic;	
    	 Write_Enable2 : out std_logic;
    	 Write_Enable3 : out std_logic;
    	 Write_Enable4 : out std_logic;
    	 BUS_VAL1	  : out std_logic_vector (7 downto 0);
    	 BUS_VAL2	  : out std_logic_vector (7 downto 0);
    	 BUS_VAL3	  : out std_logic_vector (7 downto 0);
    	 BUS_VAL4	  : out std_logic_vector (7 downto 0);
    	 read_enable : out std_logic
    );
  end component;
  
  signal d1e, d2e, d3e, d4e, d5e : std_logic;
  signal bus1, bus2, bus3, bus4, bus5 : std_logic_vector(9 downto 0);
begin

    T1: transceiver  -- Port 1
    generic map ( 
  	portaddress => "00000001"
    )
    port map (
        clk => clk,
        rst_n => nRst,
        d_plus_in => USB1_DPI,
        d_plus_out => USB1_DPO,
        d_minus_in => USB1_DMI,
        d_minus_out => USB1_DMO,
        d_enable => d1e,
        bus_IN_data1 => bus2,
        bus_IN_data2 => bus3,
        bus_IN_data3 => bus4,
        bus_IN_data4 => bus5,
        bus_OUT_data => bus1,
        read_out1 => read_out11,
    	read_out2 => read_out12,
    	read_out3 => read_out13,
    	read_out4 => read_out14,
    	SRAM1_addr => SRAM1_addr1,
    	SRAM2_addr => SRAM2_addr1,
    	SRAM3_addr => SRAM3_addr1,
    	SRAM4_addr => SRAM4_addr1,
    	Write_Enable1 => Write_Enable11,
    	Write_Enable2 => Write_Enable12,
    	Write_Enable3 => Write_Enable13,
    	Write_Enable4 => Write_Enable14,
    	BUS_VAL1 => BUS_VAL11,
    	BUS_VAL2 => BUS_VAL12,
    	BUS_VAL3 => BUS_VAL13,
    	BUS_VAL4 => BUS_VAL14,
    	read_enable => read_enable1
    );
    
    T2: transceiver -- Port 2
    generic map ( 
  	portaddress => "00000010"
    )
    port map (
        clk => clk,
        rst_n => nRst,
        d_plus_in => USB2_DPI,
        d_plus_out => USB2_DPO,
        d_minus_in => USB2_DMI,
        d_minus_out => USB2_DMO,
        d_enable => d2e,
        bus_IN_data1 => bus1,
        bus_IN_data2 => bus3,
        bus_IN_data3 => bus4,
        bus_IN_data4 => bus5,
        bus_OUT_data => bus2,
        read_out1 => read_out21,
    	read_out2 => read_out22,
    	read_out3 => read_out23,
    	read_out4 => read_out24,
    	SRAM1_addr => SRAM1_addr2,
    	SRAM2_addr => SRAM2_addr2,
    	SRAM3_addr => SRAM3_addr2,
    	SRAM4_addr => SRAM4_addr2,
    	Write_Enable1 => Write_Enable21,
    	Write_Enable2 => Write_Enable22,
    	Write_Enable3 => Write_Enable23,
    	Write_Enable4 => Write_Enable24,
    	BUS_VAL1 => BUS_VAL21,
    	BUS_VAL2 => BUS_VAL22,
    	BUS_VAL3 => BUS_VAL23,
    	BUS_VAL4 => BUS_VAL24,
    	read_enable => read_enable2
    );
    
    T3: transceiver  -- Port 3
    generic map ( 
  	portaddress => "00000011"
    )
    port map (
        clk => clk,
        rst_n => nRst,
        d_plus_in => USB3_DPI,
        d_plus_out => USB3_DPO,
        d_minus_in => USB3_DMI,
        d_minus_out => USB3_DMO,
        d_enable => d3e,
        bus_IN_data1 => bus1,
        bus_IN_data2 => bus2,
        bus_IN_data3 => bus4,
        bus_IN_data4 => bus5,
        bus_OUT_data => bus3,
        read_out1 => read_out31,
    	read_out2 => read_out32,
    	read_out3 => read_out33,
    	read_out4 => read_out34,
    	SRAM1_addr => SRAM1_addr3,
    	SRAM2_addr => SRAM2_addr3,
    	SRAM3_addr => SRAM3_addr3,
    	SRAM4_addr => SRAM4_addr3,
    	Write_Enable1 => Write_Enable31,
    	Write_Enable2 => Write_Enable32,
    	Write_Enable3 => Write_Enable33,
    	Write_Enable4 => Write_Enable34,
    	BUS_VAL1 => BUS_VAL31,
    	BUS_VAL2 => BUS_VAL32,
    	BUS_VAL3 => BUS_VAL33,
    	BUS_VAL4 => BUS_VAL34,
    	read_enable => read_enable3
    );
    
    T4: transceiver  -- Port 4
    generic map ( 
  	portaddress => "00000100"
    )
    port map (
        clk => clk,
        rst_n => nRst,
        d_plus_in => USB4_DPI,
        d_plus_out => USB4_DPO,
        d_minus_in => USB4_DMI,
        d_minus_out => USB4_DMO,
        d_enable => d4e,
        bus_IN_data1 => bus1,
        bus_IN_data2 => bus2,
        bus_IN_data3 => bus3,
        bus_IN_data4 => bus5,
        bus_OUT_data => bus4,
        read_out1 => read_out41,
    	read_out2 => read_out42,
    	read_out3 => read_out43,
    	read_out4 => read_out44,
    	SRAM1_addr => SRAM1_addr4,
    	SRAM2_addr => SRAM2_addr4,
    	SRAM3_addr => SRAM3_addr4,
    	SRAM4_addr => SRAM4_addr4,
    	Write_Enable1 => Write_Enable41,
    	Write_Enable2 => Write_Enable42,
    	Write_Enable3 => Write_Enable43,
    	Write_Enable4 => Write_Enable44,
    	BUS_VAL1 => BUS_VAL41,
    	BUS_VAL2 => BUS_VAL42,
    	BUS_VAL3 => BUS_VAL43,
    	BUS_VAL4 => BUS_VAL44,
    	read_enable => read_enable4
    );
    
    T5: transceiver  -- Port 5
    generic map ( 
  	portaddress => "00000101"
    )
    port map (
        clk => clk,
        rst_n => nRst,
        d_plus_in => USB5_DPI,
        d_plus_out => USB5_DPO,
        d_minus_in => USB5_DMI,
        d_minus_out => USB5_DMO,
        d_enable => d5e,
        bus_IN_data1 => bus1,
        bus_IN_data2 => bus2,
        bus_IN_data3 => bus3,
        bus_IN_data4 => bus4,
        bus_OUT_data => bus5,
        read_out1 => read_out51,
    	read_out2 => read_out52,
    	read_out3 => read_out53,
    	read_out4 => read_out54,
    	SRAM1_addr => SRAM1_addr5,
    	SRAM2_addr => SRAM2_addr5,
    	SRAM3_addr => SRAM3_addr5,
    	SRAM4_addr => SRAM4_addr5,
    	Write_Enable1 => Write_Enable51,
    	Write_Enable2 => Write_Enable52,
    	Write_Enable3 => Write_Enable53,
    	Write_Enable4 => Write_Enable54,
    	BUS_VAL1 => BUS_VAL51,
    	BUS_VAL2 => BUS_VAL52,
    	BUS_VAL3 => BUS_VAL53,
    	BUS_VAL4 => BUS_VAL54,
    	read_enable => read_enable5
    );

end architecture;
