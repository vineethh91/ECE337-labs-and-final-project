-- $Id: $
-- File name:   sram_module.vhd
-- Created:     11/19/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: Holds all the parts necessary for a SRAM module block.

LIBRARY IEEE;
library  ece337_ip;
USE IEEE.std_logic_1164.ALL;

entity sram_module is
    port (
        clk : in std_logic;
        rst : in std_logic;
        cont1_addr : in std_logic_vector(8 downto 0);
        cont2_addr : in std_logic_vector(8 downto 0);
        cont3_addr : in std_logic_vector(8 downto 0);
        cont4_addr : in std_logic_vector(8 downto 0);
        --bus_val1 : in std_logic_vector(7 downto 0);
        --bus_val2 : in std_logic_vector(7 downto 0);
        --bus_val3 : in std_logic_vector(7 downto 0);
        --bus_val4 : in std_logic_vector(7 downto 0);
        --write_enable1 : in std_logic;
        --write_enable2 : in std_logic;
        --write_enable3 : in std_logic;
        --write_enable4 : in std_logic;
        read_out1 : in std_logic_vector(7 downto 0);
        read_out2 : in std_logic_vector(7 downto 0);
        read_out3 : in std_logic_vector(7 downto 0); 
        read_out4 : in std_logic_vector(7 downto 0);
        SRAM1_addr : out std_logic_vector(8 downto 0);
        SRAM2_addr : out std_logic_vector(8 downto 0);
        SRAM3_addr : out std_logic_vector(8 downto 0); 
        SRAM4_addr : out std_logic_vector(8 downto 0);
        SRAM_SELECT : in std_logic_vector (1 downto 0);
        SRAM_ADDRESS : in std_logic_vector(8 downto 0);
        --read_enable : in std_logic;
        DATA_OUT : out std_logic_vector(7 downto 0);
        SRAM_control : out std_logic
    );
end entity;


architecture SRAMModule of sram_module is

    component SRAM_block is
        port (
            read_enable : in std_logic;
            write_enable : in std_logic;
            SRAM_addr : in std_logic_vector(8 downto 0);
            read_out : out std_logic_vector(7 downto 0);
            bus_val : in std_logic_vector(7 downto 0)
        );
    end component;
  
    component mini_timer is
        port (
            clk : in std_logic;
            rst : in std_logic;
            SRAM_control : out std_logic
            );
    end component mini_timer;
    
    component controller_decoder is
        port (
            clk : in std_logic;
            rst : in std_logic;
            SRAM_control : in std_logic;
            master_addr : in std_logic_vector(8 downto 0);
            cont_addr : in std_logic_vector(8 downto 0);
            SRAM_addr : out std_logic_vector(8 downto 0)
            );
    end component controller_decoder;
   

    signal SRAM_cont : std_logic;

begin

    CD1: controller_decoder port map (
        clk => clk, 
        rst => rst,
        SRAM_control => SRAM_cont,
        master_addr => SRAM_ADDRESS,
        cont_addr => cont1_addr,
        SRAM_addr => SRAM1_addr
    );
    
    CD2: controller_decoder port map (
        clk => clk, 
        rst => rst,
        SRAM_control => SRAM_cont,
        master_addr => SRAM_ADDRESS,
        cont_addr => cont2_addr,
        SRAM_addr => SRAM2_addr
    );
    
    CD3: controller_decoder port map (
        clk => clk, 
        rst => rst,
        SRAM_control => SRAM_cont,
        master_addr => SRAM_ADDRESS,
        cont_addr => cont3_addr,
        SRAM_addr => SRAM3_addr
    );
    
    CD4: controller_decoder port map (
        clk => clk, 
        rst => rst,
        SRAM_control => SRAM_cont,
        master_addr => SRAM_ADDRESS,
        cont_addr => cont4_addr,
        SRAM_addr => SRAM4_addr
    );
    
    MT: mini_timer port map (
        clk => clk,
        rst => rst,
        SRAM_control => SRAM_cont
    );
    
    --SSM1: SRAM_block port map (
                    -- Memory interface signals
                    --read_enable => read_enable,
                    --write_enable => write_enable1,
                    --SRAM_addr => SRAM1_addr,
                    --read_out => read_out1,
                    --bus_val => bus_val1
                   -- );
                   
                    
    DATA_OUT_MUX: process (read_out1, read_out2, read_out3, read_out4, SRAM_SELECT)
    begin
        case SRAM_SELECT is	
            when "00" =>
                DATA_OUT <= read_out1;
            when "01" =>
                DATA_OUT <= read_out2;
            when "10" =>
                DATA_OUT <= read_out3;
            when "11" =>
                DATA_OUT <= read_out4;
            when others =>
                DATA_OUT <= read_out1;
        end case;
    end process;
    
    SRAM_control <= SRAM_cont;  

end architecture;
