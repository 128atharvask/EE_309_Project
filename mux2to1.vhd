library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux2to1 is
    port (A, B: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic);
end entity mux2to1;

architecture working of mux2to1 is
begin		
	process(A,B,S)
	begin
	if(S = '0') then
		F <= A;
	else
		F <= B;
	end if;
	end process;
end working;