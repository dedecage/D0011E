library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroExtend is
    port(
        A: in std_logic;
        R: out std_logic_vector(31 downto 0));
end ZeroExtend;

architecture Behavioral of ZeroExtend is

  begin

    R(0) <= A;
    
    extend: for i in 1 to 31 generate
    
      R(i) <= '0';

    end generate;

end Behavioral;
