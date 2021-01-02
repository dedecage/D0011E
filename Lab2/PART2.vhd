--  BCDcheck
--  Indikerar egenskaper hos siffror i BCD-kod

library IEEE;
use IEEE.std_logic_1164.all;

entity PART2 IS
  port(a, b, c, d : in STD_LOGIC;
       f : out STD_LOGIC);
end entity PART2;
	
architecture beteende OF PART2 IS
begin
  f <= (b and not c and not d) or (not a and not d) or (a and not c) or (not a and c);
end architecture beteende;
