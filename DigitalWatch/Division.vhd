-- Module Name:    Division Operation - Behavioral 
--creator Name : Nahla Hatem 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           r : out  STD_LOGIC_VECTOR (7 downto 0));
end div;

architecture Behavioral of div is

Signal Atemp : Std_Logic_Vector (7 downto 0);
begin

Proc1: Process (a,b, Atemp)
variable cnt : STD_LOGIC_Vector(7 downto 0);
begin

if (a < b) then
        cnt := "00000000";
        Atemp <= a;
elsif (a = b) then
        cnt := "00000001";
elsif (a > b) then
        cnt := "00000001";
        Atemp <= (a - b);
        while (Atemp >= b) loop
            if(Atemp >=b) then
                Atemp <= (Atemp - b);
                cnt := cnt + "00000001";
            end if;
        end loop;
end if;
q <= cnt;
r <= Atemp;
end process Proc1;
end Behavioral;
