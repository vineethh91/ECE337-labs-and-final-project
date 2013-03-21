-- $Id: 	mg32
-- File name:   rx_rcu.vhd
-- Created:     11/21/2012
-- Author:      Edward Kidarsa
-- Lab Section: 337-04
-- Version:     1.0  Initial Design Entry
-- Description: Controller and Timer top level


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity rx_rcu is
  port (
    clk		: in  std_logic;
    rst		: in  std_logic;
    d_orig	: in  std_logic;
    d_edge	: in  std_logic;
    eop		: in  std_logic;
    shift_de	: out std_logic;
    shift_re	: out std_logic;
    strobe	: out std_logic);
end entity rx_rcu;

architecture rcu of rx_rcu is

  component rx_controller is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_edge    : in  std_logic;
      bit8	: in  std_logic;
      eop	: in  std_logic;
      strobe	: out std_logic;
      counting	: out std_logic);
  end component;

  component rx_timer is
    port (
      clk	: in  std_logic;
      rst	: in  std_logic;
      d_orig	: in  std_logic;
      counting	: in  std_logic;
      bit_8	: out std_logic;
      shift_de	: out std_logic;
      shift_re	: out std_logic);
  end component;

  signal in_bit8	: std_logic;
  signal in_counting	: std_logic;

begin

  rx_controller_block: rx_controller
    port map (
      clk	=> clk,
      rst	=> rst,
      d_edge	=> d_edge,
      bit8	=> in_bit8,
      eop	=> eop,
      strobe	=> strobe,
      counting	=> in_counting);

  rx_timer_block: rx_timer
    port map (
      clk	=> clk,
      rst	=> rst,
      d_orig	=> d_orig,
      counting	=> in_counting,
      bit_8	=> in_bit8,
      shift_de	=> shift_de,
      shift_re	=> shift_re);

end architecture rcu;
      
