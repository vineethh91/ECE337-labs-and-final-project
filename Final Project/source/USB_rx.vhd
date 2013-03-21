-- $Id: 	mg32
-- File name:   USB_rx.vhd
-- Created:     11/22/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Design Entry
-- Description: Receiver block of the USB transceiver port


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity USB_rx is
  port (
    clk		: in  std_logic;
    rst		: in  std_logic;
    d_plus	: in  std_logic;
    d_minus	: in  std_logic;
    USB_Data	: out std_logic_vector (7 downto 0);
    Byte_Done	: out std_logic;
    EOP		: out std_logic);
end entity USB_rx;

architecture receiver of USB_rx is

  component rx_edge_detect is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_plus	: in  std_logic;
      d_edge	: out std_logic);
  end component;

  component rx_decode is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_plus	: in  std_logic;
      shift_en	: in  std_logic;
      eop : in  std_logic;
      d_orig	: out std_logic);
  end component;

  component rx_eop_detect is
    port (
      d_plus	: in  std_logic;
      d_minus	: in  std_logic;
      eop	: out std_logic);
  end component;

  component rx_shift_reg is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_orig	: in  std_logic;
      shift_en	: in  std_logic;
      b_d	: out std_logic_vector (7 downto 0));
  end component;

  component rx_rcu is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_orig	: in  std_logic;
      d_edge	: in  std_logic;
      eop	: in  std_logic;
      shift_de	: out std_logic;
      shift_re	: out std_logic;
      strobe	: out std_logic);
  end component;

  signal in_d_edge	: std_logic;
  signal in_shift_de	: std_logic;
  signal in_shift_re	: std_logic;
  signal in_d_orig	: std_logic;
  signal in_eop		: std_logic;

begin

  rx_edge_detect_block: rx_edge_detect
    port map (
      clk	=> clk,
      rst	=> rst,
      d_plus	=> d_plus,
      d_edge	=> in_d_edge);

  rx_decode_block: rx_decode
    port map (
      clk	=> clk,
      rst	=> rst,
      d_plus	=> d_plus,
      shift_en	=> in_shift_de,
      eop =>  in_eop,
      d_orig	=> in_d_orig);

  rx_eop_detect_block: rx_eop_detect
    port map (
      d_plus	=> d_plus,
      d_minus	=> d_minus,
      eop	=> in_eop);

  rx_shift_reg_block: rx_shift_reg
    port map (
      clk	=> clk,
      rst	=> rst,
      d_orig	=> in_d_orig,
      shift_en	=> in_shift_re,
      b_d	=> USB_Data);

  rx_rcu_block: rx_rcu
    port map (
      clk	=> clk,
      rst	=> rst,
      d_orig	=> in_d_orig,
      d_edge	=> in_d_edge,
      eop	=> in_eop,
      shift_de	=> in_shift_de,
      shift_re	=> in_shift_re,
      strobe	=> Byte_Done);

  EOP <= in_eop;

end architecture receiver;
