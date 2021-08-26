-- Module Name:     Semi Smart Watch - Behavioral 
--creator Name:     Heba mohamed 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Collecting is
    Port( 
	      CLK : in  STD_LOGIC;
         RST : in  STD_LOGIC;
			StopWatch_on : in  STD_LOGIC;
		   StopWatch_off: in  STD_LOGIC;
         Pomodoro_in  : in  STD_LOGIC;
		   Calculator_in: in  STD_LOGIC;
		   Alarm_in     : in  STD_LOGIC;
		   --Digital Watch and Date inputs
		   ssec1   : in std_logic_vector (3 downto 0);
			ssec2   : in std_logic_vector (3 downto 0);
		   mmin1   : in std_logic_vector (3 downto 0);
			mmin2   : in std_logic_vector (3 downto 0);
		   hhour1  : in std_logic_vector (3 downto 0);
			hhour2  : in std_logic_vector (3 downto 0);
		   dday1   : in std_logic_vector (3 downto 0);
			dday2   : in std_logic_vector (3 downto 0);
		   mmonth1 : in std_logic_vector (3 downto 0);
			mmonth2 : in std_logic_vector (3 downto 0);
		   yyear1,yyear2,yyear3,yyear4 : in std_logic_vector (3 downto 0);
			--Digital Watch and Date outputs
			sec1   : out std_logic_vector (3 downto 0);
			sec2   : out std_logic_vector (3 downto 0);
		   min1   : out std_logic_vector (3 downto 0);
			min2   : out std_logic_vector (3 downto 0);
		   hour1  : out std_logic_vector (3 downto 0);
			hour2  : out std_logic_vector (3 downto 0);
		   day1   : out std_logic_vector (3 downto 0);
			day2   : out std_logic_vector (3 downto 0);
		   month1 : out std_logic_vector (3 downto 0);
			month2 : out std_logic_vector (3 downto 0);
		   year1,year2,year3,year4 : out std_logic_vector (3 downto 0);
			--StopWatch outputs
			sec1_s  : out std_logic_vector (3 downto 0);
			sec2_s  : out std_logic_vector (3 downto 0);
		   min1_m  : out std_logic_vector (3 downto 0);
			min2_m  : out std_logic_vector (3 downto 0);
		   hour1_h : out std_logic_vector (3 downto 0);
			hour2_h : out std_logic_vector (3 downto 0);
			--pomodoro outputs
         seconds_study1 : out std_logic_vector(3 downto 0);
	      seconds_study2 : out std_logic_vector(3 downto 0);
	      minutes_study1 : out std_logic_vector(3 downto 0);--25 minutes
	      minutes_study2 : out std_logic_vector(3 downto 0);
	      seconds_break1 : out std_logic_vector(3 downto 0);
	      seconds_break2 : out std_logic_vector(3 downto 0);
	      minutes_break1 : out std_logic_vector(3 downto 0);--5 minutes		
			--calculator inputs and output
			A0 : in  STD_LOGIC;
         B0 : in  STD_LOGIC;
			op : in  STD_LOGIC_VECTOR (3 downto 0);
			calc_output : out  STD_LOGIC_VECTOR (15 downto 0);
			--Alarm inputs and output 
         min1_A ,min2_A   : in std_logic_vector (3 downto 0);
	      hour1_A,hour2_A  : in std_logic_vector (3 downto 0);			 
		   Buzz :out STD_LOGIC
		  );
end Collecting;

architecture Behavioral of Collecting is
--Digital Watch and Date
component dig_watch 
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
end component ;
--Stopwatch component
component stopwatch  
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
end component;
--Pomodoro component
component Pomodoro
Port (       
      CLK  : in STD_LOGIC;
	   RST  : in STD_LOGIC;--Active LOw
	   GO   : in  STD_LOGIC;
		Buzz : out STD_LOGIC;
      seconds_study1 : out std_logic_vector(3 downto 0);
	   seconds_study2 : out std_logic_vector(3 downto 0);
	   minutes_study1 : out std_logic_vector(3 downto 0);--25 minutes
	   minutes_study2 : out std_logic_vector(3 downto 0);
	   seconds_break1 : out std_logic_vector(3 downto 0);
	   seconds_break2 : out std_logic_vector(3 downto 0);
	   minutes_break1 : out std_logic_vector(3 downto 0) --5 minutes
		 );
end component;
--Alarm component
component Alarm   
 port(
        CLK  : in STD_LOGIC;
	     RST  : in STD_LOGIC;--Active LOw
		  min1_A ,min2_A   : in std_logic_vector (3 downto 0);
	     hour1_A,hour2_A  : in std_logic_vector (3 downto 0); 
		  alarm_armed	: in	std_logic;
	 	  buzzz		   : out	std_logic
	  );
end component;
--Calculator component
component calc 
   Port ( 
          RST : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0)
		  );
end component;

signal CLKW,CLKS,CLKP,CLKA:STD_LOGIC;
signal RSTW,RSTS,RSTP,RSTA,RSTC:STD_LOGIC;

BEGIN
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
 Buzz<='0';	   
         W: dig_watch port map (CLKW,RSTW,sec1,sec2,min1,min2,hour1,hour2,day1,day2,
                                 month1,month2,year1,year2,year3,year4 );
											
         S: stopwatch port map (CLKW,RSTS,StopWatch_on,StopWatch_off,sec1_s,sec2_s,min1_m,min2_m,hour1_h,hour2_h);
			
		   P: Pomodoro  port map  (CLKP,RSTP,Pomodoro_in,Buzz,seconds_study1,seconds_study2,
			                        minutes_study1,minutes_study2,seconds_break1,seconds_break2,minutes_break1);
											
         A: Alarm     port map (CLKA,RSTA,min1_A ,min2_A ,hour1_A,hour2_A,Alarm_in,Buzz);
			
			--C: calc      port map (RSTC,A0,B0,op,output);

PROCESS (RST,CLK)
BEGIN
	IF  RST='0' then --Active Low
			Buzz <='1';
			RSTS <='0';
			RSTP <='0';
			RSTA <='0';
			RSTC <='0';

   ELSIF(CLK'event and CLK='1')then
         CLKW<=CLK;
			CLKS<=CLK;
			CLKP<=CLK;
			CLKA<=CLK;   
   
    END IF;
END PROCESS;
											
end Behavioral;
