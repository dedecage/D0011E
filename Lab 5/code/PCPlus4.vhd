library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCPlus4 is
 Port (Clk, Reset : in std_logic;
       Output, OutputPlus4 : out std_logic_vector(31 downto 0);
       Input : in std_logic_vector(31 downto 0));
end PCPlus4;

architecture Behavioral of PCPlus4 is

component ADDER_32
    port (A,B: in std_logic_vector(31 downto 0);
          Cin : in std_logic;
          R : out std_logic_vector(31 downto 0);
          C,V : out std_logic
          );
end component;
    
component Reg 
    port (Clk, Reset : in std_logic;
          regIn : in std_logic_vector(31 downto 0);
          regOut : out std_logic_vector(31 downto 0)    
          );
end component;
     
     signal adderIn, adderOut : std_logic_vector(31 downto 0);
     
begin
    RegInstance : Reg Port Map(clk => clk, reset => reset, regIn => adderOut, regOut => adderIn );
    AdderInstance : ADDER_32 Port Map( A => x"00000004", B => adderIn, Cin => '0', R => adderOut );
    Output <= adderIn;
    OutputPlus4 <= adderOut;
end Behavioral;
