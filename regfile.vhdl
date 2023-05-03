library ieee;
use ieee.std_logic_1164.all;

entity regfile is
	generic(
		operand_width : integer:=16
        );
	port (
            clock: in std_logic;
            RF_WR: in std_logic;
            PC_WR: in std_logic;
            RF_A1: in std_logic_vector(2 downto 0);
            RF_A2: in std_logic_vector(2 downto 0);
            RF_A3: in std_logic_vector(2 downto 0);
            RF_D3: in std_logic_vector((operand_width - 1) downto 0);
            PC_in: in std_logic_vector((operand_width - 1) downto 0);
            RF_D1: out std_logic_vector((operand_width - 1) downto 0);
            RF_D2: out std_logic_vector((operand_width - 1) downto 0);
            PC_out: out std_logic_vector((operand_width - 1) downto 0)
        );
end regfile;

architecture behavioural of regfile is
    signal R1, R2, R3, R4, R5, R6, R7: std_logic_vector((operand_width - 1) downto 0);
    signal R0 : std_logic_vector((operand_width - 1) downto 0) := "0000000000000000";
begin
	PC_out <= R0;
    register_write:process(clock,R0,R1,R2,R3,R4,R5,R6,R7)
    begin
        -- Write only at the rising edge of the clock
        if(clock = '0' and clock' event) then
            if(PC_WR = '1') then
				R0 <= PC_in;
			elsif(RF_WR = '1' and RF_A3 = "000") then
				R0 <= RF_D3;
			end if;
            if(RF_WR = '1') then    
                case RF_A3 is
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
    register_read_1:process(RF_A1,R0,R1,R2,R3,R4,R5,R6,R7)
    -- Read anytime
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
    register_read_2:process(RF_A2,R0,R1,R2,R3,R4,R5,R6,R7)
    -- Read Anytime
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

-- Description
-- WRITE
-- Register is written at the falling edge of the clock.
-- RF_D3 holds the data to be written and RF_A3 the address of the corresponding register.
-- READ
-- Register can be read anytime.
-- RF_D1 and RF_D2 hold the address of the registers whose data is to be read and the data is output at RF_D1 and RF_D2 respectively.