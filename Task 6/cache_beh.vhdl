-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavior of cache is
	type cache_t is array (0 to 7) of std_logic_vector(9 downto 0);
    constant cache : cache_t := (
    	"1111100000",
        "1100100110",
        "1100110100",
        "1111111010",
        "1101111101",
        "1110101100",
        "1000101110",
        "1001110100");
begin
	process (clk)
    begin
    	if (rising_edge(clk)) then
        	if (en_read = '1') then
            	if (To_integer(unsigned(addr(2 downto 0))) > 7) then
                	data <= (others => 'Z');
                	ch_cm <= '0';
                elsif (cache(To_integer(unsigned(addr(2 downto 0))))(9 downto 6) = addr(6 downto 3)) then
                	data <= cache(To_integer(unsigned(addr(2 downto 0))))(5 downto 0);
                    ch_cm <= '1';
                else
                	data <= (others => 'Z');
                	ch_cm <= '0';
                end if;
            else
            	data <= (others => 'Z');
                ch_cm <= '0';
            end if;
        end if;
    end process;
end behavior;