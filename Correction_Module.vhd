
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Correction_Module  is
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
end Correction_Module;

architecture Behavioral of Correction_Module is
COMPONENT Previous_Value is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           d1,d2,d3,d4,d5 : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
COMPONENT row_elig is
    Port ( d1,d2,d3,d4,d5 : in STD_LOGIC;
           y : out STD_LOGIC);
end COMPONENT;
COMPONENT Choose_Nearest is
    Port ( d1, d2, d3, d4, d5, clk : in STD_LOGIC; -- d = 0 means noisefree
           A1, A2, A3, A4, A5 : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
COMPONENT MUX is
    Port ( A,NN : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT MUX;

signal s1,s2,s3,s4,d1,d2,d3,d4,d5 : STD_LOGIC := '0';
signal A1,A2,A3,A4,A5,Y1,Y2 : STD_LOGIC_VECTOR (7 DOWNTO 0) := ("00000000"); 
begin
--U1: Choose_Nearest PORT MAP (d11,d12,d13,d14,d15,clk,A11,A12,A13,A14,A15,A1);
--U2: Choose_Nearest PORT MAP (d21,d22,d23,d24,d25,clk,A21,A22,A23,A24,A25,A2);
--U3: Choose_Nearest PORT MAP (d31,d32,d33,d34,d35,clk,A31,A32,A33,A34,A35,A3);
--U4: Choose_Nearest PORT MAP (d41,d42,d43,d44,d45,clk,A41,A42,A43,A44,A45,A4);
--U5: Choose_Nearest PORT MAP (d51,d52,d53,d54,d55,clk,A51,A52,A53,A54,A55,A5);

--U6: row_elig PORT MAP (d11,d12,d13,d14,d15,d1);
--U7: row_elig PORT MAP (d21,d22,d23,d24,d25,d2);
--U8: row_elig PORT MAP (d31,d32,d33,d34,d35,d3);
--U9: row_elig PORT MAP (d41,d42,d43,d44,d45,d4);
--U10: row_elig PORT MAP (d51,d52,d53,d54,d55,d5);

--U11: Choose_Nearest PORT MAP (d1,d2,d3,d4,d5,clk,A1,A2,A3,A4,A5,Y1);

--U12: Previous_Value PORT MAP (Y1,d1,d2,d3,d4,d5,clk,rst,Y2);
--U13: MUX PORT MAP (Y2,A33,d33,Y);
process (clk)
begin
    if clk'event and clk = '1' then
        if d33 = '0' then
            Y <= A33;
        elsif d32 = '0' then
            Y <= A32;
        elsif d34 = '0' then
            Y <= A34;
        elsif d23 = '0' then
            Y <= A23;
        elsif d43 = '0' then
            Y <= A43;
        elsif d22 = '0' then
            Y <= A22;
        elsif d24 = '0' then
            Y <= A24;
        elsif d42 = '0' then
            Y <= A42;
        elsif d44 = '0' then
            Y <= A44;
        elsif d31 = '0' then
            Y <= A31;
        elsif d35 = '0' then
            Y <= A35;
        elsif d13 = '0' then
            Y <= A13;
        elsif d53 = '0' then
            Y <= A53;
        elsif d21 = '0' then
            Y <= A21;
        elsif d12 = '0' then
            Y <= A12;
        elsif d14 = '0' then
            Y <= A14;
        elsif d25 = '0' then
            Y <= A25;
        elsif d41 = '0' then
            Y <= A41;
        elsif d45 = '0' then
            Y <= A45;
        elsif d52 = '0' then
            Y <= A52;
        elsif d54 = '0' then
            Y <= A54;
        elsif d11 = '0' then
            Y <= A11;
        elsif d15 = '0' then
            Y <= A15;
        elsif d51 = '0' then
            Y <= A51;
        elsif d55 = '0' then
            Y <= A55;
        end if;
    end if;
end process;
end Behavioral;
