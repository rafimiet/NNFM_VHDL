----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2021 12:15:24
-- Design Name: 
-- Module Name: buf2filt3 - Behavioral
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

entity buf2filt3 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           A11,A12,A13 : out STD_LOGIC_VECTOR (7 downto 0));
end buf2filt3;

architecture Behavioral of buf2filt3 is
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
U2: DFF GENERIC MAP (8) PORT MAP (A3,clk,rst,A13);
A11 <= A2;
A12 <= A3;
end Behavioral;
