library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P4PLDcell is
  port(x5, x4, x3, x2, x1, x0, inv : in std_logic;
       y : out std_logic);
end entity P4PLDcell;

architecture beteende of P4PLDcell is
begin
    y <= ((x0 and x1) or (x2 and x3) or (x4 and x5)) xor inv;

end architecture beteende;

