library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
	Port ( Opcode : in std_logic_vector(5 downto 0);
           funct  : in std_logic_vector(5 downto 0);
           Z		 : in std_logic;
           RegDestination, RegWE, ALUSource, DataMemWE, Jump, Branch, MemToReg: out std_logic;
           ALUControl : out std_logic_vector(2 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

process(Opcode, funct)
begin


-- ADDI - Funct obsolete
if Opcode = "001000" then
ALUControl <= "010"; RegDestination <= '0'; ALUSource <= '1'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

-- SLTI - Funct obsolete
elsif Opcode = "001010" then
ALUControl <= "111"; RegDestination <= '0'; ALUSource <= '1'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

-- ORI
elsif Opcode = "001101" then
ALUControl <= "001"; RegDestination <= '0'; ALUSource <= '1'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

-- ANDI
elsif Opcode = "001100" then
    ALUControl <= "000"; RegDestination <= '0'; ALUSource <= '1'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

-- LW - Funct obsolete
elsif Opcode = "100011" then
    ALUControl <= "010"; RegDestination <= '0'; ALUSource <= '1'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '1'; Jump <= '0';

-- SW - Funct obsolete
elsif Opcode = "101011" then
    ALUControl <= "010"; RegDestination <= 'X'; ALUSource <= '1'; RegWE <= '0'; Branch <= '0'; DataMemWE <= '1'; MemtoReg <= 'X'; Jump <= '0';

-- beq - Funct obsolete
elsif Opcode = "000100" then
    ALUControl <= "110"; RegDestination <= 'X'; ALUSource <= '0'; RegWE <= '0'; Branch <= '1'; DataMemWE <= '0'; MemtoReg <= 'X'; Jump <= '0';

-- J-instruction - Funct obsolete
elsif Opcode = "000010" then
    ALUControl <= "XXX"; RegDestination <= 'X'; ALUSource <= 'X'; RegWE <= '0'; Branch <= 'X'; DataMemWE <= '0'; MemtoReg <= 'X'; Jump <= '1';

-- R-Type
-- ADD/SUB/SLT/AND/OR all have the same Opcode, RegDestination and ALUSource, but different Funct and ALUControl.
elsif Opcode = "000000" then

    -- ADD
    if funct = "100000" then 
        ALUControl <= "010"; RegDestination <= '1'; ALUSource <= '0'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

    -- SUB
    elsif funct = "100010" then
        ALUControl <= "110"; RegDestination <= '1'; ALUSource <= '0'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

    -- SLT
    elsif funct = "101010" then 
        ALUControl <= "111"; RegDestination <= '1'; ALUSource <= '0'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

    -- AND
    elsif funct = "100100" then 
        ALUControl <= "000"; RegDestination <= '1'; ALUSource <= '0'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

    -- OR
    elsif funct = "100101" then 
        ALUControl <= "001"; RegDestination <= '1'; ALUSource <= '0'; RegWE <= '1'; Branch <= '0'; DataMemWE <= '0'; MemtoReg <= '0'; Jump <= '0';

-- I-type
end if;
-- R-type
end if;


end Process;

end Behavioral;