library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;



entity DataMemory is 
    Port ( Clk : in std_logic;
           Reset : in std_logic;
           MemWE : in std_logic;
           Address : in std_logic_vector(31 downto 0);
           DataIn : in std_logic_vector(31 downto 0);
           DataOut : out std_logic_vector(31 downto 0);
           dbg_datamem : in std_logic_vector(31 downto 0);
           dbg_datamem_data : out std_logic_vector(31 downto 0));
end entity;

architecture beteende of DataMemory is
    
type DataMemRegister is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal DataMemRegisterObject: DataMemRegister;

begin

    process(clk, reset)

        begin
    
        if Address <= x"0000001F" then
    
            if Reset = '1' then
        
                DataMemRegisterObject <= (others => (others => '0'));
            
            elsif clk'event and clk='1' then
        
                if MemWE='1' then
            
                    DataMemRegisterObject(conv_integer(Address)) <= DataIn;
                
                end if;
            end if;
        end if;
    end process;



    process(MemWE)
        begin
        if MemWE = '0' and Address <= x"0000001F" then
            DataOut <= DataMemRegisterObject(conv_integer(Address));
        end if;
    end process;

    dbg_datamem_data <= DataMemRegisterObject(conv_integer(dbg_datamem));

    
end beteende;

-- simsalabim