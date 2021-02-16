library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER is
    port(
            A, B, Cin : in std_logic;
            R, Cout : out std_logic);
end entity;

architecture beteende of FULL_ADDER is
signal firstXOR, firstAND, secondAND: STD_LOGIC;
    begin
        firstXOR <= A XOR B;
        firstAND <= A AND B;
        secondAND <= firstXOR AND Cin;
        R <= firstXOR XOR Cin;
        Cout <= firstAND OR secondAND;
end beteende;
