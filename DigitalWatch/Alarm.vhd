-- Module Name:    Alarm - Behavioral
--creator Name:    Mona Elsayed & Nada Elsayed
 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Alarm is 
port(
        CLK  : in STD_LOGIC;
	     RST  : in STD_LOGIC;--Active LOw
		  min1_A ,min2_A   : in std_logic_vector (3 downto 0);
	     hour1_A,hour2_A  : in std_logic_vector (3 downto 0); 
		  alarm_armed	: in	std_logic;
	 	  buzzz		   : out	std_logic
	  );

end Alarm;

architecture behavioral of Alarm is
--Comparator Component
component comparator
port (
       min1_W,min1_A  : in std_logic_vector ( 3 downto 0);  
		 min2_W,min2_A  : in std_logic_vector ( 3 downto 0); 
       hour1_W,hour1_A: in std_logic_vector ( 3 downto 0); 
       hour2_W,hour2_A: in std_logic_vector ( 3 downto 0); 		 
       equal: out std_logic );
end component;
--Digital Watch Component
component DigitalWatch
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
end component;			  
	
signal equal :STD_LOGIC ;

signal sec1_W , sec2_W  : std_logic_vector (3 downto 0);
signal min1_W , min2_W  : std_logic_vector (3 downto 0);
signal hour1_W, hour2_W : std_logic_vector (3 downto 0);
signal day1_W , day2_W  : std_logic_vector (3 downto 0);
signal month1_W,month2_W: std_logic_vector (3 downto 0);
signal year1_W ,year2_W : std_logic_vector (3 downto 0);
signal year3_W ,year4_W : std_logic_vector (3 downto 0);
	
type statetype is (off, armed, wakeup);
signal present_state, next_state : statetype := off;

begin
-----------------------------------------
buzzz<='0';

W:DigitalWatch  port map (CLK,'1',sec1_W,sec2_W,min1_W,min2_W,hour1_W,hour2_W, day1_W ,
                          day2_W, month1_W,month2_W,year1_W ,year2_W ,year3_W ,year4_W);
C:comparator    port map (min1_W , min1_A , min2_W , min2_A , hour1_W , hour1_A , hour2_W , hour2_A , equal);

process(CLK,RST)
begin
if(RST='0')then
present_state<=off;
buzzz<='0';
elsif(CLK'event and CLK='1')then
present_state<=next_state;
end if;
end process;
------------------------------------------
process( present_state, alarm_armed, equal )
begin
  		buzzz <= '0';
case present_state is
when off =>
  		buzzz <= '0';
	if alarm_armed = '1' then
		next_state <= armed;
	elsif alarm_armed = '0' then 
	   next_state <= off;
	end if;
	
when armed =>
   buzzz <= '0';
	if equal = '0' then
		next_state <= armed;
	elsif equal = '1' then
		next_state <= wakeup;
	end if;
	
when wakeup =>
	buzzz <= '1'; 
   next_state <= off;
	
when others =>
	buzzz <= '0';
end case;

end process ;
end behavioral;