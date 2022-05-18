----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2021 11:59:00
-- Design Name: 
-- Module Name: Detection_n_Correction_3by3 - Behavioral
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

entity Detection_n_Correction_3by3 is
    Generic (N: integer := 640);
    Port ( clk,rst : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Detection_n_Correction_3by3;

architecture Behavioral of Detection_n_Correction_3by3 is
component line_buffer is
    Generic (N: integer := 4);
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component line_buffer;
component Detection_3by3 is
    Port ( A1,A2,A3 : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           d11,d12,d13 : out STD_LOGIC;
           d21,d22,d23 : out STD_LOGIC;
           d31,d32,d33 : out STD_LOGIC;
           A11,A12,A13 : out STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23 : out STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33 : out STD_LOGIC_VECTOR (7 downto 0));
end component Detection_3by3;
component Correction_3 is
    Port ( A11,A12,A13 : in STD_LOGIC_VECTOR (7 downto 0);
           A21,A22,A23 : in STD_LOGIC_VECTOR (7 downto 0);
           A31,A32,A33 : in STD_LOGIC_VECTOR (7 downto 0);
           d11,d12,d13 : in STD_LOGIC;
           d21,d22,d23 : in STD_LOGIC;
           d31,d32,d33 : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component Correction_3;

signal d11,d12,d13 : STD_LOGIC;
signal d21,d22,d23 : STD_LOGIC;
signal d31,d32,d33 : STD_LOGIC;
signal A2,A3 : STD_LOGIC_VECTOR (7 downto 0);
signal A11,A12,A13 : STD_LOGIC_VECTOR (7 downto 0);
signal A21,A22,A23 : STD_LOGIC_VECTOR (7 downto 0);
signal A31,A32,A33 : STD_LOGIC_VECTOR (7 downto 0);

begin
U01: line_buffer GENERIC MAP (N-1) PORT MAP (A,clk,rst,A2);
U02: line_buffer GENERIC MAP (N-1) PORT MAP (A2,clk,rst,A3);

U1: Detection_3by3 PORT MAP (A,A2,A3,clk,rst,d11,d12,d13,d21,d22,d23,d31,d32,d33,A11,A12,A13,A21,A22,A23,A31,A32,A33);
U2: Correction_3 PORT MAP (A11,A12,A13,A21,A22,A23,A31,A32,A33,d11,d12,d13,d21,d22,d23,d31,d32,d33,clk,rst,Y);

end Behavioral;
