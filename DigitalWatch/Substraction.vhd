-- Module Name:    Substraction Operation - Behavioral 
--creator Name : Nahla Hatem 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sub is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC);
end sub;

architecture Behavioral of sub is

component f_a 
port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
signal D :std_logic_vector(7 downto 1);
begin
U0: f_a port map(x=>A(0),y=>(not B(0)),z=>'0',s=>S(0),c=>D(1));
U1: f_a port map(x=>A(1),y=>(not B(1)),z=>D(1),s=>S(1),c=>D(2));
U2: f_a port map(x=>A(2),y=>(not B(2)),z=>D(2),s=>S(2),c=>D(3));
U3: f_a port map(x=>A(3),y=>(not B(3)),z=>D(3),s=>S(3),c=>D(4));
U4: f_a port map(x=>A(4),y=>(not B(4)),z=>D(4),s=>S(4),c=>D(5));
U5: f_a port map(x=>A(5),y=>(not B(5)),z=>D(5),s=>S(5),c=>D(6));
U6: f_a port map(x=>A(6),y=>(not B(6)),z=>D(6),s=>S(6),c=>D(7));
U7: f_a port map(x=>A(7),y=>(not B(7)),z=>D(7),s=>S(7),c=>C);

end Behavioral;


