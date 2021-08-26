-- Module Name:    Digital Watch & Date - Behavioral 
-- creator Name:    Haidy Ashraf 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Stopwatch is
    Port ( 
	      CLK    : in  STD_LOGIC;
         RST    : in  STD_LOGIC;--Active Low
			start  : in  STD_LOGIC;
			stop   : in  STD_LOGIC;
         sec1   : out std_logic_vector (3 downto 0);--0 to 9
			sec2   : out std_logic_vector (3 downto 0);--0 to 5
		   min1   : out std_logic_vector (3 downto 0);--0 to 9
			min2   : out std_logic_vector (3 downto 0);--0 to 5
		   hour1  : out std_logic_vector (3 downto 0);--0 to 9
			hour2  : out std_logic_vector (3 downto 0) --0 to 2
           );
end Stopwatch;

architecture Watch of Stopwatch is

component Adder_4Bit  
   port(
         a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         carry : out STD_LOGIC;
         sum : out STD_LOGIC_VECTOR(3 downto 0)
         );
end component ;
-----------------------------------------------------------
signal ssec1  ,ssec2 : std_logic_vector (3 downto 0):="0000";
signal mmin1  ,mmin2 : std_logic_vector (3 downto 0):="0000";
signal hhour1 ,hhour2: std_logic_vector (3 downto 0):="0000";

signal seg_sec1 ,seg_sec2   : std_logic_vector(7 downto 0);
signal seg_min1 ,seg_min2   : std_logic_vector(7 downto 0);
signal seg_hour1,seg_hour2  : std_logic_vector(7 downto 0);

type state is (Go,count);
signal Pr_state,Nt_state:state:=GO;
----------------------------------------------------------
BEGIN
process(CLK,RST) 

begin
if RST='0' then 
   sec1  <="0000";
   sec2  <="0000";
   min1  <="0000";
   min2  <="0000";
   hour1 <="0000";
   hour2 <="0000";
   Pr_state <= Go; 
elsif(CLK'event and CLK='1') then
     Pr_state <= Nt_state;
     end if ;
end process;
----------------------------------------
PROCESS(CLK, RST)
BEGIN
case Pr_state is 

  when Go => 
     ssec1  <="0000";
     ssec2  <="0000";
     mmin1  <="0000";
     mmin2  <="0000";
     hhour1 <="0000";
     hhour2 <="0000";
  IF (start='1') THEN
      Nt_state<=count;
      END IF ;
	  
 when count =>
 
     ssec1 <= ssec1 +1; 	  
IF (ssec1="1001") THEN                   
     ssec1 <= "0000";
     ssec2 <= ssec2 + 1;
 
IF (ssec2= "0101" and ssec2="1001") THEN
     ssec1 <= "0000";
     ssec2 <= "0000";
     mmin1 <= mmin1 + 1;
 
IF (mmin1="1001") THEN
     mmin1 <= "0000";
     mmin2 <= mmin2 + 1;
 
IF (mmin2="0101" and mmin1="1001") THEN
     mmin1 <= "0000";
     mmin2 <= "0000";
     hhour1 <= hhour1 + 1;
 
IF (hhour1="1001" )THEN
     hhour1 <="0000";
     hhour2 <= hhour2 + 1;
 
IF (hhour2="0010" and hhour2 ="0100" ) THEN 
     hhour1 <= "0000";
     hhour2 <= "0000";
	  ssec1  <= ssec1 + 1; 
  
IF (stop='1') THEN 
	  Nt_state<=Go;  
     
END IF; END IF;END IF;END IF;END IF; END IF; END IF;
when others =>
   Nt_state<=Go;  
END CASE;
END PROCESS;

----------------------------Decoders----------------------------------
with ssec1 select
	seg_sec1 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;
with ssec2 select
	seg_sec2 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;       
with mmin1 select
	seg_min1 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;
with mmin2 select
	seg_min2 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;

with hhour1 select
	seg_hour1 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;
with hhour2 select
	seg_hour2 <=
		"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"10000110" WHEN OTHERS;
 sec1  <= ssec1;  
 sec2  <= ssec2;
 min1  <= mmin1;
 min2  <= mmin2;
 hour1 <= hhour1;  
 hour2 <= hhour2;

end Watch;