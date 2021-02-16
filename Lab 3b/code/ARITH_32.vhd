library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ARITH_32 is
  port(
        A, B : in std_logic_vector(31 downto 0);
        Sub  : in std_logic;
        R    : out std_logic_vector(31 downto 0);
        V, C : out std_logic);
end ARITH_32;

architecture Behavioral of ARITH_32 is
  component ADDER_32 is
    port(A, B : in STD_LOGIC_VECTOR(31 downto 0);
    Cin : in STD_LOGIC;
    R : out STD_LOGIC_VECTOR(31 downto 0); 
    V, C : out STD_LOGIC);
  end component;
    
  signal xorVector: STD_LOGIC_VECTOR(31 downto 0);
  
begin
  
  subtract : for i in 0 to 31 generate
    xorVector(i) <= B(i) xor Sub;
  end generate;
  
  myadder : ADDER_32 PORT MAP(
  A => A,
  B => xorVector,
  Cin => Sub,
  R => R,
  V => V,
  C => C);
  
end Behavioral;
