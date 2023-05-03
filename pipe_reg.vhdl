entity pipe_reg is
	port (
            clock: in std_logic;
            PR_WR: in std_logic;
            Data_In: in std_logic_vector(95 downto 0);
            Data_Out: in std_logic_vector(95 downto 0)
        );
end pipe_reg;
    signal data: std_logic_vector(95 downto 0) := (others => '0');
architecture behavioural of pipe_reg is
    Data_Out <= data;
    clock_proc: process(clock, data)
    begin
        if(clock = '0' and clock' event) then
            if(PR_WR = '1') then
                data <= Data_In;
            end if;
        end if;
    end process;
end architecture;