library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PART4_tb is
--  Port ( );
end PART4_tb;

architecture stimulus of PART4_tb is
    component PART4
        port(x : in std_logic_vector(3 downto 0);
            y : out std_logic_vector(3 downto 0));
    end component;
    
signal x_test : std_logic_vector(3 downto 0);
signal  y_test : std_logic_vector(3 downto 0);


begin
bcdcheckPart4_instance : PART4 port map(
    x => x_test,
    y => y_test);

process
constant period : time := 40ns;
begin
    x_test <= "0000";
    wait for PERIOD;
    x_test <= "0001";
    wait for PERIOD;
    x_test <= "0010";
    wait for PERIOD;
    x_test <= "0011";
    wait for PERIOD;        

    x_test <= "0100";
    wait for PERIOD;
    x_test <= "0101";
    wait for PERIOD;
    x_test <= "0110";
    wait for PERIOD;
    x_test <= "0111";
    wait for PERIOD;        

    x_test <= "1000";
    wait for PERIOD;
    x_test <= "1001";
    wait for PERIOD;
end process;  
end stimulus;