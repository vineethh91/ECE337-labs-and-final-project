library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rcu is
generic (Period : Time := 10 ns);
end tb_rcu;

architecture TEST of tb_rcu is

  function UINT_TO_STDV( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
  begin
    return std_logic_vector(to_unsigned(X, NumBits));
  end;

  component rcu
    PORT(
         CLK : in std_logic;
         nRST : in std_logic;
         START : in std_logic;
         STROBE : in std_logic;
         STOP : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal CLK : std_logic;
  signal nRST : std_logic;
  signal START : std_logic;
  signal STROBE : std_logic;
  signal STOP : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable CLK_tmp: std_logic := '0';
begin
  CLK_tmp := not CLK_tmp;
  CLK <= CLK_tmp;
  wait for Period/2;
end process;

  DUT: rcu port map(
                CLK => CLK,
                nRST => nRST,
                START => START,
                STROBE => STROBE,
                STOP => STOP
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    -- RESETTING THE SYSTEM
    nRST   <= '0'; 
    START  <= '0';
    STROBE <= '0';
    wait for 45 ns;
    nRST   <= '1';
    wait for 20 ns;

    -- CREATING A START FLAG
    START  <= '1';
    wait for 10 ns;
    START  <= '0';
    wait for 90 ns;

    -- SENDING FOUR BITS OF DATA AT 10 MHz (First Packet)
    for i in 4 downto 0 loop
      STROBE <= '0';
      wait for 90 ns;
      STROBE <= '1';
      wait for 10 ns;
    end loop;  -- i
    STROBE <= '0';

    assert STOP = '1'
      report "System did NOT received data properly (1)" severity error;
    assert STOP /= '1'
      report "System received data properly (1)" severity note;
    wait for 200 ns;


    -- CREATING A START FLAG
    START  <= '1';
    wait for 10 ns;
    START  <= '0';
    wait for 90 ns;

    -- SENDING FOUR BITS OF DATA AT 10 MHz (First Packet)
    for i in 4 downto 0 loop
      STROBE <= '0';
      wait for 90 ns;
      STROBE <= '1';
      wait for 10 ns;
    end loop;  -- i
    STROBE <= '0';

    assert STOP = '1'
      report "System did NOT received data properly (2)" severity error;
    assert STOP /= '1'
      report "System received data properly (2)" severity note;


    wait;


    
  end process;
end TEST;
