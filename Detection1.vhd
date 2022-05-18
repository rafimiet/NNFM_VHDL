-- DETECTION OF A SINGLE NOISY PIXEL


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Detection1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end Detection1;

architecture Behavioral of Detection1 is
component Comparator1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end component;
component Comparator2 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end component;
component Or1 is
    Port ( a,b : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
----
signal y1,y2 : std_logic := '0';
begin
U1: Comparator1 port map (A,y1);
U2: Comparator2 port map (A,y2);
U3: Or1 port map (y1,y2,y);
end Behavioral;
