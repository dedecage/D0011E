library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PART3C is
--  Port ( );
  port(a, b, c, d, e : in STD_LOGIC;
    g : out STD_LOGIC);
end PART3C;

architecture beteende of PART3C is

component PLDcell is
  port(x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
    y : out STD_LOGIC);
end component;

signal ap, bp, cp, z : STD_LOGIC;

begin
  ap <= not a;
  bp <= not b;
  cp <= not c;
  
  cell1 : PLDcell PORT MAP('0','0','0',ap,bp,cp,'0',z);
  cell2 : PLDcell PORT MAP(ap,bp,cp,'1','1',z,'0',g);
end beteende;
