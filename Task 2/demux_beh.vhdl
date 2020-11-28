-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavior of demux is
begin
	process(IN1, SEL)
    begin
    	case SEL is
        	when "000" =>
            	OUT1 <= IN1;
                OUT2 <= "00";
                OUT3 <= "00";
                OUT4 <= "00";
                OUT5 <= "00";
                OUT6 <= "00";
        	when "001" =>
            	OUT1 <= "00";
                OUT2 <= IN1;
                OUT3 <= "00";
                OUT4 <= "00";
                OUT5 <= "00";
                OUT6 <= "00";
        	when "010" =>
            	OUT1 <= "00";
                OUT2 <= "00";
                OUT3 <= IN1;
                OUT4 <= "00";
                OUT5 <= "00";
                OUT6 <= "00";
        	when "011" =>
            	OUT1 <= "00";
                OUT2 <= "00";
                OUT3 <= "00";
                OUT4 <= IN1;
                OUT5 <= "00";
                OUT6 <= "00";
        	when "100" =>
            	OUT1 <= "00";
                OUT2 <= "00";
                OUT3 <= "00";
                OUT4 <= "00";
                OUT5 <= IN1;
                OUT6 <= "00";
        	when "101" =>
            	OUT1 <= "00";
                OUT2 <= "00";
                OUT3 <= "00";
                OUT4 <= "00";
                OUT5 <= "00";
                OUT6 <= IN1;
        	when others =>
            	OUT1 <= "00";
                OUT2 <= "00";
                OUT3 <= "00";
                OUT4 <= "00";
                OUT5 <= "00";
                OUT6 <= "00";
        end case;
    end process;
end behavior;