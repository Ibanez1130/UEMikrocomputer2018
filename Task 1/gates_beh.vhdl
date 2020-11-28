-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use work.IEEE_1164_Gates_pkg.all;

architecture behavior of gates is
	signal nA, nB, nC, nD, nG3 : std_logic;
    signal G0, G1, G2, G3, G4 : std_logic;
begin
	nA <= not A;
    nB <= not B;
    nC <= not C;
    nD <= not D;
    
    U0: XOR3 port map(
    	I1 => B,
        I2 => C,
        I3 => nD,
        O => G0);
    
   	U1: NAND2 port map(
    	I1 => nA,
        I2 => nB,
        O => G1);
        
   	U2: OR2 port map(
    	I1 => nB,
        I2 => nC,
        O => G2);
        
   	U3: XOR3 port map(
    	I1 => nA,
        I2 => B,
        I3 => C,
        O => G3);
        
   	nG3 <= not G3;
    
    U4: OR4 port map(
    	I1 => G0,
        I2 => G1,
        I3 => G2,
        I4 => nG3,
        O => G4);
        
   	O <= G4;
end behavior;
