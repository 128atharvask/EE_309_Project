library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RefAdd is
   port(clk : in std_logic;
			RefAdd_in : in std_logic_vector(15 downto 0);
			RefAdd_out : out std_logic_vector(15 downto 0);
			RefAdd_E : in std_logic
			);
end entity RefAdd;

architecture king of RefAdd is
begin
	
	process(clk)
	    variable content : std_logic_vector(15 downto 0):= (others => '0');
	begin
	if(rising_edge(clk)) then
		if(RefAdd_E = '1') then
			content := RefAdd_in;
		end if;
	end if;
	RefAdd_out <= content;
	end process;
	
end king;