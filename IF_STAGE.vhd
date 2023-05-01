library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity IF_STAGE is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      PC_in:in std_logic_vector((operand_width-1) downto 0);
		
		PC_wr:in std_logic;
		
		ALU_J:in std_logic_vector(1 downto 0);

    -- outputs
		INSTR:out std_logic_vector((operand_width-1) downto 0);
		
		NEXT_PC:out std_logic_vector((operand_width-1) downto 0)
    );

end IF_STAGE;


architecture Structural of IF_STAGE is

component instr_mem is
	generic(
		operand_width : integer:=16
        );
	port (
        clock: in std_logic;
		Mem1_add: in std_logic_vector((operand_width - 1) downto 0);
        Mem1_D: out std_logic_vector((operand_width - 1) downto 0)
        );
end component;

component ADDER is
	 generic
	 (
		 operand_width : integer := 16
	 );
	 (
      ALU_A:in std_logic_vector((operand_width-1) downto 0);
		ALU_B:in std_logic_vector((operand_width-1) downto 0); -- make this +2 in alu1
		ALU_C:out std_logic_vector((operand_width-1) downto 0)
    );
end component;

component regfile is
	generic(
		operand_width : integer:=16
        );
	port (
        clock: in std_logic;
        RF_WR: in std_logic;
		RF_A1: in std_logic_vector(2 downto 0);
		RF_A2: in std_logic_vector(2 downto 0);
		RF_A3: in std_logic_vector(2 downto 0);
        RF_D3: in std_logic_vector((operand_width - 1) downto 0);
        RF_D1: out std_logic_vector((operand_width - 1) downto 0);
        RF_D2: out std_logic_vector((operand_width - 1) downto 0)
        );
end component;

-- regfile component
-- look for hazards

--signal D : std_logic_vector(operand_width-1 downto 0);
    
begin
  adder: ADDER()
end Structural;