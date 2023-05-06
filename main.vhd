library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
				reset: in std_logic;
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

--	component ADDER is
--		generic
--		(
--			operand_width : integer := 16
--		);
--	   port
--		(
--		 ALU_A:in std_logic_vector((operand_width-1) downto 0);
--		   ALU_C:out std_logic_vector((operand_width-1) downto 0)
--	   );
--   end component;


component ALU_2 is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      ALU_A:in std_logic_vector((operand_width-1) downto 0);
		
		ALU_B:in std_logic_vector((operand_width-1) downto 0);
		
		ALU_Cin:in std_logic;
		
		ALU_J:in std_logic_vector(1 downto 0);

    -- outputs
		ALU_C:out std_logic_vector((operand_width-1) downto 0);
		
		ALU_Cout:out std_logic;
		
		ALU_Z:out std_logic
    );

end component;



	 
	component Stage2_WithoutHazards is
		port (PC_R1: in std_logic_vector(15 downto 0);
		Instr_R1: in std_logic_vector(15 downto 0);
		  A_R1: in std_logic_vector(15 downto 0);
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
		port (clock : in std_logic;
			Instr_R2:	in std_logic_vector(15 downto 0);
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
			PC_in : out std_logic_vector(15 downto 0);
			RR_RefAdd_E : out std_logic;
			RR_RefAdd_in : out std_logic_vector(15 downto 0);
			Instr_R3	: out std_logic_vector(15 downto 0);
			PC_WR : out std_logic;
			jlr_hazard: out std_logic
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
        ControlSig_R3:in std_logic_vector((operand_width - 1) downto 0);
        clock:in std_logic;

   -- outputs
        PC_R4, Instr_R4:out std_logic_vector((operand_width-1) downto 0);
        A_R4, B_R4, C_R4:out std_logic_vector((operand_width-1) downto 0);
        ControlSig_R4:out std_logic_vector((operand_width - 1) downto 0);
        PC: out std_logic_vector((operand_width-1) downto 0);
        PC_WR: out std_logic;
        ALU_out: out std_logic_vector((operand_width-1) downto 0);
        branch_hazard: out std_logic
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
		WB_add_in :in std_logic_vector((operand_width-1) downto 0);
		instr :in std_logic_vector((operand_width-1) downto 0);
		ControlSig_R2_M2WR : in std_logic;
		ControlSig_R2_RFWR_in : in std_logic;
    -- outputs
		Dout:out std_logic_vector((operand_width-1) downto 0);		
		WB_data_out:out std_logic_vector((operand_width-1) downto 0);		
		WB_add_out :out std_logic_vector((operand_width-1) downto 0);
		instr_out :out std_logic_vector((operand_width-1) downto 0);
		ControlSig_R2_RFWR_out : out std_logic;
		loadr0_hazard: out std_logic
    );
   
   end component;

	component Write_Back is		
		port (clock : in std_logic;
		Instr_R5 : in std_logic_vector(15 downto 0);
		PC_R5:	in std_logic_vector(15 downto 0);
		A_R5:	in std_logic_vector(15 downto 0);
		B_R5:	in std_logic_vector(15 downto 0);
		C_R5:	in std_logic_vector(15 downto 0);
		ControlSig_R5:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!

		RF_D3 : out std_logic_vector(15 downto 0);
		RF_A3 : out std_logic_vector(2 downto 0);
		RF_WR_out : out std_logic
		);
	end component;

	component mux2to1 is
    port (A, B: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic);
	end component;	
	
	component pipe_reg is
	port (	
			clock: in std_logic;
			PR_WR: in std_logic;
			Data_In: in std_logic_vector(95 downto 0);
			Hzd_in: in std_logic;
			Data_Out: out std_logic_vector(95 downto 0)
        );
	end component;

	
	component mux4to1 is
		port (A, B, C, D: in std_logic_vector(15 downto 0);
			F : out std_logic_vector(15 downto 0);
				S : in std_logic_vector(1 downto 0));
	end component;


	 
	 signal instr : std_logic_vector((operand_width)-1 downto 0)  := (others => '0');
	 signal pc : std_logic_vector((operand_width)-1 downto 0)     := (others => '0');
	 signal rf_wr, pc_wr_ex,pc_wr_rr : std_logic := '0';
	 signal a1, a2, a3 : std_logic_vector(2 downto 0) := (others => '0');
	 signal d1, d2, d3 : std_logic_vector((operand_width)-1 downto 0) := (others => '0');
	 signal pc_in, pc_in0, pc_in_exec, pc_in_rr : std_logic_vector((operand_width)-1 downto 0) := (others => '0'); --from ex stage
	 signal y2, y3, y4, y5 : std_logic_vector((operand_width)-1 downto 0) := (others => '0');
	 

	 signal Z_flag, C_flag: std_logic := '0';

	 signal sel1, sel2, sel3, sel4, del5 : std_logic := '0';
	 
	 
	 signal D_Add, Din, C_to_din, WB_data_in, WB_add_in, WB_d_out, WB_a_out : std_logic_vector((operand_width)-1 downto 0) := (others => '0');
	 signal mem_wr : std_logic := '0';
	 signal RefAdd_out, RefAdd_in : std_logic_vector(15 downto 0) := (others => '0');
	 signal RefAdd_E : std_logic := '0';
	 signal if_en : std_logic := '0';

	 signal R1in,R2in,R3in,R4in,R5in : std_logic_vector(95 downto 0) := (others => '0'); -- temp pipe regs
	 signal R1out,R2out,R3out,R4out,R5out : std_logic_vector(95 downto 0) := (others => '0'); -- temp pipe regs
	 signal PR1 : std_logic_vector(95 downto 0):= (others => '0'); -- pipeline regs
	--ControlSig_R2(...), PC_R2(16), A_R2(16), B_R2(16), C_R2(16), Instr_R2(16)
	
	signal PR_Write : std_logic := '1';
	signal HzdRR, HzdEX, Mem_hzd, load_hzd, Hzd_comb1, Hzd_comb2, Hzd_comb5: std_logic := '0';
	signal pc_en, Hzd_comb3, Hzd_comb4 : std_logic := '1';

	
	 -- for data forwarding
	signal sA_R3, sB_R3: std_logic_vector(15 downto 0);
	signal fwd_sel0, fwd_sel1, fwd_sel2, fwd_sel3 : std_logic_vector(1 downto 0) := "00";
	signal fwd_sel4 : std_logic := '0';

	-- data to be forwarded
	signal ALU_out_exec: std_logic_vector(15 downto 0) := "0000000000000000";
	signal allones: std_logic_vector(15 downto 0):= "1111111111111111";
	signal sC_R3, sA_R4: std_logic_vector(15 downto 0) := "0000000000000000";

	begin
	 
	 Hzd_comb1 <= ((HzdRR or HzdEX) or Mem_hzd) or reset;
	 Hzd_comb2 <= ((HzdEX or load_hzd) or Mem_hzd) or reset;
	 Hzd_comb3 <= (if_en and (not load_hzd)) or Mem_hzd;
	 Hzd_comb4 <= (not load_hzd) or Mem_hzd;
	 Hzd_comb5 <= Mem_hzd or reset;
	 pc_en <= ((if_en or pc_wr_ex or pc_wr_rr) and (not load_hzd)) or Mem_hzd;
	 
	 PReg1 : pipe_reg port map (clock, Hzd_comb3, R1in, Hzd_comb1, R1out);
	 PReg2 : pipe_reg port map (clock, Hzd_comb4, R2in, Hzd_comb1, R2out);
	 PReg3 : pipe_reg port map (clock, PR_Write, R3in, Hzd_comb2, R3out);
	 PReg4 : pipe_reg port map (clock, PR_Write, R4in, Hzd_comb5, R4out);
	 PReg5 : pipe_reg port map (clock, PR_Write, R5in, reset, R5out);
	 
	 rf: regfile port map (clock,reset,rf_wr,pc_en,a1,a2,a3,d3,pc_in,d1,d2,pc);
	 RAR1 : RefAdd port map(clock, RefAdd_in, RefAdd_out, RefAdd_E); 
	 i_mem: instr_mem port map (pc, instr);
	 --alu1 : ADDER port map (pc,pc_in0);
	 alu1 : ALU_2 port map(pc, "0000000000000001",'0',"00", pc_in0);
	 id: Stage2_WithoutHazards port map (R1out(15 downto 0),R1out(31 downto 16),R1out(47 downto 32),clock,R2in(15 downto 0),R2in(31 downto 16),R2in(47 downto 32),R2in(82 downto 80),if_en,R2in(83),R2in(84));
	 reg_read: Register_Read port map (clock, R2out(31 downto 16), R2out(15 downto 0), R2out(47 downto 32), R2out(63 downto 48), R2out(79 downto 64), R2out(95 downto 80),d1,d2, RefAdd_out, R3in(15 downto 0), sA_R3, sB_R3, sC_R3,R3in(95 downto 80), a1, a2, pc_in_rr, RefAdd_E, RefAdd_out, R3in(31 downto 16), pc_wr_rr, HzdRR);
	 ex: Stage4_Exec port map (R3out(15 downto 0),R3out(31 downto 16),R3out(47 downto 32),R3out(63 downto 48),R3out(79 downto 64), R3out(95 downto 80),clock,R4in(15 downto 0),R4in(31 downto 16),sA_R4,R4in(63 downto 48),R4in(79 downto 64), R4in(95 downto 80),pc_in_exec,pc_wr_ex, ALU_out_exec, HzdEX);
	 --NEED TO CHECK R3 & R4(87 downto 86) in one of the inputs to Exec Stage
	 m_acc: MEM_STAGE port map (clock,R4out(63 downto 48),R4out(47 downto 32),R4out(79 downto 64),R4out(79 downto 64),R4out(47 downto 32),R4out(31 downto 16),R4out(84),R4out(83),R5in(63 downto 48),R5in(79 downto 64),R5in(47 downto 32),R5in(31 downto 16),R5in(83), Mem_hzd);

	 wb: Write_Back port map (clock, R5out(31 downto 16), R5out(15 downto 0),R5out(47 downto 32), R5out(63 downto 48), R5out(79 downto 64), R5out(95 downto 80), d3, a3, rf_wr);
	--  mux0: mux3to1 port map (pc_in0, pc_in_exec, pc_in_rr, pc_wr_ex,pc_wr_rr, pc_in);
	--  mux0: mux8to1 port map(pc_in0, pc_in_exec, pc_in_rr, R5in(63 downto 48), ALU_out_exec, allones, allones, allones, pc_in, fwd_sel0);
     mux0: mux4to1 port map(pc_in0, pc_in_exec, pc_in_rr, R5in(63 downto 48), pc_in, fwd_sel0);
	 
	 -- IF
	 R1in(15 downto 0) <= pc;
	 R1in(31 downto 16) <= instr;
	 R1in(47 downto 32) <= pc;


	 --hazard mitigation in RR
	 mux1: mux4to1 port map(sB_R3, ALU_out_exec, R5in(63 downto 48), d3, R3in(63 downto 48), fwd_sel1);	-- usual RR_out, from alu_c, from d_out of mem, from WB
	 mux2: mux4to1 port map(sC_R3, ALU_out_exec, R5in(63 downto 48), d3, R3in(79 downto 64), fwd_sel2);
	 mux3: mux4to1 port map(sA_R3, R5in(63 downto 48), d3, ALU_out_exec, R3in(47 downto 32), fwd_sel3);
	 mux4: mux2to1 port map(sA_R4, R5in(63 downto 48), R4in(47 downto 32), fwd_sel4);
	 -- think abt fwd_sel
	
	-- 31 downto 16
	-- 31-28, 27-25, 24-22, 21-19
	-- OPCODE, dest,   RA,   RB
	-- ulte order mein assign kiya he start mein
	
	select_proc: process(clock, R2out,R3out,R4out,R5out, ALU_out_exec, pc_in_exec, fwd_sel0, fwd_sel1, fwd_sel2, fwd_sel3, fwd_sel4)
		begin
		--------  A&L  --------
		if(R2out(31 downto 30) = "00" and not(R2out(29 downto 28) = "11")
			and (R3out(31 downto 28) = "0100" or R3out(31 downto 28) = "0110")
			and (R2out(24 downto 22) = R3out(27 downto 25) or R2out(21 downto 19) = R3out(27 downto 25))) then
			load_hzd <= '1';
			fwd_sel1 <= "00";
			fwd_sel2 <= "00";
			fwd_sel3 <= "00";
		elsif(R2out(31 downto 30) = "00" and not(R2out(29 downto 28) = "11")) then
			load_hzd <= '0';
			
			-- fwd_sel1
			if(R2out(24 downto 22) = R3out(27 downto 25) and not
				(R3out(31 downto 28) = "0101" or R3out(31 downto 28) = "0111")) then
				fwd_sel1 <= "01";
			elsif(R2out(24 downto 22) = R4out(27 downto 25) and not
				(R4out(31 downto 28) = "0101" or R4out(31 downto 28) = "0111")) then
				fwd_sel1 <= "10";
			elsif(R2out(24 downto 22) = R5out(27 downto 25) and not
				(R5out(31 downto 28) = "0101" or R5out(31 downto 28) = "0111")) then
				fwd_sel1 <= "11";
			else
				fwd_sel1 <= "00";
			end if;

			-- fwd_sel2
			if(R2out(21 downto 19) = R3out(27 downto 25) and not
				(R3out(31 downto 28) = "0101" or R3out(31 downto 28) = "0111")) then
				fwd_sel2 <= "01";
			elsif(R2out(21 downto 19) = R4out(27 downto 25) and not
				(R4out(31 downto 28) = "0101" or R4out(31 downto 28) = "0111")) then
				fwd_sel2 <= "10";
			elsif(R2out(21 downto 19) = R5out(27 downto 25) and not
				(R5out(31 downto 28) = "0101" or R5out(31 downto 28) = "0111")) then
				fwd_sel2 <= "11";
			else
				fwd_sel2 <= "00";
			end if;

			fwd_sel3 <= "00";
		
		--------  Store  --------
		elsif(R2out(31 downto 28) = "0101" or R2out(31 downto 28) = "0111") then
			load_hzd <= '0';

			if(R2out(27 downto 25) = R4out(27 downto 25) and not
				(R4out(31 downto 28) = "0101" or R4out(31 downto 28) = "0111")) then
				fwd_sel3 <= "01";
			elsif(R2out(27 downto 25) = R5out(27 downto 25) and not
				(R5out(31 downto 28) = "0101" or R5out(31 downto 28) = "0111")) then
				fwd_sel3 <= "10";
			elsif(R2out(27 downto 25) = R3out(27 downto 25) and R3out(31 downto 30) = "00") then
				fwd_sel3 <= "11";
			else
				fwd_sel3 <= "00";
			end if;

			fwd_sel1 <= "00";
			fwd_sel2 <= "00";
		
		else
			load_hzd <= '0';
			fwd_sel1 <= "00";
			fwd_sel2 <= "00";
			fwd_sel3 <= "00";
		end if;

		--------  SW <- LW  --------
		if((R3out(31 downto 28) = "0101" or R3out(31 downto 28) = "0111") and
			(R4out(31 downto 28) = "0100" or R4out(31 downto 28) = "0110")) then
			fwd_sel4 <= '1';
		else
			fwd_sel4 <= '0';
		end if;

		--------  PC_Sel  --------
		if(Mem_hzd = '1') then -- Load R0 at Mem
			fwd_sel0 <= "11";
		elsif(pc_wr_ex = '1') then -- A&L R0 or BEQ/JMP at exec
			fwd_sel0 <= "01";
		elsif(pc_wr_rr = '1') then -- JLR at RR
			fwd_sel0 <= "10";
		-- elsif(A&L at exec) then
		-- 	fwd_sel0 <= "100";
		else
			fwd_sel0 <= "00";
		end if;
	end process;
end behav;