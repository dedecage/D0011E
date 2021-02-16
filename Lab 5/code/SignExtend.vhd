library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtend is
    port(
            A : in std_logic_vector(15 downto 0);
            B : out std_logic_vector(31 downto 0)
         );
end SignExtend;

architecture Behavioral of SignExtend is

begin

copy: for i in 0 to 15 generate
 
	B(i) <= A(i);
	
end generate;

extend: for j in 16 to 31 generate
	
	B(j) <= A(15);

end generate;

end Behavioral;
