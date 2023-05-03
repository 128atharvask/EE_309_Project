library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity data_mem is
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

architecture behavioural of data_mem is
    type memm is array (0 to 127) of std_logic_vector((operand_width - 1) downto 0);
    signal Data: memm := (others => (others => '0'));
begin
	 mem_write: process(clock,Data)
	 begin
		 if(clock = '0' and clock' event) then
			  if(M_WR = '1') then
					Data(to_integer(unsigned(mem_add_in))) <= mem_data_in;
			  end if;
		 end if;
	 end process;
	 mem_read: process(mem_add_out)
	 begin
	 mem_data_out <= Data(to_integer(unsigned(mem_add_out)));
	 end process;
end architecture;