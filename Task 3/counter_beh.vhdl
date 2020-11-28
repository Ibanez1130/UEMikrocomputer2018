-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavior of counter is
begin
	process (CLK, AsyncClear)
    	variable counter : std_logic_vector(2 downto 0) := "000";
        variable overout : std_logic;
    begin
    	if (rising_edge(CLK)) then
        	if (RST = '1') then
            	counter := "000";
                overout := '0';
            elsif (SyncLoadConstant = '1') then
            	counter := "111";
                overout := '0';
            elsif (counter = "111") then
            	counter := "000";
                overout := '1';
            else
            	counter := std_logic_vector(unsigned(counter) + "001");
                overout := '0';
            end if;
        end if;
        if (AsyncClear = '1') then
        	counter := "000";
            overout := '0';
        end if;
        Output <= counter;
        Overflow <= overout;
    end process;
end behavior;