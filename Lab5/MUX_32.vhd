library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_32 is
    port(
        A, B, C, D : in std_logic_vector(31 downto 0);
        ALUcontrol : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(31 downto 0));
    
end MUX_32;

architecture Behavioral of MUX_32 is  
    
begin

with ALUcontrol select 

R <= A when "00",
     B when "01",
     C when "10",
     D when others;

end Behavioral;
