-- Module Name:    Pomodoro - Behavioral 
--creator Name : Wfaa Samy

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity Pomodoro is
Port (
      CLK  : in  STD_LOGIC;
	   RST  : in  STD_LOGIC;--Active LOw
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
end Pomodoro;
architecture watch of Pomodoro is

signal sec_study1 ,sec_break1 : std_logic_vector(3 downto 0):="0000";
signal sec_study2 ,sec_break2 : std_logic_vector(3 downto 0):="0000";
signal min_study1  : std_logic_vector(3 downto 0):="0000";
signal min_study2  : std_logic_vector(3 downto 0):="0000";
signal min_break1  : std_logic_vector(3 downto 0):="0000";

signal seg_sec_stdy1, seg_sec_stdy2  : std_logic_vector(7 downto 0);
signal seg_min_stdy1, seg_min_stdy2  : std_logic_vector(7 downto 0);
signal seg_sec_brk1 , seg_sec_brk2   : std_logic_vector(7 downto 0);
signal seg_min_brk1                  : std_logic_vector(7 downto 0);

type state is (start,study,break);
signal Pr_state,Nt_state:state;
-------------------------------------------------------------------
BEGIN
process(CLK,RST) 

begin
if RST='0' then 
   sec_study1 <="0000";
   sec_study2 <="0000";
   min_study1 <="0000";
   min_study2 <="0000";
   sec_break1 <="0000";
   sec_break2 <="0000";
   min_break1 <="0000";
   Pr_state   <= start; 
elsif(CLK'event and CLK='1') then
     Pr_state <= Nt_state;
     end if ;
end process;
--------------------------------------------------------------------
process (Pr_state ,GO)
begin
case Pr_state is 

  when start => 
	    IF GO='1' then
		   Nt_state <= study;
       ELSE
         Nt_state <= start; 
        END IF ;
	
  when study => 
  
		     sec_study1 <= sec_study1+ 1;
         if(sec_study1 = "0000") then
            sec_study1 <="0000";
	         sec_study2 <=sec_study2+1;
         if(sec_study2 = "0101" and sec_study1="1001") then
            sec_study1<="0000";
	         sec_study2<="0000";
            min_study1 <= min_study1 + 1;
         if(min_study1="1001" )then
			   sec_study1<="0000";
	         sec_study2<="0000";
            min_study1<="0000";
				min_study2<=min_study2+1;
			if(min_study1="0101" and sec_study2="0010" )then
			   sec_study1<="0000";
	         sec_study2<="0000";
            min_study1<="0000";
				min_study2<="0000";
		      Nt_state <= break;
				Buzz<='1';
         end if ;end if ; end if ;end if ;
	
  when break => 

		     sec_break1 <= sec_break1+ 1;
         if(sec_break1 = "0000") then
            sec_break1 <="0000";
	         sec_break2 <=sec_break2+1;
         if(sec_break2 = "0101" and sec_break1="1001") then
            sec_break1<="0000";
	         sec_break2<="0000";
            min_break1 <= min_break1 +1;
         if min_break1="0101" then
			   sec_break1<="0000";
	         sec_break2<="0000";
            min_break1<="0000";
		      Nt_state <= start;
				Buzz<='1';
         end if ;end if ; end if ;
			
	when others=>
	      Nt_state<=Nt_state;
			Buzz<='0';
			
END CASE ;     
END PROCESS;
----------------------Decoders----------------------------
with sec_study1 select
	seg_sec_stdy1 <=
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
with sec_study2 select
	seg_sec_stdy2 <=
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
with min_study1 select
	seg_min_stdy1 <=
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
with min_study2 select
	seg_min_stdy2 <=
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
with sec_break1 select
	seg_sec_brk1 <=
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
with sec_break2 select
	seg_sec_brk2 <=
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
with min_break1 select
	seg_min_brk1 <=
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
		
      seconds_study1 <=sec_study1;
	   seconds_study2 <=sec_study2;
	   minutes_study1 <=min_study1;
	   minutes_study2 <=min_study2;
	   seconds_break1 <=sec_break1;
	   seconds_break2 <=sec_break2;
	   minutes_break1 <=min_break1;
end  watch;