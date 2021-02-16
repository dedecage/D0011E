library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    port (Clk, Reset : in std_logic;
          regIn : in std_logic_vector(31 downto 0);
          regOut : out std_logic_vector(31 downto 0)    
          );
end Reg;

architecture Behavioral of Reg is
    
  begin
  
  process (clk, reset) 
  
  begin
       if reset = '1' then
            regOut <= x"00000000";
       
      elsif rising_edge(clk) then
           regOut <= regIn;
      end if;
  
  end process ;

end Behavioral;
