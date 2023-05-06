library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity instr_mem is
	generic(
		operand_width : integer:=16
        );
	port (
		mem_add: in std_logic_vector((operand_width - 1) downto 0);
        mem_data: out std_logic_vector((operand_width - 1) downto 0)
        );
end instr_mem;

architecture behavioural of instr_mem is
    type memm is array (0 to 127) of std_logic_vector((operand_width - 1) downto 0);
	 signal sData: memm := (others => (others => '0'));
begin
    mem_read: process(mem_add)
        variable Data: memm := (																																																																																																																																											
--		  0 => "0001001010011000", -- ADD
--	     1 => "0001001010011010", -- ADC
--		  2 => "1000010110001000", -- BEQ
--	     3 => "0001001010011001", -- ADZ
--		  10 => "0001001010011000",
	     0 => "0011111000001001",	
		  1 => "1000110111001000",	    
		  --2 => "0001111110101000", 
--		  3 => "1000110111001111", --BEQ R6,R7, 15
--		  4 => "1001100000001111", --BLT R4,R0, 15
--		  5 => "1100111000001110", --JAL R7, 14
--		  6 => "1101111110000000",	--JLR R7,R6
		  
																																															  others => (others => '0')
																																														 );		
	 begin
    mem_data <= Data(to_integer(unsigned(mem_add)));
	 sData <= Data;
    end process;
end architecture;