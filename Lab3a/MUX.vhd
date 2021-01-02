library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    port(
        A, B, C, D : in std_logic_vector(3 downto 0);
        ALUControl : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(3 downto 0));
    
end MUX;

architecture Behavioral of MUX is
    
begin

with ALUControl select 

R <= A when "00",
     B when "01",
     C when "10",
     D when others;
     
end Behavioral;
