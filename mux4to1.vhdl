library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux4to1 is
    port (A, B, C, D: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic_vector(1 downto 0));
end entity mux4to1;

architecture working of mux4to1 is
begin		
	process(A,B,C,D,S)
	begin
	if(S = "00") then
		F <= A;
	elsif(S = "01") then
		F <= B;
    elsif(S = "10") then
		F <= C;
    else
		F <= D;
	end if;
	end process;
end working;