library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ARITH is
  port(
        A, B : in std_logic_vector(3 downto 0);
        Sub  : in std_logic;
        R    : out std_logic_vector(3 downto 0);
        V, C : out std_logic);
end ARITH;

architecture Behavioral of ARITH is
  component ADDER is
    port(A, B : in STD_LOGIC_VECTOR(3 downto 0);
    Cin : in STD_LOGIC;
    R : out STD_LOGIC_VECTOR(3 downto 0); 
    V, C : out STD_LOGIC);
  end component;
    
  signal xorVector: STD_LOGIC_VECTOR(3 downto 0);
  
begin
  xorVector(0) <= Sub XOR B(0);
  xorVector(1) <= Sub XOR B(1);
  xorVector(2) <= Sub XOR B(2);
  xorVector(3) <= Sub XOR B(3);
  
  myadder : ADDER PORT MAP(
  A => A,
  B => xorVector,
  Cin => Sub,
  R => R,
  V => V,
  C => C);
end Behavioral;