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
		
		mem_wr, dout_select: in std_logic;

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
end data_mem;

signal add: std_logic_vector((operand_width)-1);
signal d: std_logic_vector((operand_width)-1);

begin
    
	 -- can remove two addresses from memory component later
	 mem: Memory(clock,mem_wr,Dmem_Add,Dmem_Add,DMem_Din,d)
	 
	 WB_data_out <= WB_data_in;
	 WB_add_out <= WB_add_in;
	 
	 mux0: mux2to1(d(0), ALU_C(0), dout_select, Dout(0));
	 mux1: mux2to1(d(1), ALU_C(1), dout_select, Dout(1));
	 mux2: mux2to1(d(2), ALU_C(2), dout_select, Dout(2));
	 mux3: mux2to1(d(3), ALU_C(3), dout_select, Dout(3));
	 mux4: mux2to1(d(4), ALU_C(4), dout_select, Dout(4));
	 mux5: mux2to1(d(5), ALU_C(5), dout_select, Dout(5));
	 mux6: mux2to1(d(6), ALU_C(6), dout_select, Dout(6));
	 mux7: mux2to1(d(7), ALU_C(7), dout_select, Dout(7));
	 mux8: mux2to1(d(8), ALU_C(8), dout_select, Dout(8));
	 mux9: mux2to1(d(9), ALU_C(9), dout_select, Dout(9));
	 mux10: mux2to1(d(10), ALU_C(10), dout_select, Dout(10));
	 mux11: mux2to1(d(11), ALU_C(11), dout_select, Dout(11));
	 mux12: mux2to1(d(12), ALU_C(12), dout_select, Dout(12));
 	 mux13: mux2to1(d(13), ALU_C(13), dout_select, Dout(13));
	 mux14: mux2to1(d(14), ALU_C(14), dout_select, Dout(14));
	 mux15: mux2to1(d(15), ALU_C(15), dout_select, Dout(15));

    
end Structural;