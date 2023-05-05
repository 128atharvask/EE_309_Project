library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    signal R1, R2, R3, R4, R5, R6, R7: std_logic_vector((operand_width - 1) downto 0) := (others => '0');
    signal R0 : std_logic_vector((operand_width - 1) downto 0) := "0000000000000000";
	 signal counter : integer := 0;
	 signal incounter,in2counter : integer := 0;

	 
begin




 write_proc: process(clock)
    begin
        if (clock'event and clock = '1') then  --writing at positive clock edge
            if(RF_WR = '1') then
                if(RF_A3 = "000") then
                    R0 <= RF_D3;
                elsif(RF_A3 = "001") then
                    R1 <= RF_D3;
                elsif(RF_A3 = "010") then
                    R2 <= RF_D3;
                elsif(RF_A3 = "011") then
                    R3 <= RF_D3;
                elsif(RF_A3 = "100") then
                    R4 <= RF_D3;
                elsif(RF_A3 = "101") then
                    R5 <= RF_D3;
                elsif(RF_A3 = "110") then
                    R6 <= RF_D3;
				else null;
                end if;
            else null;
            end if;
				if(PC_WR = '1') then
					R0 <= PC_in;
                else null;
				end if;
        end if;
    end process write_proc;

    --reading from the registers
    read_proc: process(RF_A1,RF_A2,R0,R1,R2,R3,R4,R5,R6,R7)
    begin
        if(RF_A1 = "000") then
            RF_D1 <= R0;
        elsif(RF_A1 = "001") then
            RF_D1 <= R1;
        elsif(RF_A1 = "010") then
            RF_D1 <= R2;
        elsif(RF_A1 = "011") then
            RF_D1 <= R3;	
        elsif(RF_A1 = "100") then
            RF_D1 <= R4;
        elsif(RF_A1 = "101") then
            RF_D1 <= R5;
        elsif(RF_A1 = "110") then
            RF_D1 <= R6;
        elsif(RF_A1 = "111") then
            RF_D1 <= R7;
        else null;
        end if;
        --Address 2
        if(RF_A2 = "000") then
            RF_D2 <= R0;
        elsif(RF_A2 = "001") then
            RF_D2 <= R1;
        elsif(RF_A2 = "010") then
            RF_D2 <= R2;
        elsif(RF_A2 = "011") then
            RF_D2 <= R3;
        elsif(RF_A2 = "100") then
            RF_D2 <= R4;
        elsif(RF_A2 = "101") then
            RF_D2 <= R5;
        elsif(RF_A2 = "110") then
            RF_D2 <= R6;
        elsif(RF_A2 = "111") then
            RF_D2 <= R7;
        else null;
        end if;
    end process read_proc;







--	PC_out <= R0;
--    register_write:process(clock, RF_A3, RF_D3, PC_WR, PC_in) --check if Ri should be kept or not|| ,R0,R1,R2,R3,R4,R5,R6,R7,PC_in,RF_D3,RF_A3, PC_WR
--
--	 begin
--	 	counter <= counter + 1;
--
--        -- Write only at the rising edge of the clock
--        if rising_edge(clock) then
--		  incounter <= incounter + 1;
--            if(PC_WR = '1') then
--				R0 <= PC_in;
--				in2counter <= in2counter + 1;
--			elsif(RF_WR = '1' and RF_A3 = "000") then
--				R0 <= RF_D3;
--			else null;
--			end if;
--            if(RF_WR = '1') then    
--                case RF_A3 is
--                    when "001" =>
--                        R1 <= RF_D3;
--                    when "010" =>
--                        R2 <= RF_D3;
--                    when "011" =>
--                        R3 <= RF_D3;
--                    when "100" =>
--                        R4 <= RF_D3;
--                    when "101" =>
--                        R5 <= RF_D3;
--                    when "110" =>
--                        R6 <= RF_D3;
--                    when "111" =>
--                        R7 <= RF_D3;
--                    when others => null;
--                end case;
--            end if;
--        end if;
--    end process;
--	 	 
--    register_read_1:process(RF_A1,R0,R1,R2,R3,R4,R5,R6,R7)
--    -- Read anytime
--    begin
--        case RF_A1 is
--            when "000" =>
--                RF_D1 <= R0;
--            when "001" =>
--                RF_D1 <= R1;
--            when "010" =>
--                RF_D1 <= R2;
--            when "011" =>
--                RF_D1 <= R3;
--            when "100" =>
--                RF_D1 <= R4;
--            when "101" =>
--                RF_D1 <= R5;
--            when "110" =>
--                RF_D1 <= R6;
--            when "111" =>
--                RF_D1 <= R7;
--            when others => null;
--        end case;
--    end process;
--    register_read_2:process(RF_A2,R0,R1,R2,R3,R4,R5,R6,R7)
--    -- Read Anytime
--    begin
--        case RF_A2 is
--            when "000" =>
--                RF_D2 <= R0;
--            when "001" =>
--                RF_D2 <= R1;
--            when "010" =>
--                RF_D2 <= R2;
--            when "011" =>
--                RF_D2 <= R3;
--            when "100" =>
--                RF_D2 <= R4;
--            when "101" =>
--                RF_D2 <= R5;
--            when "110" =>
--                RF_D2 <= R6;
--            when "111" =>
--                RF_D2 <= R7;
--            when others => null;
--        end case;
--    end process;


end architecture;

-- Description
-- WRITE
-- Register is written at the falling edge of the clock.
-- RF_D3 holds the data to be written and RF_A3 the address of the corresponding register.
-- READ
-- Register can be read anytime.
-- RF_D1 and RF_D2 hold the address of the registers whose data is to be read and the data is output at RF_D1 and RF_D2 respectively.