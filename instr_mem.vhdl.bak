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
    type memm is array (0 to 65535) of std_logic_vector((operand_width - 1) downto 0);
    signal Data: memm := (others => (others => '0'));
begin
    mem_read: process(mem_add)
    begin
    mem_data <= Data(to_integer(unsigned(mem_add)));
    end process;
end architecture;