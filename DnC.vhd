----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.08.2021 16:09:59
-- Design Name: 
-- Module Name: DnC - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DnC is
--  Port ( );
end DnC;

architecture Behavioral of DnC is
COMPONENT Detection_and_Correction is
    Generic (N: integer := 260);
    Port ( clk,rst : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT Detection_and_Correction;

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
 	FILE f : TEXT OPEN READ_MODE IS "imtest_512_90.txt";
	FILE g : TEXT OPEN WRITE_MODE IS "text_out.txt";
	--FILE h : TEXT OPEN WRITE_MODE IS "pipelining2.txt";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Detection_and_Correction GENERIC MAP (512) PORT MAP (
          clk => clk,
          rst => rst,
          A => A,
          Y => Y
        );

    -- Clock process definitions
 clk <= NOT clk AFTER 10 ns;
 
PROCESS(clk)
		VARIABLE l,m,n: LINE;
		VARIABLE good_value : BOOLEAN;
		VARIABLE pixl1: INTEGER RANGE 0 TO 255;
		VARIABLE pixl2, pixl3 : INTEGER RANGE 0 TO 1024;
        VARIABLE count : integer := 0;
		BEGIN
		IF NOT ENDFILE(f) THEN
				IF (clk'EVENT AND clk = '1') THEN
					READLINE(f,l);
					READ(l,pixl1,good_value);
					A <= conv_std_logic_vector(pixl1,8);
			   END IF;
		END IF;
		IF (clk'EVENT AND clk = '1') THEN
		    count := count + 1;
			if (count > 1030 AND count < 263175) then
			     pixl2 := conv_integer(Y);
				 WRITE(l,pixl2);
                 WRITELINE(g,l);
             end if;
        END IF;
	END PROCESS;
end Behavioral;
