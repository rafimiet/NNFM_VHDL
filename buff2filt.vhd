----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.numeric_std.all;


entity buff2filt is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           A11,A12,A13,A14,A15 : out STD_LOGIC_VECTOR (7 downto 0));
end buff2filt;

architecture Behavioral of buff2filt is
component DFF is
    Generic (N: integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk, rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;
signal A1,A2, A3, A4, A5,A6 : STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');
begin
U01: DFF GENERIC MAP (8) PORT MAP (A,clk,rst,A1);
U02: DFF GENERIC MAP (8) PORT MAP (A1,clk,rst,A2);
U1: DFF GENERIC MAP (8) PORT MAP (A2,clk,rst,A3);
U2: DFF GENERIC MAP (8) PORT MAP (A3,clk,rst,A4);
U3: DFF GENERIC MAP (8) PORT MAP (A4,clk,rst,A5);
U4: DFF GENERIC MAP (8) PORT MAP (A5,clk,rst,A15);
A11 <= A2;
A12 <= A3;
A13 <= A4;
A14 <= A5;
end Behavioral;
