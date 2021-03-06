-- $Id: $
-- File name:   USB_Switch_Top.vhd
-- Created:     12/3/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Top Level with less pins.


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity USB_Switch_Top is
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
    USB5_EN  : out std_logic
    );
end entity;

architecture USB_TOP of USB_Switch_Top is

component USB_Switch is
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
end component;

	signal read_enable : std_logic;
	signal sram_out : std_logic_vector(7 downto 0);
	signal out_8 : std_logic_vector(8 downto 0);

begin

	DUT: USB_Switch port map (
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
    USB1_EN  => USB1_EN,
    USB2_EN  => USB2_EN,
    USB3_EN  => USB3_EN,
    USB4_EN  => USB4_EN,
    USB5_EN  => USB5_EN,
    read_out11 => "00000000",
    read_out12 => "00000000",
    read_out13 => "00000000",
    read_out14 => "00000000",
    SRAM1_addr1 => out_8,
    SRAM2_addr1 => out_8,
    SRAM3_addr1 => out_8,
    SRAM4_addr1 => out_8,
    Write_Enable11 => read_enable,
    Write_Enable12 => read_enable,
    Write_Enable13 => read_enable,
    Write_Enable14 => read_enable,
    BUS_VAL11	=> sram_out,
    BUS_VAL12	=> sram_out,
    BUS_VAL13	=> sram_out,
    BUS_VAL14	=> sram_out,
    read_enable1 => read_enable,
    read_out21 => "00000000",
    read_out22 => "00000000",
    read_out23 => "00000000",
    read_out24 => "00000000",
    SRAM1_addr2 => out_8,
    SRAM2_addr2 => out_8,
    SRAM3_addr2 => out_8,
    SRAM4_addr2 => out_8,
    Write_Enable21 => read_enable,	
    Write_Enable22 => read_enable,
    Write_Enable23 => read_enable,
    Write_Enable24 => read_enable,
    BUS_VAL21	  => sram_out,
    BUS_VAL22	  => sram_out,
    BUS_VAL23	  => sram_out,
    BUS_VAL24	  => sram_out,
    read_enable2 => read_enable,
    read_out31 => "00000000",
    read_out32 => "00000000",
    read_out33 => "00000000", 
    read_out34 => "00000000",
    SRAM1_addr3 => out_8,
    SRAM2_addr3 => out_8,
    SRAM3_addr3 => out_8, 
    SRAM4_addr3 => out_8,
    Write_Enable31 => read_enable,	
    Write_Enable32 => read_enable,
    Write_Enable33 => read_enable,
    Write_Enable34 => read_enable,
    BUS_VAL31	  => sram_out,
    BUS_VAL32	  => sram_out,
    BUS_VAL33	  => sram_out,
    BUS_VAL34	  => sram_out,
    read_enable3 => read_enable,
    read_out41 => "00000000",
    read_out42 => "00000000",
    read_out43 => "00000000", 
    read_out44 => "00000000",
    SRAM1_addr4 => out_8,
    SRAM2_addr4 => out_8,
    SRAM3_addr4 => out_8, 
    SRAM4_addr4 => out_8,
    Write_Enable41 => read_enable,	
    Write_Enable42 => read_enable,
    Write_Enable43 => read_enable,
    Write_Enable44 => read_enable,
    BUS_VAL41	  => sram_out,
    BUS_VAL42	  => sram_out,
    BUS_VAL43	  => sram_out,
    BUS_VAL44	  => sram_out,
    read_enable4 => read_enable,
    read_out51 => "00000000",
    read_out52 => "00000000",
    read_out53 => "00000000", 
    read_out54 => "00000000",
    SRAM1_addr5 => out_8,
    SRAM2_addr5 => out_8,
    SRAM3_addr5 => out_8, 
    SRAM4_addr5 => out_8,
    Write_Enable51 => read_enable,	
    Write_Enable52 => read_enable,
    Write_Enable53 => read_enable,
    Write_Enable54 => read_enable,
    BUS_VAL51	  => sram_out,
    BUS_VAL52	  => sram_out,
    BUS_VAL53	  => sram_out,
    BUS_VAL54	  => sram_out,
    read_enable5 => read_enable
	);

end architecture;
