# DE0011E Lab 4 (First MIPS version)
The goal of this lab is to implement a simplified 32-bit MIPS processor that you have seen in quiz 2. It is recommended that this lab is  completed in groups of two.

We will only implement a subset of MIPS instructions (branch, store, and load instructions will be implemented in lab5). We will also leave out until lab 5 the implementation of data memory.

Before you start, study the files RegFile.vhd and ProgramMemory.vhd which is already imported in the given project. You will need to understand them to conitue with the lab. This will be your register file and the program that will be executed to test the designed processor. Also add your ALU files from Lab3b to the project. They should not need any modifications.

# Part 1
Implement a top-level entity with the interface:

```vhdl
entity FirstMipsVersion is
    port(
            Clk : in std_logic;
            Reset : in std_logic
        );
end FirstMipsVersion;
```

It should include the following components: a register file (given to you), an ALU (from lab 3b), a program memory (given to you) with its program counter you designed in lab 3b, a control unit, a sign extend block and some multiplexers. (Refer to lecture 12 for more information). Below you can see the interfaces for the components you will need to implement. The multiplexer interfaces are down to you to design.

```vhdl
entity ControlUnit is
	port(
        Opcode : in std_logic_vector(5 downto 0);
        funct  : in std_logic_vector(5 downto 0);
        Z		 : in std_logic;
        RegDestination, WriteEnable, ALUSource : out std_logic;
        ALUControl : out std_logic_vector(2 downto 0)
	);
end ControlUnit;
```

```vhdl
entity SignExtend is
	port(
		A : in std_logic_vector(15 downto 0);
		B : out std_logic_vector(31 downto 0)
		);
end SignExtend;
```

You should support the following R- and **I**-type instructions (see quiz 2):
- **ADD, ADDI, SUB, SLT, SLTI, AND, OR** (from the core instruction set) 

Other requirements:
- The result from all instructions must be available in the register file in the next clock cycle.
- You may not use the clock for anything other than the register file and the program counter.
- You may not use the process statement other than in the test bench, the register file and the control unit.

When implementing the control unit refer to the lecture slides for its inputs and outputs and refer to tables B.1 and B.2 in the text book for ```OP``` and ```FUNCT``` codes for each instruction that you need to follow and implement in your control unit. The control unit needs may use a simple process, which is written in sequential VHDL (Ifstatement) to test for ```OP``` and ```FUNCT``` codes and generate the control signals for the corresponding instruction.

Before continuing to the next part, check the schematic of the circuits created. It can happen that you have created a "Latch", which is a common problem when writing code for HDL. Review the lecture slide of Register to know more about what is a Latch and check this page for instruction on how to fix your code: [https://www.nandland.com/articles/how-to-avoid-transparent-latches-in-vhdl-and-verlog.html](https://www.nandland.com/articles/how-to-avoid-transparent-latches-in-vhdl-and-verlog.html)

# Part 2
- Update the test bench, ```test_bench.vhd```, such that it executes the code stores in the program memory.
- Simulate the test bench and verify that the resulting values in the register file are correct. To do so, you will need to select he register file in the "Instance and Processes" panel of ISim and drag its internal signals from the  Objects panel to the wave window. You will need to re-start the simulation to view the values of these signals.
- Make sure the resulting values are correct, refer to the code in the program memory and quiz 2.