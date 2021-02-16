library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCPlus4 is
 Port (clk, reset : in std_logic;
       q : out std_logic_vector(31 downto 0));
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
    port (clk, reset : in std_logic;
          d : in std_logic_vector(31 downto 0);
          q : out std_logic_vector(31 downto 0)    
          );
end component;
     
     signal adderIn, adderOut : std_logic_vector(31 downto 0);
     
begin
    Reginstance : Reg port map(clk => clk, reset => reset, d => adderOut, q => adderIn );
    Adderinstance : ADDER_32 port map( A => x"00000004", B => adderIn, Cin => '0', R => adderOut );
   
   q <= adderIn;
end Behavioral;
