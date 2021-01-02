library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_32 is
    port(
        A, B : in std_logic_vector(31 downto 0);
        SUB : in std_logic;
        Op : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(31 downto 0);
        V, C, Z : out std_logic);

end ALU_32;

architecture Behavioral of ALU_32 is

component MUX_32
        port(
        A, B, C, D : in std_logic_vector(31 downto 0);
        ALUcontrol : in std_logic_vector(1 downto 0);
        R : out std_logic_vector(31 downto 0));
end component;

component ARITH_32
    port(
        A, B : in std_logic_vector(31 downto 0);
        Sub  : in std_logic;
        R    : out std_logic_vector(31 downto 0);
        V, C : out std_logic);
end component;

component ZeroExtend
  port(
        A: in std_logic;
        R: out std_logic_vector(31 downto 0 ));
end component;

component LOGIC_32
        port(A, B : in std_logic_vector(31 downto 0);
             Op : in std_logic_vector(1 downto 0);
             R : out std_logic_vector(31 downto 0));
end component;


signal conv1, conv2, conv3, conv4, MUXOp : std_logic_vector(31 downto 0);
signal overflow, msbXv : std_logic;
    
begin

  andInst1 : LOGIC_32 port map(
        A => A,
        B => B,
        Op => "00",
        R => conv1);
        
  andInst2 : LOGIC_32 port map(
        A => A,
        B => B,
        Op => "01",
        R => conv2);
        
  arithInst : ARITH_32 port map(
        A => A,
        B => B,
        Sub => SUB,
        V => overflow,
        R => conv3,
        C => C);
        
  msbXv <= conv3(31) xor overflow;
  
  zeroInst : ZeroExtend port map(
        A => msbXv,
        R => conv4);
        
  multiplexer : MUX_32 port map(
        A => conv1,
        B => conv2,
        C => conv3,
        D => conv4,
        ALUcontrol => Op,
        R => MUXOp);
  
  V <= overflow;
  R <= MUXOp;      
  Z <= '0' when (MUXOp /= X"00000000") else '1';
  
end Behavioral;
