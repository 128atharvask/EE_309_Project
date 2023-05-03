library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity carry_flag is
    port (c_in: in std_logic;
	       c_en: in std_logic;
			 clock: in std_logic;
			 c_out: out std_logic);
end entity carry_flag;

architecture behav of carry_flag is
    signal carry: std_logic:='0';
begin
    c_out <= carry;

    carry_write:process(clock)
    begin
        if (clock = '0' and clock' event) then
            if (c_en = '1') then
                carry <= c_in;
				else
				    carry <= carry;
            end if;
        end if;
    end process;
end architecture;





library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity zero_flag is
    port (z_in: in std_logic;
	       z_en: in std_logic;
			 clock: in std_logic;
			 z_out: out std_logic);
end entity zero_flag;

architecture behav of zero_flag is
    signal zero: std_logic:='0';
begin
    z_out <= zero;

    zero_write:process(clock)
    begin
        if (clock = '0' and clock' event) then
            if (z_en = '1') then
                zero <= z_in;
				else
				    zero <= zero;
            end if;
        end if;
    end process;
end architecture;