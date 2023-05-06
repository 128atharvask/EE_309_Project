library ieee;
use ieee.std_logic_1164.all;

entity pipe_reg is
	port (
            clock: in std_logic;
            PR_WR: in std_logic;
            Data_In: in std_logic_vector(95 downto 0);
            Hzd_in: in std_logic;
            Data_Out: out std_logic_vector(95 downto 0)
        );
end pipe_reg;
    
architecture behavioural of pipe_reg is
begin
    clock_proc: process(clock)
        variable data: std_logic_vector(95 downto 0) := (
		  31 => '1',
		  30 => '1',
		  29 => '1',
		  28 => '0',
		  others => '0');
	 begin
        if(rising_edge(clock)) then
            if(Hzd_in = '1') then
                data := Data_In(95 downto 32) & "1110" & Data_In(27 downto 0);
            elsif(PR_WR = '1') then
                data := Data_In;
            end if;
        end if;
		  Data_Out <= data;
    end process;
end architecture;