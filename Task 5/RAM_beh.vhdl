-- Code your design here
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

architecture Behavioral of RAM is
	constant RAM_DEPTH : integer := 2**10;
    type RAM is array (integer range <>) of std_logic_vector(7 downto 0);
    signal mem : RAM (0 to RAM_DEPTH - 1);
begin
	process (CLK)
    	variable out1 : std_logic_vector(15 downto 0);
    begin
    	if (rising_edge(CLK)) then
        	out1 := (others => 'Z');
        	if (en_read = '1') and (en_write1 = '0') and (en_write2 = '0') then
            	out1(7 downto 0) := mem(To_integer(unsigned(addr1)));
                out1(15 downto 8) := mem(To_integer(unsigned(addr1)) + 1);
            end if;
            if (en_read = '0') and (en_write1 = '1') and (en_write2 = '0') then
            	mem(To_integer(unsigned(addr1))) <= input1(7 downto 0);
                mem(To_integer(unsigned(addr1)) + 1) <= input1(15 downto 8);
            elsif (en_read = '0') and (en_write1 = '0') and (en_write2 = '1') then
            	mem(To_integer(unsigned(addr2))) <= input2(7 downto 0);
                mem(To_integer(unsigned(addr2)) + 1) <= input2(15 downto 8);
            elsif (en_read = '1') and (en_write1 = '0') and (en_write2 = '1') and (addr1 /= addr2) and (To_integer(unsigned(addr1)) /= To_integer(unsigned(addr2)) + 1) and (To_integer(unsigned(addr2)) /= To_integer(unsigned(addr1)) + 1) then
            	out1(7 downto 0) := mem(To_integer(unsigned(addr1)));
                out1(15 downto 8) := mem(To_integer(unsigned(addr1)) + 1);
                mem(To_integer(unsigned(addr2))) <= input2(7 downto 0);
                mem(To_integer(unsigned(addr2)) + 1) <= input2(15 downto 8);
            elsif (en_read = '0') and (en_write1 = '1') and (en_write2 = '1') and (addr1 /= addr2) and (To_integer(unsigned(addr1)) /= To_integer(unsigned(addr2)) + 1) and (To_integer(unsigned(addr2)) /= To_integer(unsigned(addr1)) + 1) then
            	mem(To_integer(unsigned(addr1))) <= input1(7 downto 0);
                mem(To_integer(unsigned(addr1)) + 1) <= input1(15 downto 8);
                mem(To_integer(unsigned(addr2))) <= input2(7 downto 0);
                mem(To_integer(unsigned(addr2)) + 1) <= input2(15 downto 8);
            end if;
        end if;
        output <= out1;
    end process;
end Behavioral;