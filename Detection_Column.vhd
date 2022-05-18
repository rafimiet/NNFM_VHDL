----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Detection_Column is
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
end Detection_Column;

architecture Behavioral of Detection_Column is
component Detection1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end component Detection1;
component SIPO_bit is
    Port ( a : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           y1,y2,y3,y4,y5 : out STD_LOGIC);
end component SIPO_bit;
component buff2filt is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           A11,A12,A13,A14,A15 : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal y1,y2,y3,y4,y5 : STD_LOGIC;
begin
U1: buff2filt PORT MAP (A1,clk,rst,A11,A12,A13,A14,A15);
U2: buff2filt PORT MAP (A2,clk,rst,A21,A22,A23,A24,A25);
U3: buff2filt PORT MAP (A3,clk,rst,A31,A32,A33,A34,A35);
U4: buff2filt PORT MAP (A4,clk,rst,A41,A42,A43,A44,A45);
U5: buff2filt PORT MAP (A5,clk,rst,A51,A52,A53,A54,A55);

U6: Detection1 PORT MAP (A1,y1);
U7: Detection1 PORT MAP (A2,y2);
U8: Detection1 PORT MAP (A3,y3);
U9: Detection1 PORT MAP (A4,y4);
U10: Detection1 PORT MAP (A5,y5);

U11: SIPO_bit PORT MAP (y1,clk,rst,d11,d12,d13,d14,d15);
U12: SIPO_bit PORT MAP (y2,clk,rst,d21,d22,d23,d24,d25);
U13: SIPO_bit PORT MAP (y3,clk,rst,d31,d32,d33,d34,d35);
U14: SIPO_bit PORT MAP (y4,clk,rst,d41,d42,d43,d44,d45);
U15: SIPO_bit PORT MAP (y5,clk,rst,d51,d52,d53,d54,d55);
end Behavioral;
