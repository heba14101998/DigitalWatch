-- Module Name:    4Bit_Binary_Adder - Behavioral 
--creator Name:    Mona Khaled & Heba mohamed 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder_4Bit is
     port(
         a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         carry : out STD_LOGIC;
         sum : out STD_LOGIC_VECTOR(3 downto 0)
         );
end Adder_4Bit;

architecture Adder_4Bit_arc of Adder_4Bit is

Component FullAdder is
    port (a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          sum : out STD_LOGIC;
          carry : out STD_LOGIC
          );
end component;        

signal s : std_logic_vector (2 downto 0);

begin 
    
    u0 : FullAdder port map (a(0),b(0),'0',sum(0),s(0));
    u1 : FullAdder port map (a(1),b(1),s(0),sum(1),s(1));
    u2 : FullAdder port map (a(2),b(2),s(1),sum(2),s(2));
    ue : FullAdder port map (a(3),b(3),s(2),sum(3),carry);

end Adder_4Bit_arc; 