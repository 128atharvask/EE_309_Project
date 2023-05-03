library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Write_Back is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
   port (Instr_R5 : in std_logic_vector(15 downto 0);
			PC_R5:	in std_logic_vector(15 downto 0);
			A_R5:	in std_logic_vector(15 downto 0);
			B_R5:	in std_logic_vector(15 downto 0);
			C_R5:	in std_logic_vector(15 downto 0);
			ControlSig_R5:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			C,Z : in std_logic;
	
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0);
			RF_WR : out std_logic
			);
end entity;			

architecture WB of Write_Back is
signal opcode : std_logic_vector(3 downto 0);
signal condcode : std_logic_vector(2 downto 0);

--component mux4to1 is
--    port (A,B,C,D: in std_logic_vector(15 downto 0); 
--          F : out std_logic_vector(15 downto 0);
--			 S : in std_logic_vector(1 downto 0));
--end component mux4to1;
--
--component mux2to1 is
--    port (A, B: in std_logic_vector(15 downto 0);
--          F : out std_logic_vector(15 downto 0);
--			 S : in std_logic);
--end component mux2to1;
--
--component mux2to1_3bit is
--    port (A, B: in std_logic_vector(2 downto 0);
--          F : out std_logic_vector(2 downto 0);
--			 S : in std_logic);
--end component mux2to1_3bit;


begin

--muxRF_D3 : mux2to1 port map(B_R5,C_R5,RF_D3, ControlSig_R5(0));-- CHANGE SELECT LINES!!
--RF_A3 <= A_R5(2 downto 0);


--for decision making
opcode <= Instr_R5(15 downto 12);
condcode <= Instr_R5(2 downto 0);


linkproc: process(Instr_R5,ControlSig_R5(3),C,Z)		--need to check THE SENSITIVITY LIST!!
begin

	if(opcode = "0001" or opcode="0010") then
		if(condcode(1 downto 0) = "00" or condcode(1 downto 0) = "11") then
			RF_D3 <=	C_R5;
			RF_A3 <= A_R5(2 downto 0);
			RF_WR <= '1';
			
		elsif(condcode(1 downto 0) = "10") then
		if(C = '1') then
			RF_D3 <=	C_R5;
			RF_A3 <= A_R5(2 downto 0);		
		   RF_WR <= '1';	
		else
			RF_WR <= '0';		
		end if;
		
		elsif(condcode(1 downto 0) = "01") then
		if(Z = '1') then
			RF_D3 <=	C_R5;
			RF_A3 <= A_R5(2 downto 0);
			RF_WR <= '1';			
		else
			RF_WR <= '0';	
		end if;	
	
		else
			RF_WR <= '0';
		end if;
	
	elsif(opcode = "0000") then		
		RF_D3 <=	C_R5;
		RF_A3 <= A_R5(2 downto 0);		
		RF_WR <= '1';
	
	elsif(opcode = "0011") then
		RF_D3 <=	C_R5;
		RF_A3 <= A_R5(2 downto 0);		
		RF_WR <= '1';
	
	elsif(opcode = "0100") then 
		RF_D3 <=	C_R5;
		RF_A3 <= A_R5(2 downto 0);		
		RF_WR <= '1';
	
	elsif(opcode = "0101") then	
		RF_WR <= '0';
		
	elsif(opcode = "0110") then
		RF_D3 <=	C_R5;
		RF_A3 <= A_R5(2 downto 0);		
		RF_WR <= ControlSig_R5(3);								--CHECK THE EXACT CONTROL SIGNAL HERE!!!!!!!!!!!
	
	elsif(opcode = "0111") then		
		RF_WR <= '0';
	
	elsif(opcode = "1000") then	
		RF_WR <= '0';
		
	elsif(opcode = "1001") then
		RF_WR <= '0';
	
	elsif(opcode = "1010") then
		RF_WR <= '0';

	elsif(opcode = "1100") then
		RF_A3 <= Instr_R5(11 downto 9);
		RF_D3 <= A_R5;
		RF_WR <= '1';

	elsif(opcode = "1101") then
		RF_A3 <= Instr_R5(11 downto 9);
		RF_D3 <= A_R5;
		RF_WR <= '1';
	
	elsif(opcode = "1111") then
		RF_WR <= '0';
	
	else
		RF_WR <= '0';		--just some bs to write something in else
		
	end if;
	
	
	

end process;
end architecture WB;