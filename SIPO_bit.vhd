----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.08.2021 13:18:13
-- Design Name: 
-- Module Name: SIPO_bit - Behavioral
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

entity SIPO_bit is
    Port ( a : in STD_LOGIC;
           clk,rst : in STD_LOGIC;
           y1,y2,y3,y4,y5 : out STD_LOGIC);
end SIPO_bit;

architecture Behavioral of SIPO_bit is
signal sr : std_logic_vector(4 downto 0) := (Others => '0');
begin
process (clk,rst)
    begin
    if (rst = '1') then
        y1 <= '0';y2 <= '0';y3 <= '0';y4 <= '0';
    elsif (clk'event and clk = '1') then
        sr <= sr(sr'high - 1 downto sr'low) & a;
        y1 <= sr(0);y2 <= sr(1);y3 <= sr(2);y4 <= sr(3);y5 <= sr(4);
    end if;
end process;
end Behavioral;
