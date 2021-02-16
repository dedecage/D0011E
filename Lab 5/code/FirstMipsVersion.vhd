library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FirstMipsVersion is
    Port (  Clk : in std_logic;
            Reset : in std_logic;
            Debug_reg_address : in std_logic_vector(4 downto 0);
            Debug_reg_data: out std_logic_vector(31 downto 0);
            Debug_datamem_address : in std_logic_vector(31 downto 0);
            Debug_datamem_data : out std_logic_vector(31 downto 0));
end FirstMipsVersion;

architecture Behavioral of FirstMipsVersion is

component Regfile is
   Port (
      clk           : in std_logic;
      reset         : in std_logic;
      RegA_data     : out std_logic_vector(31 downto 0);
      RegB_data     : out std_logic_vector(31 downto 0);
      RegA_address  : in std_logic_vector(4 downto 0);
      RegB_address  : in std_logic_vector(4 downto 0);
      W_data        : in std_logic_vector(31 downto 0);
      RegW_address  : in std_logic_vector(4 downto 0);
      WriteEnable   : in std_logic;
      dbg_reg       : in std_logic_vector(4 downto 0);
      dbg_reg_data  : out std_logic_vector(31 downto 0));
end component;

component ALU_32 is
	Port ( A, B    : in  STD_LOGIC_VECTOR(31 downto 0);
           Sub     : in  STD_LOGIC;
           Op      : in  STD_LOGIC_VECTOR(1 downto 0);
           R       : out  STD_LOGIC_VECTOR(31 downto 0);
           Z       : out  STD_LOGIC);
end component;

component Programmemory is
	Port ( address     : in std_logic_vector(31 downto 0);
           instruction : out std_logic_vector(31 downto 0));
end component;

component PCPlus4 is
    Port (Clk, Reset           : in std_logic;
          Output, OutputPlus4  : out std_logic_vector(31 downto 0);
          Input                : in std_logic_vector(31 downto 0));
end component;

component ControlUnit is
	Port ( Opcode  : in std_logic_vector(5 downto 0);
           funct   : in std_logic_vector(5 downto 0);
           Z       : in std_logic;
           RegDestination, RegWE, ALUSource, DataMemWE, Jump, Branch, MemToReg : out std_logic;
           ALUControl : out std_logic_vector(2 downto 0));
end component;

