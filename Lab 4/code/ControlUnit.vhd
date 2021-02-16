library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
	port(
        Opcode : in std_logic_vector(5 downto 0);
        funct  : in std_logic_vector(5 downto 0);
        Z		 : in std_logic;
        RegDestination, WriteEnable, ALUSource : out std_logic;
        ALUControl : out std_logic_vector(2 downto 0)
	);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

WriteEnable <= '1';

Process(Opcode, Funct)
begin

if Opcode = "001000" then
    RegDestination <= '0'; ALUSource <= '1'; ALUControl <= "010";
elsif Opcode = "001010" then
    RegDestination <= '0'; ALUSource <= '1'; ALUControl <= "111";
elsif Opcode = "000000" then
	RegDestination <= '1'; ALUSource <= '0';
	if Funct = "100000" then
	   ALUControl <= "010";
	elsif Funct = "100010" then
	   ALUControl <= "110";
	elsif Funct = "101010" then
	   ALUControl <= "111";
	elsif Funct = "100100" then
	   ALUControl <= "000";
	elsif Funct = "100101" then
	   ALUControl <= "001";
	end if;
end if;

end Process;

end Behavioral;