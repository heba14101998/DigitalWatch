-- Module Name:    FullAdder - Behavioral 
--creator Name:    Mona Khaled & Heba mohamed 
library ieee;
use ieee.std_logic_1164.all;         
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity FullAdder is
    port (    
	       a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          sum : out STD_LOGIC;
          carry : out STD_LOGIC
          );
end FullAdder;

architecture FullAdder_arc of FullAdder is
begin
    
    sum <= a xor b xor c;
    carry <= (a and b) or (b and c) or (c and a);
    
end FullAdder_arc;