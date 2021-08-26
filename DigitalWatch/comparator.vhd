-- Module Name:    Alarm - Behavioral
--creator Name:    Mona Elsayed & Nada Elsayed

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 entity  comparator is
  port (
       min1_W,min1_A  : in std_logic_vector ( 3 downto 0);  
		 min2_W,min2_A  : in std_logic_vector ( 3 downto 0); 
       hour1_W,hour1_A: in std_logic_vector ( 3 downto 0); 
       hour2_W,hour2_A: in std_logic_vector ( 3 downto 0); 		 
       equal: out std_logic );

   end comparator; 
  
 architecture comparator_arc of comparator is 
 begin
 equal  <= '1' when( (min1_W=min1_A )and (min2_W=min2_A )and (hour1_W=hour1_A)and (hour2_W=hour2_A) ) else '0';
   
	end comparator_arc;