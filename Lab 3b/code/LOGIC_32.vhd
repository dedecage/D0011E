library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LOGIC_32 is
        port(A, B : in std_logic_vector(31 downto 0);
             Op : in std_logic_vector(1 downto 0);
             R : out std_logic_vector(31 downto 0));
end entity LOGIC_32;

architecture Behavioral of LOGIC_32 is
    
    component MUX_32
        port(
        A, B, C, D : in std_logic_vector(31 downto 0);
        ALUcontrol : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(31 downto 0));
    end component;
    
   signal A_temp, B_temp, C_temp, D_temp : std_logic_vector(31 downto 0);
    
begin

    merge: for i in 0 to 31 generate 
       A_temp(i) <= (A(i) and B(i));
       B_temp(i) <= (A(i) or B(i));
       C_temp(i) <= (A(i) xor B(i));
       D_temp(i) <= A(i) nor B(i);
    end generate;
    
    MUXinstance : MUX_32 port map(
       A => A_temp,
       B => B_temp,
       C => C_temp,
       D => D_temp,
       ALUcontrol => Op,
       R => R);
    
end Behavioral;
