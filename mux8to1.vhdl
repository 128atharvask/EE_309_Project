library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux8to1 is
    port (A, B, C, D, E, F, G, H: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic_vector(2 downto 0));
end entity mux4to1;

architecture working of mux4to1 is
begin		
	process(A,B,C,D,E,F,G,H,S)
	begin
	if(S = "000") then
		F <= A;
	elsif(S = "001") then
		F <= B;
    elsif(S = "010") then
		F <= C;
    elsif(S = "011") then
        F <= D;
    elsif(S = "100") then
        F <= E;
    elsif(S = "101") then
        F <= F;
    elsif(S = "110") then
        F <= G;
    else
		F <= H;
	end if;
	end process;
end working;