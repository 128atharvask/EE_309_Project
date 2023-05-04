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
signal sR0, sR1, sR2, sR3, sR4, sR5, sR6, sR7: std_logic_vector((operand_width - 1) downto 0) := (others => '0');
begin
    register_proc:process(clock,RF_A1, RF_A2, RF_A3, RF_D3, PC_WR, PC_in) --check if Ri should be kept or not|| ,R0,R1,R2,R3,R4,R5,R6,R7,PC_in,RF_D3,RF_A3, PC_WR
        variable R4, R5, R6, R7: std_logic_vector((operand_width - 1) downto 0) := (others => '0');
        variable R0 : std_logic_vector((operand_width - 1) downto 0) := "0000000000000000";
		  variable R1 : std_logic_vector((operand_width - 1) downto 0) := "0000000011100000";
		  variable R2 : std_logic_vector((operand_width - 1) downto 0) := "0000011000000001";
		  variable R3 : std_logic_vector((operand_width - 1) downto 0) := "0000000010100001";
	 begin

        -- Write only at the rising edge of the clock
        if(rising_edge(clock)) then
            if(RF_WR = '1' and RF_A3 = "000") then
		  	       R0 := RF_D3;
				elsif(PC_WR = '1') then
			       R0 := PC_in;
			   end if;
            if(RF_WR = '1') then    
                case RF_A3 is
                    when "001" =>
                        R1 := RF_D3;
                    when "010" =>
                        R2 := RF_D3;
                    when "011" =>
                        R3 := RF_D3;
                    when "100" =>
                        R4 := RF_D3;
                    when "101" =>
                        R5 := RF_D3;
                    when "110" =>
                        R6 := RF_D3;
                    when "111" =>
                        R7 := RF_D3;
                    when others => null;
                end case;
            end if;
        end if;
		  
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
		  PC_out <= R0;
		  
		  sR0 <= R0;
		  sR1 <= R1;
		  sR2 <= R2;
		  sR3 <= R3;
		  sR4 <= R4;
		  sR5 <= R5;
		  sR6 <= R6;
		  sR7 <= R7;
		  
    end process;

end architecture;

-- Description
-- WRITE
-- Register is written at the rising edge of the clock.
-- RF_D3 holds the data to be written and RF_A3 the address of the corresponding register.
-- READ
-- Register can be read anytime.
-- RF_D1 and RF_D2 hold the address of the registers whose data is to be read and the data is output at RF_D1 and RF_D2 respectively.