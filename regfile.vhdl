library ieee;
use ieee.std_logic_1164.all;

entity regfile is
	generic(
		operand_width : integer:=16
        );
	port (
        clock: in std_logic;
        RF_WR: in std_logic;
		RF_A1: in std_logic_vector(2 downto 0);
		RF_A2: in std_logic_vector(2 downto 0);
		RF_A3: in std_logic_vector(2 downto 0);
        RF_D3: in std_logic_vector((operand_width - 1) downto 0);
        RF_D1: out std_logic_vector((operand_width - 1) downto 0);
        RF_D2: out std_logic_vector((operand_width - 1) downto 0)
        );
end regfile;

architecture behavioural of regfile is
    signal R0, R1, R2, R3, R4, R5, R6, R7: std_logic_vector((operand_width - 1) downto 0);
    begin
        memory_write:process(clock)
        begin
            if(clock = '1' and clock' event) then
                if(RF_WR = '1') then
                    case RF_A3 is
                        when "000" =>
                            R0 <= RF_D3;
                        when "001" =>
                            R1 <= RF_D3;
                        when "010" =>
                            R2 <= RF_D3;
                        when "011" =>
                            R3 <= RF_D3;
                        when "100" =>
                            R4 <= RF_D3;
                        when "101" =>
                            R5 <= RF_D3;
                        when "110" =>
                            R6 <= RF_D3;
                        when "111" =>
                            R7 <= RF_D3;
                        when others => null;
                    end case;
                end if;
            end if;
        end process;
        memory_read_1:process(RF_A1)
        begin
            case RF_A1 is
                when "000" =>
                    RF_D1 <= R0;
                when "001" =>
                    RF_D1 <= R1;
                when "010" =>
                    RF_D1 <= R2;
                when "011" =>
                    RF_D1 <= R3;
                when "100" =>
                    RF_D1 <= R4;
                when "101" =>
                    RF_D1 <= R5;
                when "110" =>
                    RF_D1 <= R6;
                when "111" =>
                    RF_D1 <= R7;
                when others => null;
            end case;
        end process;
        memory_read_2:process(RF_A2)
        begin
            case RF_A2 is
                when "000" =>
                    RF_D2 <= R0;
                when "001" =>
                    RF_D2 <= R1;
                when "010" =>
                    RF_D2 <= R2;
                when "011" =>
                    RF_D2 <= R3;
                when "100" =>
                    RF_D2 <= R4;
                when "101" =>
                    RF_D2 <= R5;
                when "110" =>
                    RF_D2 <= R6;
                when "111" =>
                    RF_D2 <= R7;
                when others => null;
            end case;
        end process;
    end architecture;