component SignExtend is
	Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MUX_2TO1_32 is
	Port ( A, B : in  STD_LOGIC_VECTOR(31 downto 0);
		   Op : in std_logic;
           R : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MUX_2TO1 is
	Port ( A, B : in  STD_LOGIC_VECTOR(4 downto 0);
		   Op : in std_logic;
           R : out  STD_LOGIC_VECTOR(4 downto 0));
end component;

component DataMemory is
    Port ( Clk : in std_logic;
           Reset : in std_logic;
           MemWE : in std_logic;
           Address : in std_logic_vector(31 downto 0);
           DataIn : in std_logic_vector(31 downto 0);
           DataOut : out std_logic_vector(31 downto 0);
           dbg_datamem : IN std_logic_vector(31 downto 0);
           dbg_datamem_data : OUT std_logic_vector(31 downto 0));
end component;

component sll_32bit is
    Port (A : in  STD_LOGIC_VECTOR(31 downto 0);
          R : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component sll_26bit is
    Port (A : in  STD_LOGIC_VECTOR(25 downto 0);
          R : out  STD_LOGIC_VECTOR(27 downto 0));
end component;

component ADDER_32 is
    Port ( A, B : in std_logic_vector(31 downto 0);
           Cin  : in std_logic;
           R    : out std_logic_vector(31 downto 0);
           V, C : out std_logic);
end component;




signal 
    pc_out,
    pcplus4_out,
    instruction,
    RegA_data,
    RegB_data,
    signext_out,
    Mux32_1_out,
    Mux32_2_out,
    ALUResult,
    DataMemOut,
    AdderIn,
    AdderOut,
    Mux_32_3_Out,
    Mux_32_4_Out,
    Mux_32_4_In : std_logic_vector(31 downto 0);
    
signal Mux5bit_out : std_logic_vector(4 downto 0);

signal ALUControl : std_logic_vector(2 downto 0);

signal Z, RegWE, RegDestination, ALUSource, DataMemWE, Jump, Branch, MemToReg, ZandBranch : std_logic;

signal sll_26output : std_logic_vector(27 downto 0);


begin

Mux_32_4_In(31 downto 28) <= pcplus4_out(31 downto 28); 
Mux_32_4_In(27 downto 0) <= sll_26output(27 downto 0);

ZandBranch <= Z and branch;

RegF: Regfile Port Map(
    Clk => Clk,
    reset => reset,
    RegA_data => RegA_data,
    RegB_data => RegB_data,
    RegA_address => instruction(25 downto 21),
    RegB_address => instruction(20 downto 16),
    W_data => Mux32_2_out,
    RegW_address => Mux5bit_out,
    WriteEnable => RegWE,
    dbg_reg => Debug_reg_address,
    dbg_reg_data => Debug_reg_data);

ALU : ALU_32 Port Map(
    A => RegA_data,
    B => Mux32_1_out,
    Sub => ALUControl(2),
    Op => ALUControl(1 downto 0),
    Z => Z,
    R => ALUResult);

ProgMemory : Programmemory Port Map(
    Address => pc_out,
    Instruction => Instruction);

PCP4: PCPlus4 Port Map(
    Clk => Clk,
    Reset => Reset,
    Output => pc_out,
    OutputPlus4 => pcplus4_out,
    Input => Mux_32_4_out);

CLU : ControlUnit Port Map(
    Opcode => instruction(31 downto 26),
    Funct => instruction(5 downto 0),
    Z => Z,
    RegDestination => RegDestination,
    RegWE => RegWE,
    ALUSource => ALUSource,
    DataMemWE => DataMemWE,
    Jump => Jump,
    Branch => Branch,
    ALUControl => ALUControl,
    MemToReg => MemToReg);

SignExt: SignExtend Port Map(
    A => instruction(15 downto 0),
    B => signext_out);

DataMem : DataMemory Port Map(
    Clk => Clk,
    Reset => Reset,
    MemWE => DataMemWE,
    Address => ALUResult,
    DataIn => RegB_Data,
    DataOut => DataMemOut,
    dbg_datamem => Debug_datamem_address,
    dbg_datamem_data => Debug_datamem_data);

Mux_32_1 : MUX_2TO1_32 Port Map(
    A => RegB_data,
    B => signext_out,
    Op => ALUSource,
    R => Mux32_1_out);

Mux5bit : MUX_2TO1 Port Map(
    A => instruction(20 downto 16),
    B => instruction(15 downto 11),
    op => RegDestination,
    R => Mux5bit_out);

Mux_32_2 : MUX_2TO1_32 Port Map(
    A => ALUResult,
    B => DataMemOut,
    Op => MemToReg,
    R => Mux32_2_out);

SLL_32 : sll_32bit Port Map(
    A => signext_out,
    R => AdderIn);

adder : ADDER_32 Port Map(
    A => pcplus4_out,
    B => AdderIn,
    Cin => '0',
    R => AdderOut);

Mux_32_3 : MUX_2TO1_32 Port Map(
    A => pc_out,
    B => AdderOut,
    Op => ZandBranch,
    R => Mux_32_3_Out);

Mux_32_4 : MUX_2TO1_32 Port Map(
    A => Mux_32_3_Out,
    B => Mux_32_4_In,
    Op => Jump,
    R => Mux_32_4_out);

SLL_26 : sll_26bit Port Map(
    A => instruction(25 downto 0),
    R => sll_26output);

end Behavioral;
