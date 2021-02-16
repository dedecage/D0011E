library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sll_32bit is
    Port (A : in  STD_LOGIC_VECTOR(31 downto 0);
          R : out  STD_LOGIC_VECTOR(31 downto 0));
end sll_32bit;

architecture Behavioral of sll_32bit is


begin

	R(31 downto 2) <= A(29 downto 0);
	R(1 downto 0) <= "00";

end Behavioral;

