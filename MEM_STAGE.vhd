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
		ControlSig_R4 : in std_logic_vector((operand_width -1) downto 0);
    -- outputs
		Dout:out std_logic_vector((operand_width-1) downto 0);		
		WB_data_out:out std_logic_vector((operand_width-1) downto 0);		
		WB_add_out :out std_logic_vector((operand_width-1) downto 0);
		instr_out :out std_logic_vector((operand_width-1) downto 0);
		ControlSig_R5 : out std_logic_vector((operand_width -1) downto 0)
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
signal ControlSig_R2_RFWR_out, ControlSig_R2_M2WR : std_logic := '0';

begin
    
	 ControlSig_R2_M2WR <= ControlSig_R4(4);
	 ControlSig_R5 <= ControlSig_R4;
	 
	 -- can remove two addresses from memory component later
	 mem: data_mem port map (clock,mem_wr,Dmem_Add,Dmem_Add,DMem_Din,dataout);
	 mux: mux2to1 port map(ALU_C,dataout,dout_select,Dout);

	 WB_data_out <= WB_data_in;
	 WB_add_out <= WB_add_in;

	 instr_out <= instr;

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
		end process;
    
end Structural;