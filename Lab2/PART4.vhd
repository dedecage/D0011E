library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PART4 is
--  Port ( );
port(x : in std_logic_vector(3 downto 0);
     y : out std_logic_vector(3 downto 0));
end PART4;

architecture beteende of PART4 is

component P4PLDcell is
  port(x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
    y : out STD_LOGIC);
end component;

begin

cell1 : P4PLDCell PORT MAP(x(0), '1', '0', '0', '0', '0', '1', y(0));
cell2 : P4PLDCell PORT MAP(x(1), '1', '0', '0', '0', '0', '0', y(1));
cell3 : P4PLDCell PORT MAP(x(1), '1' , '0', '0', '0', '0', x(2), y(2));
cell4 : P4PLDCell PORT MAP(x(3), '1', x(2), '1', x(1), '1', '1', y(3));

end beteende;
