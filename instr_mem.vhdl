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
		  0 => "1000010110001000", -- BEQ
	     1 => "0001001010011000", -- ADD
	     2 => "0001001010011010", -- ADC
	     3 => "0001001010011001", -- ADZ
	     others => (others => '0')
	 );
	 begin
    mem_data <= Data(to_integer(unsigned(mem_add)));
	 sData <= Data;
    end process;
end architecture;