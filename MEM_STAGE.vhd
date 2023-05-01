library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity MEM_STAGE is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      Dmem_Add:in std_logic_vector((operand_width-1) downto 0);
		
		DMem_Din:in std_logic_vector((operand_width-1) downto 0);
		
		ALU_C :in std_logic_vector((operand_width-1) downto 0);
		
		WB_data_in :in std_logic_vector((operand_width-1) downto 0);
		
		WB_add_in :in std_logic_vector(2 downto 0);

    -- outputs
		Dout:out std_logic_vector((operand_width-1) downto 0);
		
		WB_data_out:out std_logic_vector((operand_width-1) downto 0);
		
		WB_add_out :in std_logic_vector(2 downto 0)
    );

end MEM_STAGE;


architecture Structural of MEM_STAGE is

component mux2to1 is
    port (A, B, S : in std_logic;
          F : out std_logic);
end component;

signal d: std_logic_vector((operand_width)-1);

begin
    
	 -- mem component instantiation
	 
	 WB_data_out <= WB_data_in;
	 WB_add_out <= WB_add_in;
	 
	 --decide abt ctrl
	 mux0: mux2to1(d(0), ALU_C(0), ctrl, Dout(0));
	 mux1: mux2to1(d(1), ALU_C(1), ctrl, Dout(1));
	 mux2: mux2to1(d(2), ALU_C(2), ctrl, Dout(2));
	 mux3: mux2to1(d(3), ALU_C(3), ctrl, Dout(3));
	 mux4: mux2to1(d(4), ALU_C(4), ctrl, Dout(4));
	 mux5: mux2to1(d(5), ALU_C(5), ctrl, Dout(5));
	 mux6: mux2to1(d(6), ALU_C(6), ctrl, Dout(6));
	 mux7: mux2to1(d(7), ALU_C(7), ctrl, Dout(7));
	 mux8: mux2to1(d(8), ALU_C(8), ctrl, Dout(8));
	 mux9: mux2to1(d(9), ALU_C(9), ctrl, Dout(9));
	 mux10: mux2to1(d(10), ALU_C(10), ctrl, Dout(10));
	 mux11: mux2to1(d(11), ALU_C(11), ctrl, Dout(11));
	 mux12: mux2to1(d(12), ALU_C(12), ctrl, Dout(12));
 	 mux13: mux2to1(d(13), ALU_C(13), ctrl, Dout(13));
	 mux14: mux2to1(d(14), ALU_C(14), ctrl, Dout(14));
	 mux15: mux2to1(d(15), ALU_C(15), ctrl, Dout(15));

    
end Structural;