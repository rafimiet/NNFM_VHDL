----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.08.2021 17:40:02
-- Design Name: 
-- Module Name: Detection_tbw - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE std.textio.all;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Detection_tbw is
--  Port ( );
end Detection_tbw;

architecture Behavioral of Detection_tbw is
component Detection_Column is
    Port ( A1,A2,A3,A4,A5 : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           d11,d12,d13,d14,d15 : out STD_LOGIC;
           d21,d22,d23,d24,d25 : out STD_LOGIC;
           d31,d32,d33,d34,d35 : out STD_LOGIC;
           d41,d42,d43,d44,d45 : out STD_LOGIC;
           d51,d52,d53,d54,d55 : out STD_LOGIC;
           A11,A12,A13,A14,A15 : out STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23,A24,A25 : out STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33,A34,A35 : out STD_LOGIC_VECTOR (7 downto 0);
           A41,A42,A43,A44,A45 : out STD_LOGIC_VECTOR (7 downto 0);
           A51,A52,A53,A54,A55 : out STD_LOGIC_VECTOR (7 downto 0));
end component;
SIGNAL A1,A2,A3,A4,A5 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL clk,rst : STD_LOGIC := '0';
SIGNAL d11,d12,d13,d14,d15 : STD_LOGIC;
SIGNAL d21,d22,d23,d24,d25 : STD_LOGIC;
SIGNAL d31,d32,d33,d34,d35 : STD_LOGIC;
SIGNAL d41,d42,d43,d44,d45 : STD_LOGIC;
SIGNAL d51,d52,d53,d54,d55 : STD_LOGIC;
SIGNAL A11,A12,A13,A14,A15 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL A21,A22,A23,A24,A25 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL A31,A32,A33,A34,A35 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL A41,A42,A43,A44,A45 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL A51,A52,A53,A54,A55 : STD_LOGIC_VECTOR (7 downto 0);
FILE f : TEXT OPEN READ_MODE IS "imtest.txt";

begin
uut: Detection_Column PORT MAP (A1,A2,A3,A4,A5,clk,rst,d11,d12,d13,d14,d15,d21,d22,d23,d24,d25,d31,d32,d33,d34,d35,d41,d42,d43,d44,d45,d51,d52,d53,d54,d55,A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55);
 clk <= NOT clk AFTER 10 ns;
PROCESS(clk)
		VARIABLE l,m,n: LINE;
		VARIABLE good_value : BOOLEAN;
		VARIABLE p1,p2,p3,p4,p5: INTEGER RANGE 0 TO 255;
		VARIABLE pixl2, pixl3 : INTEGER RANGE 0 TO 1024;
		variable v_SPACE     : character;

		BEGIN
		IF NOT ENDFILE(f) THEN
				IF (clk'EVENT AND clk = '1') THEN
					READLINE(f,l);
					READ(l,p1,good_value);
					READ(l,v_SPACE);
					READ(l,p2,good_value);
					READ(l,v_SPACE);
					READ(l,p3,good_value);
					READ(l,v_SPACE);
					READ(l,p4,good_value);
					READ(l,v_SPACE);
					READ(l,p5,good_value);
					A1 <= conv_std_logic_vector(p1,8);
					A2 <= conv_std_logic_vector(p2,8);
					A3 <= conv_std_logic_vector(p3,8);
					A4 <= conv_std_logic_vector(p4,8);
					A5 <= conv_std_logic_vector(p5,8);
			   END IF;
--				IF (clk'EVENT AND clk = '1') THEN
--					pixl2 := conv_integer(out_1);
--					WRITE(l,pixl2);
--					WRITELINE(g,l);
--					pixl3 := conv_integer(out_2);
--					WRITE(l,pixl3);
--					WRITELINE(h,l);
--				END IF;
		END IF;
	END PROCESS;
end Behavioral;
