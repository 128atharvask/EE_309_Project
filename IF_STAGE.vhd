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

-- mem component
-- regfile component
-- look for hazards

signal D : std_logic_vector(operand_width-1 downto 0);
    
begin
    
end Structural;