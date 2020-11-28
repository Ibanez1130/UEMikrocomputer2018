-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

architecture behavior of pwm is
	constant clk_frq : integer := 50000000;
    constant pwm_frq : integer := 100000;
    constant pwm_rep : integer := (clk_frq/pwm_frq);
    constant duty_cycle : integer := integer(0.36*real(pwm_rep));
    constant offset : integer := 0;
    signal counter : integer range 0 to pwm_rep - 1 := 0;
begin
	process (CLK)
    	variable out1 : std_logic;
    begin
    	if CLK = '1' and CLK'event then
        	if (counter = pwm_rep - 1) then
            	counter <= 0;
            else
            	counter <= counter + 1;
            end if;
            if counter>=offset and counter<(offset+duty_cycle) then
            	out1 := '1';
            else
            	out1 := '0';
            end if;
        end if;
        O <= out1;
    end process;
end behavior;
