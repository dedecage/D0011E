library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
 port ( clk, reset : in std_logic;
       d : in std_logic_vector(31 downto 0);
       q : out std_logic_vector(31 downto 0)
);
end Reg;

architecture Behavioral of Reg is
    
  begin
  
  process (clk, reset) 
  
  begin
       if reset = '1' then
            q <= x"00000000";
       
      elsif rising_edge(clk) then
           q <= d;
      end if;
  
  end process ;

end Behavioral;
