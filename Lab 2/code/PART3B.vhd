library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PART3B is
--  Port ( );
  port(a, b, c, d : in STD_LOGIC;
    f : out STD_LOGIC);
end PART3B;

architecture beteende of PART3B is

component PLDcell is
  port(x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
    y : out STD_LOGIC);
end component;

signal aprim, dprim, cprim, aprimcinvers : STD_LOGIC;
 
begin
  
  aprim <= not a;
  cprim <= not c;
  myf : PLDcell PORT MAP('1',a, c, aprim, cprim, d, '1', f);
end beteende;
