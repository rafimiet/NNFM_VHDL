
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Correction_3 is
    Port ( A11,A12,A13 : in STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23 : in STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33 : in STD_LOGIC_VECTOR (7 downto 0);
           d11,d12,d13 : in STD_LOGIC;
           d21,d22,d23 : in STD_LOGIC;
           d31,d32,d33 : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Correction_3;

architecture Behavioral of Correction_3 is
COMPONENT Previous_3 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           d1,d2,d3 : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
COMPONENT row_elig_3 is
    Port ( d1,d2,d3 : in STD_LOGIC;
           y : out STD_LOGIC);
end COMPONENT;
COMPONENT Nearest_3 is
    Port ( d1, d2, d3, clk : in STD_LOGIC; -- d = 0 means noisefree
           A1, A2, A3 : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;
COMPONENT MUX is
    Port ( A,NN : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT MUX;
COMPONENT DFF is
    Generic (N: integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk, rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT;

begin

process (clk)
begin
    if clk'event and clk = '1' then
        if d22 = '0' then
            Y <= A22;
        elsif d21 = '0' then
            Y <= A21;
        elsif d23 = '0' then
            Y <= A23;
        elsif d12 = '0' then
            Y <= A12;
        elsif d32 = '0' then
            Y <= A32;
        elsif d11 = '0' then
            Y <= A11;
        elsif d13 = '0' then
            Y <= A13;
        elsif d31 = '0' then
            Y <= A31;
        elsif d33 = '0' then
            Y <= A33;
        end if;
    end if;
end process;
end Behavioral;
