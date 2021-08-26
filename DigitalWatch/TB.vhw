--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : TB.vhw
-- /___/   /\     Timestamp : Tue May 15 23:31:43 2018
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: TB
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY TB IS
END TB;

ARCHITECTURE testbench_arch OF TB IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT Collecting
        PORT (
            CLK : In std_logic;
            RST : In std_logic;
            StopWatch_on : In std_logic;
            StopWatch_off : In std_logic;
            Pomodoro_in : In std_logic;
            Calculator_in : In std_logic;
            Alarm_in : In std_logic;
            ssec1 : In std_logic_vector (3 DownTo 0);
            ssec2 : In std_logic_vector (3 DownTo 0);
            mmin1 : In std_logic_vector (3 DownTo 0);
            mmin2 : In std_logic_vector (3 DownTo 0);
            hhour1 : In std_logic_vector (3 DownTo 0);
            hhour2 : In std_logic_vector (3 DownTo 0);
            dday1 : In std_logic_vector (3 DownTo 0);
            dday2 : In std_logic_vector (3 DownTo 0);
            mmonth1 : In std_logic_vector (3 DownTo 0);
            mmonth2 : In std_logic_vector (3 DownTo 0);
            yyear1 : In std_logic_vector (3 DownTo 0);
            yyear2 : In std_logic_vector (3 DownTo 0);
            yyear3 : In std_logic_vector (3 DownTo 0);
            yyear4 : In std_logic_vector (3 DownTo 0);
            sec1 : Out std_logic_vector (3 DownTo 0);
            sec2 : Out std_logic_vector (3 DownTo 0);
            min1 : Out std_logic_vector (3 DownTo 0);
            min2 : Out std_logic_vector (3 DownTo 0);
            hour1 : Out std_logic_vector (3 DownTo 0);
            hour2 : Out std_logic_vector (3 DownTo 0);
            day1 : Out std_logic_vector (3 DownTo 0);
            day2 : Out std_logic_vector (3 DownTo 0);
            month1 : Out std_logic_vector (3 DownTo 0);
            month2 : Out std_logic_vector (3 DownTo 0);
            year1 : Out std_logic_vector (3 DownTo 0);
            year2 : Out std_logic_vector (3 DownTo 0);
            year3 : Out std_logic_vector (3 DownTo 0);
            year4 : Out std_logic_vector (3 DownTo 0);
            sec1_s : Out std_logic_vector (3 DownTo 0);
            sec2_s : Out std_logic_vector (3 DownTo 0);
            min1_m : Out std_logic_vector (3 DownTo 0);
            min2_m : Out std_logic_vector (3 DownTo 0);
            hour1_h : Out std_logic_vector (3 DownTo 0);
            hour2_h : Out std_logic_vector (3 DownTo 0);
            seconds_study1 : Out std_logic_vector (3 DownTo 0);
            seconds_study2 : Out std_logic_vector (3 DownTo 0);
            minutes_study1 : Out std_logic_vector (3 DownTo 0);
            minutes_study2 : Out std_logic_vector (3 DownTo 0);
            seconds_break1 : Out std_logic_vector (3 DownTo 0);
            seconds_break2 : Out std_logic_vector (3 DownTo 0);
            minutes_break1 : Out std_logic_vector (3 DownTo 0);
            min1_A : In std_logic_vector (3 DownTo 0);
            min2_A : In std_logic_vector (3 DownTo 0);
            hour1_A : In std_logic_vector (3 DownTo 0);
            hour2_A : In std_logic_vector (3 DownTo 0);
            Buzz : Out std_logic
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL RST : std_logic := '0';
    SIGNAL StopWatch_on : std_logic := '0';
    SIGNAL StopWatch_off : std_logic := '0';
    SIGNAL Pomodoro_in : std_logic := '0';
    SIGNAL Calculator_in : std_logic := '0';
    SIGNAL Alarm_in : std_logic := '0';
    SIGNAL ssec1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL ssec2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL mmin1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL mmin2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hhour1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hhour2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL dday1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL dday2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL mmonth1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL mmonth2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL yyear1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL yyear2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL yyear3 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL yyear4 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sec1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sec2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL day1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL day2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL month1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL month2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL year1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL year2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL year3 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL year4 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sec1_s : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sec2_s : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min1_m : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min2_m : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour1_h : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour2_h : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL seconds_study1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL seconds_study2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL minutes_study1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL minutes_study2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL seconds_break1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL seconds_break2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL minutes_break1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min1_A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min2_A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour1_A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour2_A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL Buzz : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : Collecting
        PORT MAP (
            CLK => CLK,
            RST => RST,
            StopWatch_on => StopWatch_on,
            StopWatch_off => StopWatch_off,
            Pomodoro_in => Pomodoro_in,
            Calculator_in => Calculator_in,
            Alarm_in => Alarm_in,
            ssec1 => ssec1,
            ssec2 => ssec2,
            mmin1 => mmin1,
            mmin2 => mmin2,
            hhour1 => hhour1,
            hhour2 => hhour2,
            dday1 => dday1,
            dday2 => dday2,
            mmonth1 => mmonth1,
            mmonth2 => mmonth2,
            yyear1 => yyear1,
            yyear2 => yyear2,
            yyear3 => yyear3,
            yyear4 => yyear4,
            sec1 => sec1,
            sec2 => sec2,
            min1 => min1,
            min2 => min2,
            hour1 => hour1,
            hour2 => hour2,
            day1 => day1,
            day2 => day2,
            month1 => month1,
            month2 => month2,
            year1 => year1,
            year2 => year2,
            year3 => year3,
            year4 => year4,
            sec1_s => sec1_s,
            sec2_s => sec2_s,
            min1_m => min1_m,
            min2_m => min2_m,
            hour1_h => hour1_h,
            hour2_h => hour2_h,
            seconds_study1 => seconds_study1,
            seconds_study2 => seconds_study2,
            minutes_study1 => minutes_study1,
            minutes_study2 => minutes_study2,
            seconds_break1 => seconds_break1,
            seconds_break2 => seconds_break2,
            minutes_break1 => minutes_break1,
            min1_A => min1_A,
            min2_A => min2_A,
            hour1_A => hour1_A,
            hour2_A => hour2_A,
            Buzz => Buzz
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                RST <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                RST <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                RST <= '1';
                -- -------------------------------------
                WAIT FOR 615 ns;

            END PROCESS;

    END testbench_arch;

