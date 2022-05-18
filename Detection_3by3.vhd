----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2021 12:20:01
-- Design Name: 
-- Module Name: Detection_3by3 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Detection_3by3 is
    Port ( A1,A2,A3 : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           d11,d12,d13 : out STD_LOGIC;
           d21,d22,d23 : out STD_LOGIC;
           d31,d32,d33 : out STD_LOGIC;
           A11,A12,A13 : out STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23 : out STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33 : out STD_LOGIC_VECTOR (7 downto 0));
end Detection_3by3;

architecture Behavioral of Detection_3by3 is
component Detection1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end component Detection1;
component SIPO_bit is
    Port ( a : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           y1,y2,y3,y4,y5 : out STD_LOGIC);
end component SIPO_bit;
component buf2filt3 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           A11,A12,A13 : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal y1,y2,y3,y4,y5,d14,d15,d24,d25,d34,d35 : STD_LOGIC;

begin
U1: buf2filt3 PORT MAP (A1,clk,rst,A11,A12,A13);
U2: buf2filt3 PORT MAP (A2,clk,rst,A21,A22,A23);
U3: buf2filt3 PORT MAP (A3,clk,rst,A31,A32,A33);

U6: Detection1 PORT MAP (A1,y1);
U7: Detection1 PORT MAP (A2,y2);
U8: Detection1 PORT MAP (A3,y3);

U11: SIPO_bit PORT MAP (y1,clk,rst,d11,d12,d13,d14,d15);
U12: SIPO_bit PORT MAP (y2,clk,rst,d21,d22,d23,d24,d25);
U13: SIPO_bit PORT MAP (y3,clk,rst,d31,d32,d33,d34,d35);

end Behavioral;
