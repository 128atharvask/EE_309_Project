library ieee;
use ieee.std_logic_1164.all;

entity pipe_reg is
	port (
            clock: in std_logic;
            PR_WR: in std_logic;
            Data_In: in std_logic_vector(95 downto 0);
            Data_Out: out std_logic_vector(95 downto 0)
        );
end pipe_reg;
    
architecture behavioural of pipe_reg is
		signal data: std_logic_vector(95 downto 0) := (others => '0');
begin
    Data_Out <= data;
    clock_proc: process(clock, data)
    begin
        if(clock = '1' and clock' event) then
            if(PR_WR = '1') then
                data <= Data_In;
            end if;
        end if;
    end process;
end architecture;