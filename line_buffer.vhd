-- SHIFT REGISTER THAT STORES A LINE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity line_buffer is
    Generic (N: integer := 4);
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           clk,rst : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end line_buffer;

architecture Behavioral of line_buffer is
signal sr : std_logic_vector(N*8-1 downto 0) := (Others => '0');
begin
process (clk,rst)
    begin
    if (rst = '1') then
        Y <= "00000000";
    elsif (clk'event and clk = '1') then
        sr <= sr(sr'high - 8 downto sr'low) & A;
        Y <= sr(sr'high downto sr'high-7);
    end if;
end process;
end Behavioral;
