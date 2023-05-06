library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM_STAGE is
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

end MEM_STAGE;

architecture Structural of MEM_STAGE is

component data_mem is
	generic(
		operand_width : integer:=16
        );
	port (
        clock: in std_logic;
        M_WR: in std_logic;
		  mem_add_in: in std_logic_vector((operand_width - 1) downto 0);
		  mem_add_out: in std_logic_vector((operand_width - 1) downto 0);
        mem_data_in: in std_logic_vector((operand_width - 1) downto 0);
        mem_data_out: out std_logic_vector((operand_width - 1) downto 0)
        );
end component;

component mux2to1 is
    port (A, B : in std_logic_vector(15 downto 0);
			S: in std_logic;
          F : out std_logic_vector(15 downto 0));
end component;

signal dataout : std_logic_vector((operand_width-1) downto 0):= (others => '0');
signal dout_select, mem_wr : std_logic := '0';

begin
    
	 -- can remove two addresses from memory component later
	 mem: data_mem port map (clock,mem_wr,Dmem_Add,Dmem_Add,DMem_Din,dataout);
	 mux: mux2to1 port map(ALU_C,dataout,dout_select,Dout);

	 WB_data_out <= WB_data_in;
	 WB_add_out <= WB_add_in;

	 ControlSig_R2_RFWR_out <= ControlSig_R2_RFWR_in;

	 instr_out(11 downto 0) <= instr(11 downto 0);

	 proc: process(clock, instr,ControlSig_R2_M2WR)
    begin
			
			if(instr(15 downto 12) = "0101" or (instr(15 downto 12) = "0111" and ControlSig_R2_M2WR = '1')) then
				mem_wr <= '1';
			else
				mem_wr <= '0';
			end if;

			if(instr(15 downto 12) = "0100" or instr(15 downto 12) = "0110") then
				dout_select <= '1';
			else
				dout_select <= '0';
			end if;

			if(instr(15 downto 12) = "0100" and instr(11 downto 9) = "000") then
				loadr0_hazard <= '1';
				instr_out(15 downto 12) <= "0001";
			else
				loadr0_hazard <= '0';
				instr_out(15 downto 12) <= instr(15 downto 12);
			end if;

		-- 	if(instr(15 downto 12) = "0011") then
		-- 		if(instr(11 downto 9) == "000") then
		-- 			loadr0_hazard <= '1';
		-- 		else
		-- 			loadr0_hazard <= '0';
		-- 		end if;
		-- 	else
		-- 		loadr0_hazard <= '0';
		-- 	end if;
		
		end process;
    
end Structural;