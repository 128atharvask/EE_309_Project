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
begin
    
	 carry_proc:process(clock)
		  variable carry: std_logic:='0';
	 begin
        if (rising_edge(clock)) then
            if (c_en = '1') then
                carry := c_in;
				else
				    carry := carry;
            end if;
        end if;
		  c_out <= carry;
		  
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
begin

    zero_proc:process(clock)
		  variable zero: std_logic:='0';
	 begin
        if (rising_edge(clock)) then
            if (z_en = '1') then
                zero := z_in;
				else
				    zero := zero;
            end if;
        end if;
		  z_out <= zero;
		  
    end process;
end architecture;