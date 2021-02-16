library ieee;              		-- Load the ieee 1164 library
use ieee.std_logic_1164.all;  	-- Make the package 'visible'


-- The top level entity of the test bench has no ports...
entity PART3C_tb is
end PART3C_tb;

architecture stimulus of PART3C_tb is
  -- First, declare the lower-level entity...
  component PART3C
    port  (a, b, c, d, e : in STD_LOGIC;
           g : out STD_LOGIC);
  end component;
  
  -- Next, declare some local signals to assign values to and observe...
  signal a_test, b_test, c_test, d_test, e_test : STD_LOGIC;
  signal g_test : STD_LOGIC;
  
begin
  -- Create an instance of the component under test
  bcdcheck_instance: PART3C port map( 
	a => a_test, 
	b => b_test, 
	c => c_test, 
	d => d_test,
	e => e_test, 
	g => g_test);
  
  -- Now define a process to apply some stimulus over time...
  process
    constant PERIOD: time := 40 ns;
  begin
    a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;

    a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;

    a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;
    
    a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;
    
    a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;
    
    a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;
    
    a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;
    
    a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '0'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '0'; e_test <= '1'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '1'; e_test <= '0'; 
    wait for PERIOD;
    a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '1'; e_test <= '1'; 
    wait for PERIOD;

    -- put breakpoint to line below
    wait for PERIOD;    
  end process;  
end stimulus;
