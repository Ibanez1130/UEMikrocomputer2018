-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use work.fsm_pkg.all;

architecture behavior of fsm is
	signal fsm : fsm_state;
begin
	process (CLK)
    begin
    	if (rising_edge(CLK)) then
        	if (RST = '1') then
            	STATE <= START;
                fsm <= START;
                OUTPUT <= "00";
            else
            	case fsm is
                	when START =>
                    	if (INPUT = "01") then
                        	STATE <= S1;
                            fsm <= S1;
                            OUTPUT <= "10";
                        end if;
                   	when S0 =>
                    	if (INPUT = "00") then
                        	STATE <= S2;
                            fsm <= S2;
                            OUTPUT <= "11";
                        end if;
                  	when S1 =>
                    	if (INPUT = "01") then
                        	STATE <= S0;
                            fsm <= S0;
                            OUTPUT <= "11";
                        elsif (INPUT = "00") then
                        	STATE <= S2;
                            fsm <= S2;
                            OUTPUT <= "11";
                        end if;
                  	when S2 =>
                    	if (INPUT = "00") then
                        	STATE <= S2;
                            fsm <= S2;
                            OUTPUT <= "00";
                        elsif (INPUT = "11") then
                        	STATE <= S1;
                            fsm <= S1;
                            OUTPUT <= "01";
                        end if;
                  	when others =>
                    	NULL;
                end case;
            end if;
        end if;
    end process;
end behavior;
