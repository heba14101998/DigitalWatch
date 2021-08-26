-- Module Name:    Digital Watch & Date - Behavioral 
--creator Name:    Mona Khaled & Heba mohamed 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity DigitalWatch is
    Port ( 
	      CLK    : in  STD_LOGIC;
         RST    : in  STD_LOGIC;--Active Low
         sec1   : out std_logic_vector (3 downto 0);--0 to 9
			sec2   : out std_logic_vector (3 downto 0);--0 to 5
		   min1   : out std_logic_vector (3 downto 0);--0 to 9
			min2   : out std_logic_vector (3 downto 0);--0 to 5
		   hour1  : out std_logic_vector (3 downto 0);--0 to 9
			hour2  : out std_logic_vector (3 downto 0);--0 to 2
		   day1   : out std_logic_vector (3 downto 0);--0 to 9
			day2   : out std_logic_vector (3 downto 0);--0 to 3
		   month1 : out std_logic_vector (3 downto 0);--0 to 9
			month2 : out std_logic_vector (3 downto 0);--0 to 2
		   year1,year2,year3,year4 : out std_logic_vector (3 downto 0)--0 to 9
           );
end DigitalWatch;

architecture Watch of DigitalWatch is

signal ssec1  ,ssec2 : std_logic_vector (3 downto 0):="0000";
signal mmin1  ,mmin2 : std_logic_vector (3 downto 0):="0000";
signal hhour1 ,hhour2: std_logic_vector (3 downto 0):="0000";
signal dday1  ,dday2 : std_logic_vector (3 downto 0):="0000";
signal mmonth1,mmonth2:std_logic_vector (3 downto 0):="0000";
signal yyear1,yyear2,yyear3,yyear4: std_logic_vector (3 downto 0):="0000";

signal seg_sec1 ,seg_sec2   : std_logic_vector(7 downto 0);
signal seg_min1 ,seg_min2   : std_logic_vector(7 downto 0);
signal seg_hour1,seg_hour2  : std_logic_vector(7 downto 0);
signal seg_day1 ,seg_day2   : std_logic_vector(7 downto 0);
signal seg_month1,seg_month2: std_logic_vector(7 downto 0);
signal seg_year1,seg_year2,seg_year3,seg_year4 : std_logic_vector(7 downto 0);

 ------------------------counters----------------------
BEGIN

PROCESS(RST ,CLK)
BEGIN
 
 IF (RST='0') THEN --Active Low 
 ssec1  <= "0000";  
 ssec2  <= "0000";
 mmin1  <= "0000";
 mmin2  <= "0000";
 hhour1 <= "0000";  
 hhour2 <= "0000";
 dday1  <= "0000";
 dday2  <= "0000";
 mmonth1<= "0000";
 mmonth2<= "0000";
 yyear1 <= "0000";
 yyear2 <= "0000";
 yyear3 <= "0000";
 yyear4 <= "0000";

ELSIF (CLK'event and CLK='1') THEN  
        Ssec1 <= Ssec1 +1; 
		  
IF (ssec1="1001") THEN                   
     ssec1 <= "0000";
     ssec2 <= ssec2 + 1;
 
IF (ssec2="0101" and ssec2="1001") THEN
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
 
IF (hhour1="1001") THEN
     hhour1 <="0000";
     hhour2 <= hhour2 + 1;
 
IF (hhour2="0010" and hhour2 ="0100" ) THEN 
     hhour1   <= "0000";
     hhour2   <= "0000";
     dday1    <= dday1+ 1;
	 
IF (dday1="1001") THEN
	 dday1<="0000";
	 dday2<=dday2+ 1;
	 
--Months have 28 days
IF (dday1="1000" and dday2="0010" and mmonth1="0010" and mmonth2="0000" ) THEN --February
     dday1  <="0001";
	  dday2  <="0000";
     mmonth1<="0000";   
	  mmonth2<="0000";
	  
--Months have 30 days
IF   (dday1  ="0000" and dday2  ="0011") and(    --30 days         
     (mmonth1="0100" and mmonth2="0000")  or  --April
	  (mmonth1="0101" and mmonth2="0000")  or  --June
	  (mmonth1="1001" and mmonth2="0000")  or  --September
	  (mmonth1="0001" and mmonth2="0001") )    --November
	THEN
     dday1 <="0001";
	  dday2 <="0000";
	    if   (mmonth1<"1001" and mmonth2="0000" ) then
             mmonth1<=mmonth1+ 1;		
	    elsif(mmonth1="1001" and mmonth2="0000" ) then 
	          mmonth1<="0000"; --October
		       mmonth2<="0001";		
		 elsif(mmonth1="0001" and mmonth2 ="0001") then 
		       mmonth1<="0010";--December
		       mmonth2<="0001";
		 end if ;
		 
--Months with 31 days
IF  (dday1 = "0001" and dday2="0011") and (
    (mmonth1="0001" and mmonth2="0000")  or --January 
    (mmonth1="0011" and mmonth2="0000")  or --March
    (mmonth1="0101" and mmonth2="0000")  or --May
	 (mmonth1="0111" and mmonth2="0000")  or --July
	 (mmonth1="1000" and mmonth2="0000")  or --August
	 (mmonth1="0000" and mmonth2="0001")  or --October
	 (mmonth1="0010" and mmonth2="0001") )   --December
    THEN 
     dday1 <="0001";
	  dday2 <="0000";
       if (mmonth1<"1001" and mmonth2="0000") then
           mmonth1<=mmonth1+1;		
	    elsif(mmonth1= "0000" and mmonth2 ="0001") then 
	        mmonth1<="0001";--November
		     mmonth2<="0001";
		 end if ;
		
--years
IF (mmonth1="0010" and mmonth2="0001") then 
     mmonth1<="0001";--January
	  mmonth2<="0000";
	  yyear1<=yyear1+1;
		
IF(yyear1="1001" )THEN
    yyear1<="0000";
	 yyear2<=yyear2+1;
	
IF(yyear2= "1001" and yyear1= "1001") THEN
    yyear1<="0000";
    yyear2<="0000";
    yyear3<=yyear3+1;
	
IF (yyear3="1001" and yyear2= "1001" and yyear1="1001") THEN
    yyear1<="0000";
    yyear2<="0000";
    yyear3<="0000";
	 yyear4<=yyear4+1;
	
		END IF; END IF; END IF; END IF; END IF; END IF; END IF;END IF; 
		END IF; END IF;END IF;END IF;END IF; END IF; END IF;

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
with Ssec2 select
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
with dday1 select
	seg_day1 <=
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
with dday2 select
	seg_day2 <=
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
with mmonth1 select
	seg_month1 <=
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
with mmonth2 select
	seg_month2 <=
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
with yyear1 select
	seg_year1 <=
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
with yyear2 select
	seg_year2 <=
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
with yyear3 select
	seg_year3 <=
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
with yyear4 select
	seg_year4 <=
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
 day1  <= dday1;
 day2  <= dday2;
 month1<= mmonth1;
 month2<= mmonth2;
 year1 <= yyear1;
 year2 <= yyear2;
 year3 <= yyear3;
 year4 <= yyear4;
end Watch;