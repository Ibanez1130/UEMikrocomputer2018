library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	port(
		CLK         : in   std_logic;
		RST         : in   std_logic;
		SyncLoadConstant   : in   std_logic;
		AsyncClear   : in   std_logic;
		Overflow    : out  std_logic;
		Output      : out  std_logic_vector((3-1) downto 0)
	);
end counter;