library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLDcell is
  port(x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
    y : out STD_LOGIC);
end PLDcell;

architecture beteende of PLDcell is
SIGNAL and1, and2, or1 : STD_LOGIC;
begin
  and1 <= '1' when (x5 = '1') and (x4 = '1') and (x3 = '1') else '0';
  and2 <= '1' when (x2 = '1') and (x1 = '1') and (x0 = '1') else '0'; 
  or1 <= '1' when (and1 = '1') or (and2 = '1') else '0';
  y <= '1' when ((or1 = '1') and (inv = '0')) or ((or1 = '0') and (inv = '1')) else '0';
end beteende;
