library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calc is
    Port ( A0 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (3 downto 0);
           outpt : out  STD_LOGIC_VECTOR (15 downto 0));
end calc;

architecture Behavioral of calc is
component addder 
port (     A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC);
end component;


component mult  
port (     x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0) );
end component;

component sub
port (     A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC);
end component;


component div 
port (     a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           r : out  STD_LOGIC_VECTOR (7 downto 0));
end component;



component count
port (     Ain : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0) );
end component;

signal A :std_logic_vector(7 downto 0);
signal B :std_logic_vector(7 downto 0);
signal s0 :std_logic_vector(7 downto 0);
signal s1 :std_logic_vector(7 downto 0);
signal s2 :std_logic_vector(7 downto 0);
signal O :std_logic_vector(15 downto 0);
signal V :std_logic_vector(7 downto 0);
signal c0 :std_logic;
signal c1 :std_logic;
begin
U0: count port map (A0,clear,A);
U1: count port map (B0,clear,B);
U2: addder port map (A,B,s0,c0);
U3: sub port map (A,B,s1,c1);
U4: mult	port map (A,B,O);
U5: div	port map (A,B,s2,V);

process(op,clear)
   begin
if clear<='0' then 
 outpt<="0000000000000000";
 else
   if op(0)='1' then 	outpt(8)<=c0;
	outpt(7 downto 0)<=s0;
	elsif op(1)='1' then 

	outpt(8)<=c1;
	outpt(7 downto 0)<=s1;
	elsif op(2)='1' then

	outpt<=O;
	elsif op(3)='1' then 

outpt(7 downto 0)<=s2;
	outpt(15 downto 8)<=V;
end if;
end if;
end process;

end Behavioral;