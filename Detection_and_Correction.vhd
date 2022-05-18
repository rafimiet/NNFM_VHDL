
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Detection_and_Correction is
    Generic (N: integer := 512);
    Port ( clk,rst : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Detection_and_Correction;

architecture Behavioral of Detection_and_Correction is
component line_buffer is
    Generic (N: integer := 4);
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component line_buffer;
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
end component Detection_Column;
component Correction_Module  is
    Port ( A11,A12,A13,A14,A15 : in STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23,A24,A25 : in STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33,A34,A35 : in STD_LOGIC_VECTOR (7 downto 0);
           A41,A42,A43,A44,A45 : in STD_LOGIC_VECTOR (7 downto 0);
           A51,A52,A53,A54,A55 : in STD_LOGIC_VECTOR (7 downto 0);
           d11,d12,d13,d14,d15 : in STD_LOGIC;
           d21,d22,d23,d24,d25 : in STD_LOGIC;
           d31,d32,d33,d34,d35 : in STD_LOGIC;
           d41,d42,d43,d44,d45 : in STD_LOGIC;
           d51,d52,d53,d54,d55 : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component Correction_Module;
signal d11,d12,d13,d14,d15 : STD_LOGIC;
signal d21,d22,d23,d24,d25 : STD_LOGIC;
signal d31,d32,d33,d34,d35 : STD_LOGIC;
signal d41,d42,d43,d44,d45 : STD_LOGIC;
signal d51,d52,d53,d54,d55 : STD_LOGIC;
signal A2,A3,A4,A5 : STD_LOGIC_VECTOR (7 downto 0);
signal A11,A12,A13,A14,A15 : STD_LOGIC_VECTOR (7 downto 0);
signal A21,A22,A23,A24,A25 : STD_LOGIC_VECTOR (7 downto 0);
signal A31,A32,A33,A34,A35 : STD_LOGIC_VECTOR (7 downto 0);
signal A41,A42,A43,A44,A45 : STD_LOGIC_VECTOR (7 downto 0);
signal A51,A52,A53,A54,A55 : STD_LOGIC_VECTOR (7 downto 0);

begin
U01: line_buffer GENERIC MAP (N-1) PORT MAP (A,clk,rst,A2);
U02: line_buffer GENERIC MAP (N-1) PORT MAP (A2,clk,rst,A3);
U03: line_buffer GENERIC MAP (N-1) PORT MAP (A3,clk,rst,A4);
U04: line_buffer GENERIC MAP (N-1) PORT MAP (A4,clk,rst,A5);

U1: Detection_Column PORT MAP (A,A2,A3,A4,A5,clk,rst,d11,d12,d13,d14,d15,d21,d22,d23,d24,d25,d31,d32,d33,d34,d35,d41,d42,d43,d44,d45,d51,d52,d53,d54,d55,A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55);
U2: Correction_Module PORT MAP (A11,A12,A13,A14,A15,A21,A22,A23,A24,A25,A31,A32,A33,A34,A35,A41,A42,A43,A44,A45,A51,A52,A53,A54,A55,d11,d12,d13,d14,d15,d21,d22,d23,d24,d25,d31,d32,d33,d34,d35,d41,d42,d43,d44,d45,d51,d52,d53,d54,d55,clk,rst,Y);

end Behavioral;
