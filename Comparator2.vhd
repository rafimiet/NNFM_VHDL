-- Smaller Threshold

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator2 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC);
end Comparator2;

architecture Behavioral of Comparator2 is
constant B : std_logic_vector(7 downto 0) := "00000101";
begin
y <= '1' when A <= B else
     '0';
end Behavioral;
