library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity main is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
		reset : in std_logic;
		clock : in std_logic
		
    -- outputs
    );

end main;


architecture behav of main is

	 component regfile is
	generic(
		operand_width : integer:=16
        );
	port (
            clock: in std_logic;
            RF_WR: in std_logic;
            PC_WR: in std_logic;
            RF_A1: in std_logic_vector(2 downto 0);
            RF_A2: in std_logic_vector(2 downto 0);
            RF_A3: in std_logic_vector(2 downto 0);
            RF_D3: in std_logic_vector((operand_width - 1) downto 0);
            PC_in: in std_logic_vector((operand_width - 1) downto 0);
            RF_D1: out std_logic_vector((operand_width - 1) downto 0);
            RF_D2: out std_logic_vector((operand_width - 1) downto 0);
            PC_out: out std_logic_vector((operand_width - 1) downto 0)
        );
	end component;
	 
	 component instr_mem is
	generic(
		operand_width : integer:=16
        );
	port (
		mem_add: in std_logic_vector((operand_width - 1) downto 0);
        mem_data: out std_logic_vector((operand_width - 1) downto 0)
        );
	end component;

	component ADDER is
		generic
		(
			operand_width : integer := 16
		);
	   port
		(
		 ALU_A:in std_logic_vector((operand_width-1) downto 0);
		   ALU_C:out std_logic_vector((operand_width-1) downto 0)
	   );
   end component;
	 
	component Stage2_WithoutHazards is
		port (PC_R1: in std_logic_vector(15 downto 0);
			Instr_R1: in std_logic_vector(15 downto 0);
			ct1: in std_logic_vector(2 downto 0);
				ct2: in std_logic_vector(2 downto 0);
			clock: in std_logic;
				
			PC_R2: out std_logic_vector(15 downto 0);
				Instr_R2: out std_logic_vector(15 downto 0);
				Counter1_R2: out std_logic_vector(2 downto 0);
				IF_en: out std_logic;
				ControlSig_R2_RFWR: out std_logic;
				ControlSig_R2_M2WR: out std_logic);
	end component;

	component Register_Read is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
    port (Instr_R2:	in std_logic_vector(15 downto 0);
			PC_R2:	in std_logic_vector(15 downto 0);
			A_R2:	in std_logic_vector(15 downto 0);
			B_R2:	in std_logic_vector(15 downto 0);
			C_R2:	in std_logic_vector(15 downto 0);
			ControlSig_R2:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			RF_D1 : in std_logic_vector(15 downto 0);
			RF_D2 : in std_logic_vector(15 downto 0);			
			RR_RefAdd_out : in std_logic_vector(15 downto 0);
			
	
			PC_R3: out std_logic_vector(15 downto 0);
			A_R3:	out std_logic_vector(15 downto 0);
			B_R3:	out std_logic_vector(15 downto 0);
			C_R3:	out std_logic_vector(15 downto 0);
			ControlSig_R3:	out std_logic_vector(15 downto 0); ---check if needed here
			RF_A1 : out std_logic_vector(2 downto 0);
			RF_A2 : out std_logic_vector(2 downto 0);
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0);
			RR_RefAdd_E : out std_logic;
			RR_RefAdd_in : out std_logic_vector(15 downto 0);
			Instr_R3 : out std_logic_vector(15 downto 0)
			);
	end component;
	
	--execute
	
	component MEM_STAGE is
	 generic
	 (
		 operand_width : integer := 16
	 );
    port
	 (
      Dmem_Add:in std_logic_vector((operand_width-1) downto 0);
		DMem_Din:in std_logic_vector((operand_width-1) downto 0);
		ALU_C :in std_logic_vector((operand_width-1) downto 0);
		WB_data_in :in std_logic_vector((operand_width-1) downto 0);
		WB_add_in :in std_logic_vector(2 downto 0);
		mem_wr, dout_select: in std_logic;
		Dout:out std_logic_vector((operand_width-1) downto 0);
		WB_data_out:out std_logic_vector((operand_width-1) downto 0);
		WB_add_out :in std_logic_vector(2 downto 0)
    );
	 end component;

	component Write_Back is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
     port (PC_R5:	in std_logic_vector(15 downto 0);
			A_R5:	in std_logic_vector(15 downto 0);
			B_R5:	in std_logic_vector(15 downto 0);
			C_R5:	in std_logic_vector(15 downto 0);
			ControlSig_R5:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			
	
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0)
			);
	end component;

	component mux2to1 is
		port (A, B: in std_logic_vector(15 downto 0);
			  F : out std_logic_vector(15 downto 0);
				 S : in std_logic);
	end component;
	 
	 signal pc, instr : std_logic_vector((operand_width)-1 downto 0);
	 signal rf_wr, pc_wr : std_logic;
	 signal a1, a2, a3 : std_logic_vector(2 downto 0);
	 signal d1, d2, d3 : std_logic_vector((operand_width)-1 downto 0);
	 signal pc_in, pc_in0, pc_in1 : std_logic_vector((operand_width)-1 downto 0); --from ex stage
	 

	 signal Z_flag, C_flag: std_logic;
	 
	 
	 signal D_Add, Din, C_to_din, WB_data_in, WB_add_in, Dout, WB_d_out, WB_a_out : std_logic_vector((operand_width)-1 downto 0);
	 signal mem_wr, dout_sel : std_logic;


	 type R1 is array( 0 to 95 ) of std_logic;
	 type R2 is array( 0 to 95 ) of std_logic;
	 type R3 is array( 0 to 95 ) of std_logic;
	 type R4 is array( 0 to 95 ) of std_logic;
	 type R5 is array( 0 to 95 ) of std_logic;
	--ControlSig_R2(...), PC_R2(16), A_R2(16), B_R2(16), C_R2(16), Instr_R2(16)

	begin

	 rf: regfile port map (clock,rf_wr,PC_WR,a1,a2,a3,d3,pc_in,d1,d2,pc);
	 i_mem: instr_mem port map (pc, instr);
	 alu1 : ADDER port map (pc,pc_in0);
	 id: Stage2_WithoutHazards port map (R1((operand_width-1) downto 0),R1((2*operand_width-1) downto operand_width),__,__,clock,R2((operand_width-1) downto 0),R2((2*operand_width-1) downto operand_width),__,__,__,__);
	 reg_read: Register_Read port map (R2((2*operand_width-1) downto operand_width),R2((operand_width-1) downto 0),AR2,BR2,CR2,);
	 --
	 m_acc: MEM_STAGE port map (D_Add,Din,C_to_din,WB_data_in,WB_add_in,mem_wr,dout_sel,Dout,WB_d_out,WB_a_out);
	 wb: Write_Back port map (PC_R5_out,A_R5_out,B_R5_out,C_R5_out,___,d3,a3);
	
	 proc: process(clock)
	 
		if(clock = '0' and clock'event) then
			
			--mem stage
			R5 <= mux1;

		end if;
	 
	 end process;

end behav;