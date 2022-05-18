--- DFF of variable number of BITs

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity DFF is
    Generic (N: integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           clk, rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (N-1 downto 0));
end DFF;

architecture Behavioral of DFF is

begin
process (clk,rst)
    begin
    if (rst = '1') then
        Y <= (OTHERS => '0');
    elsif (clk'event and clk = '1') then
        Y <= A;
    end if;
end process;
end Behavioral;
