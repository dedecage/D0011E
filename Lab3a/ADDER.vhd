library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADDER is
  port(
        A, B : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        R    : out std_logic_vector(3 downto 0);
        V, C : out std_logic);
end ADDER;

architecture Behavioral of ADDER is
  component FULL_ADDER is
    port(A, B, Cin : in STD_LOGIC;
      R, Cout : out STD_LOGIC);
  end component;
  
Signal Cout : STD_LOGIC_VECTOR(3 DOWNTO 0); 

begin
    adder1 : FULL_ADDER PORT MAP(A(0), B(0), Cin, R(0), Cout(0));
    adder2 : FULL_ADDER PORT MAP(A(1), B(1), Cout(0), R(1), Cout(1));
    adder3 : FULL_ADDER PORT MAP(A(2), B(2), Cout(1), R(2), Cout(2));
    adder4 : FULL_ADDER PORT MAP(A(3), B(3), Cout(2), R(3), Cout(3));
    V <= Cout(2) XOR Cout(3);
    C <= Cout(3);
end Behavioral;