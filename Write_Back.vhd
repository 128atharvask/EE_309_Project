library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Write_Back is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
   port (PC_R5:	in std_logic_vector(15 downto 0);
			A_R5:	in std_logic_vector(15 downto 0);
			B_R5:	in std_logic_vector(15 downto 0);
			C_R5:	in std_logic_vector(15 downto 0);
			ControlSig_R5:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			
	
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0)
			);
end entity;			

architecture WB of Write_Back is


component mux4to1 is
    port (A,B,C,D: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic_vector(1 downto 0));
end component mux4to1;

component mux2to1 is
    port (A, B: in std_logic_vector(15 downto 0);
          F : out std_logic_vector(15 downto 0);
			 S : in std_logic);
end component mux2to1;

component mux2to1_3bit is
    port (A, B: in std_logic_vector(2 downto 0);
          F : out std_logic_vector(2 downto 0);
			 S : in std_logic);
end component mux2to1_3bit;


begin

muxRF_D3 : mux2to1 port map(B_R5,C_R5,RF_D3, ControlSig_R5(0));-- CHANGE SELECT LINES!!
RF_A3 <= A_R5(2 downto 0);

end architecture WB;
