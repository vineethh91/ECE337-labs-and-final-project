-- $Id: $
-- File name:   tb_addr1Bit.vhd
-- Created:     9/4/2012
-- Author:      Vineeth Harikumar
-- Lab Section: 337-01
-- Version:     1.0  Initial Test Bench

library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_addr1Bit is
end tb_addr1Bit;

architecture TEST of tb_addr1Bit is

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

  component addr1Bit
    PORT(
         A : in std_logic;
         B : in std_logic;
         Cin : in std_logic;
         S : out std_logic;
         Cout : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal A : std_logic;
  signal B : std_logic;
  signal Cin : std_logic;
  signal S : std_logic;
  signal Cout : std_logic;

-- signal <name> : <type>;

begin
  DUT: addr1Bit port map(
                A => A,
                B => B,
                Cin => Cin,
                S => S,
                Cout => Cout
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

E:process

    variable result : STD_LOGIC_VECTOR(2 downto 0);
  begin

-- Insert TEST BENCH Code Here
    for k in 0 to 7 loop
      result := UINT_TO_STDV(k,3);
      A <= result(0);--UINT_TO_STDV(k,3)(0);
      B <= result(1);--UINT_TO_STDV(k,3)(1);
      Cin <= result(2);--UINT_TO_STDV(k,3)(2);
      wait for 20 ns;
    end loop;

  end process E;
end TEST;
