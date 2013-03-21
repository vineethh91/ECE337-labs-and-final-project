-- $Id: $
-- File name:   SRAM_block.vhd
-- Created:     12/1/2012
-- Author:      Bryan Dallas
-- Lab Section: 337-01
-- Version:     1.0  Initial Design Entry
-- Description: A simple mapping to SRAM since it can't be synthesised


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity SRAM_block is
    port (
        read_enable : in std_logic;
        write_enable : in std_logic;
        SRAM_addr : in std_logic_vector(8 downto 0);
        read_out : out std_logic_vector(7 downto 0);
        bus_val : in std_logic_vector(7 downto 0)
    );
end entity;

architecture SRAMBlock of SRAM_block is
    -- The declaration for the on-chip scalable sram model
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
    
begin

    SSM1: simple_scale_mem generic map (
                    -- Memory interface parameters
                    ADDR_SIZE_BITS  => 9,				-- Set the address length in bits
                    WORD_SIZE_BYTES  => 1,			-- Set the word size in Bytes
                    DATA_SIZE_WORDS  => 1,			-- Set the data access size in words (how many words do you want to access each time)
                    READ_DELAY      => 5 ns,  -- CLK is 1 ns longer than access delay for conservative padding for flipflop setup times
                    WRITE_DELAY      => 5 ns  -- CLK is 1 ns longer than access delay for conservative padding for Real SRAM hold times
                    )
                port map (
                    -- Test bench control signals
                    mem_clr => FALSE,
                    mem_init => FALSE,
                    mem_dump => FALSE,
                    verbose => FALSE,
                    init_filename => "",
                    dump_filename => "",
                    start_address => 0,
                    last_address => 390,

                    -- Memory interface signals
                    r_enable => read_enable,
                    w_enable => write_enable,
                    addr => SRAM_addr,
                    r_data => read_out,
                    w_data => bus_val
                    );

end architecture;
