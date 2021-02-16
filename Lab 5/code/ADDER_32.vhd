library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADDER_32 is
  port(
        A, B : in std_logic_vector(31 downto 0);
        Cin  : in std_logic;
        R    : out std_logic_vector(31 downto 0);
        V, C : out std_logic);
end ADDER_32;

architecture Behavioral of ADDER_32 is

  component FULL_ADDER is
    port(A, B, Cin : in STD_LOGIC;
      R, Cout : out STD_LOGIC);
  end component;
  
Signal Cout : STD_LOGIC_VECTOR(32 DOWNTO 0); 

begin

    Cout(0) <= Cin;
    
    adders: for i in 0 to 31 generate
        adder_instance: FULL_ADDER port map(A => A(i), B => B(i), Cin => Cout(i), R => R(i), Cout => Cout(i + 1)); 
    end generate;
    
    V <= Cout(31) XOR Cout(32);
    C <= Cout(32);
    
end Behavioral;
