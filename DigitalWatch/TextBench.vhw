--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : TextBench.vhw
-- /___/   /\     Timestamp : Mon May 14 19:59:32 2018
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: TextBench
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY TextBench IS
END TextBench;

ARCHITECTURE testbench_arch OF TextBench IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT Stopwatch
        PORT (
            CLK : In std_logic;
            RST : In std_logic;
            sec1 : Out std_logic_vector (3 DownTo 0);
            sec2 : Out std_logic_vector (3 DownTo 0);
            min1 : Out std_logic_vector (3 DownTo 0);
            min2 : Out std_logic_vector (3 DownTo 0);
            hour1 : Out std_logic_vector (3 DownTo 0);
            hour2 : Out std_logic_vector (3 DownTo 0)
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL RST : std_logic := '0';
    SIGNAL sec1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL sec2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL min2 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour1 : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL hour2 : std_logic_vector (3 DownTo 0) := "0000";

    constant PERIOD : time := 200 ps;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ps;

    BEGIN
        UUT : Stopwatch
        PORT MAP (
            CLK => CLK,
            RST => RST,
            sec1 => sec1,
            sec2 => sec2,
            min1 => min1,
            min2 => min2,
            hour1 => hour1,
            hour2 => hour2
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
                -- -------------  Current Time:  185ps
                WAIT FOR 185 ps;
                RST <= '1';
                -- -------------------------------------
                WAIT FOR 1015 ps;

            END PROCESS;

    END testbench_arch;

