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
			 A_R1: in std_logic_vector(15 downto 0);
          ct1: in std_logic_vector(2 downto 0);
			 ct2: in std_logic_vector(2 downto 0);
          clock: in std_logic;
			 
          PC_R2: out std_logic_vector(15 downto 0);
			 Instr_R2: out std_logic_vector(15 downto 0);
			 A_R2: out std_logic_vector(15 downto 0);
			 Counter1_R2: out std_logic_vector(2 downto 0);
		    IF_en: out std_logic;
			 ControlSig_R2_RFWR: out std_logic;
			 ControlSig_R2_M2WR: out std_logic);
	end component;

	component Register_Read is
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
			Instr_R3	: out std_logic_vector(15 downto 0);
			RF_WR : out std_logic
			);
	end component;

	component RefAdd is
    port(clk : in std_logic;
			RefAdd_in : in std_logic_vector(15 downto 0);
			RefAdd_out : out std_logic_vector(15 downto 0);
			RefAdd_E : in std_logic
			);
	end component;
	
	component Stage4_Exec is
    generic
    (
        operand_width : integer := 16
    );
   port
    (
   -- inputs
        PC_R3, Instr_R3:in std_logic_vector((operand_width-1) downto 0);
        A_R3, B_R3, C_R3:in std_logic_vector((operand_width-1) downto 0);
        ControlSig_R3:in std_logic_vector(1 downto 0);
        clock:in std_logic;

   -- outputs
        PC_R4, Instr_R4:out std_logic_vector((operand_width-1) downto 0);
        A_R4, B_R4, C_R4:out std_logic_vector((operand_width-1) downto 0);
        ControlSig_R4:out std_logic_vector(1 downto 0);
        PC: out std_logic_vector((operand_width-1) downto 0);
        PC_WR: out std_logic
   );
	end component;
	
	component MEM_STAGE is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      clock: in std_logic;	  
	  Dmem_Add:in std_logic_vector((operand_width-1) downto 0);
		DMem_Din:in std_logic_vector((operand_width-1) downto 0);		
		ALU_C :in std_logic_vector((operand_width-1) downto 0);		
		WB_data_in :in std_logic_vector((operand_width-1) downto 0);		
		WB_add_in :in std_logic_vector(2 downto 0);
		instr :in std_logic_vector((operand_width-1) downto 0);
    -- outputs
		Dout:out std_logic_vector((operand_width-1) downto 0);		
		WB_data_out:out std_logic_vector((operand_width-1) downto 0);		
		WB_add_out :out std_logic_vector(2 downto 0);
		instr_out :out std_logic_vector((operand_width-1) downto 0)
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
	 signal rf_wr, pc_wr_ex : std_logic;
	 signal a1, a2, a3 : std_logic_vector(2 downto 0);
	 signal d1, d2, d3 : std_logic_vector((operand_width)-1 downto 0);
	 signal pc_in, pc_in0, pc_in1 : std_logic_vector((operand_width)-1 downto 0); --from ex stage
	 signal y2, y3, y4, y5 : std_logic_vector((operand_width)-1 downto 0);
	 

	 signal Z_flag, C_flag: std_logic;

	 signal sel1, sel2, sel3, sel4, del5 : std_logic;
	 
	 
	 signal D_Add, Din, C_to_din, WB_data_in, WB_add_in, Dout, WB_d_out, WB_a_out : std_logic_vector((operand_width)-1 downto 0);
	 signal mem_wr, dout_sel : std_logic;
	 signal RefAdd_out, RefAdd_in : std_logic_vector(15 downto 0;)
	 signal RefAdd_E : std_logic;

	 signal R1,R2,R3,R4,R5 : std_logic_vector(95 downto 0); -- pipeleine regs
	--ControlSig_R2(...), PC_R2(16), A_R2(16), B_R2(16), C_R2(16), Instr_R2(16)

	begin

	 rf: regfile port map (clock,rf_wr,PC_WR,a1,a2,a3,d3,pc_in,d1,d2,pc);
	 RAR1 : RefAdd port map(clock, RefAdd_in, RefAdd_out, RefAdd_E); 
	 i_mem: instr_mem port map (pc, instr);
	 alu1 : ADDER port map (pc,pc_in0);
	 id: Stage2_WithoutHazards port map (R1(15 downto 0),R1(31 downto 16),__,__,clock,R2(15 downto 0),R2(31 downto 16),);
	 reg_read: Register_Read port map (R2(31 downto 16), R2(15 downto 0), R2(47 downto 32), R2(63 downto 48), R2(79 downto 64), R2(95 downto 80),d1,d2, RefAdd_out, R3(15 downto 0), R3(47 downto 32), R3(63 downto 48), R3(79 downto 64),R3(95 downto 80), a1, a2, d3, a3, RefAdd_E, RefAdd_out, R3(31 downto 16), rf_wr);
	 ex: Stage4_Exec port map (R3(15 downto 0),R3(31 downto 16),R3(47 downto 32),R3(63 downto 48),R3(79 downto 64), ,clock,R4(15 downto 0),R4(31 downto 16),R4(47 downto 32),R4(63 downto 48),R4(79 downto 64), ,pc_in1,pc_wr_ex);
	 
	 m_acc: MEM_STAGE port map (clock,R4(63 downto 48),R4(47 downto 32),R4(79 downto 64),R4(79 downto 64),R4(47 downto 32),R4(31 downto 16),R5(63 downto 48),R5(79 downto 64),R5(47 downto 32),R5(31 downto 16));

	 wb: Write_Back port map (R5(31 downto 16), R5(15 downto 0),R5(47 downto 32), R5(63 downto 48), R5(79 downto 64), R5(95 downto 80), C_flag, Z_flag, d3, a3, rf_wr);
	 mux1: mux2to1 port map (pc_in0,pc_in1,pc_wr_ex,sel1);
	 mux2: mux2to1 port map ();
	 mux3: mux2to1 port map ();
	 mux4: mux2to1 port map ();

	 
	 -- IF
	 R1((operand_width-1) downto 0) <= y1;

	 -- RR

	
	 if_proc: process(clock)
	 

	 
	 end process;

end behav;