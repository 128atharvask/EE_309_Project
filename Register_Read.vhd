library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_Read is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
   port (Instr_R2:	in std_logic_vector(15 downto 0);
			PC_R2:	in std_logic_vector(15 downto 0);
			A_R2:	in std_logic_vector(15 downto 0);
			B_R2:	in std_logic_vector(15 downto 0);
			C_R2:	in std_logic_vector(15 downto 0);
			ControlSig_R2:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			RF_D1 : in std_logic_vector(15 downto 0);
			RF_D2 : in std_logic_vector(15 downto 0);			
			RR_RefAdd_out : in std_logic_vector(15 downto 0);
			
	
			PC_R3: out std_logic_vector(15 downto 0);
			A_R3:	out std_logic_vector(15 downto 0);
			B_R3:	out std_logic_vector(15 downto 0);
			C_R3:	out std_logic_vector(15 downto 0);
			ControlSig_R3:	out std_logic_vector(15 downto 0); ---check if needed here
			RF_A1 : out std_logic_vector(2 downto 0);
			RF_A2 : out std_logic_vector(2 downto 0);
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0);
			RR_RefAdd_E : out std_logic;
			RR_RefAdd_in : out std_logic_vector(15 downto 0);
			Instr_R3	: out std_logic_vector(15 downto 0);
			RF_WR : out std_logic
			);
end entity;			

architecture RR of Register_Read is
signal R2_11_9, R2_8_6,R2_8_0,R2_5_0 : std_logic_vector(15 downto 0);
signal compRF_D2 : std_logic_vector(15 downto 0);
signal opcode : std_logic_vector(3 downto 0);
signal condcode : std_logic_vector(2 downto 0);
signal decisioncode : std_logic_vector(6 downto 0);

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

component Complementor is
    port (X: in std_logic_vector(15 downto 0);
          Y : out std_logic_vector(15 downto 0));
end component Complementor;

begin

--Instr_R2(11-9) → RF_A3
--A_R2 → RF_D3
--Instr_R2(8-6),(5-3) →  RF_A1,A2
----------------------
--inputs to A_R3:
--Instr_R2(11-9)  → SE16 →  A_R3
--Instr_R2(8-6) → SE3 → A_R3
--RF_D1 → A_R3
--
--inputs to B_R3:
--RF_D1
--Instr_R2(8-0) → SE9 → B_R3
--RF_D2 → B_R3
--RefAdd → B_R3 //Mem loc to write
--
--inputs to C_R3:
--RF_D2 →  C_R3
--Instr_R2(5-0)  → SE6 →  C_R3
--RF_D2 → COMP→ C_R3
--
--inputs to PC_R3:
--PC_R2 → PC_R3
--
--
--inputs to RefAdd:
--RF_D2 → RefAdd







--let's sign extend/complement stuff
R2_11_9 <= "0000000000000"& Instr_R2(11 downto 9);
R2_8_6 <= "0000000000000"& Instr_R2(8 downto 6);
R2_8_0 <= "0000000"& Instr_R2(8 downto 0);
R2_5_0 <= "0000000000"& Instr_R2(5 downto 0);
C1 : Complementor port map(RF_D2,compRF_D2);

--for decision making
opcode <= Instr_R2(15 downto 12);
condcode <= Instr_R2(2 downto 0);
decisioncode <= opcode & condcode;

--actual mapping starts

linkproc: process(Instr_R2)		--need to check THE SENSITIVITY LIST!!
begin

--	if(decisioncode = "0001000" or decisioncode = "0001001" or decisioncode = "0001010" or decisioncode = "0001011" or decisioncode = "0010000" or decisioncode="0010001" or decisioncode="0010010") then
--	RF_A1 <= Instr_R2(8 downto 6);
--	RF_A2 <= Instr_R2(5 downto 3);
--	A_R3 <= R2_11_9;
--	B_R3 <= RF_D1;
--	C_R3 <= RF_D2;
--	
--	elsif(decisioncode = "0001100" or decisioncode = "0001101" or decisioncode = "0001110" or decisioncode = "0001111" or decisioncode = "0010100" or decisioncode="0010101" or decisioncode="0010110") then
--	RF_A1 <= Instr_R2(8 downto 6);
--	RF_A2 <= Instr_R2(5 downto 3);
--	A_R3 <= R2_11_9;
--	B_R3 <= RF_D1;
--	C_R3 <= compRF_D2;	
--	
--	elsif(decisioncode = "0000")then
--	
--	end if;

	if(opcode = "0001" or opcode="0010") then
		if(condcode(2) = '0')then
			RF_A1 <= Instr_R2(8 downto 6);
			RF_A2 <= Instr_R2(5 downto 3);
			A_R3 <= R2_11_9;
			B_R3 <= RF_D1;
			C_R3 <= RF_D2;
		else
			RF_A1 <= Instr_R2(8 downto 6);
			RF_A2 <= Instr_R2(5 downto 3);
			A_R3 <= R2_11_9;
			B_R3 <= RF_D1;
			C_R3 <= compRF_D2;
		end if;
	
	elsif(opcode = "0000") then		
		RF_A1 <= Instr_R2(11 downto 9);
		B_R3 <= RF_D1;
		A_R3 <= R2_8_6;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0011") then
		A_R3 <= R2_11_9;
		B_R3 <= R2_8_0;
	
	elsif(opcode = "0100") then 
		A_R3 <= R2_11_9;
		B_R3 <= RF_D2;
		RF_A2 <= Instr_R2(8 downto 6);
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0101") then	
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		C_R3 <= R2_5_0;
		
	elsif(opcode = "0110") then
		A_R3 <= R2_11_9;
		if(ControlSig_R2(2 downto 0) = "000") then 		--CHANGE CONTROL_SIG(x downto y) HERE!!!!!!!
			RF_A2 <= Instr_R2(8 downto 6);
			RR_RefAdd_in <= RF_D2;
		end if;
		B_R3 <= RR_RefAdd_out;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0111") then		
		RF_A1 <= Instr_R2(11 downto 9);
		A_R3 <= RF_D1;
		if(ControlSig_R2(2 downto 0) = "000") then 		--CHANGE CONTROL_SIG(x downto y) HERE!!!!!!!
			RF_A2 <= Instr_R2(8 downto 6);
			RR_RefAdd_in <= RF_D2;
			RR_RefAdd_E <= '1';
		end if;
		B_R3 <= RR_RefAdd_out;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "1000") then	
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;
		
	elsif(opcode = "1001") then
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;
	
	elsif(opcode = "1010") then
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;

	elsif(opcode = "1100") then
		RF_A3 <= Instr_R2(11 downto 9);
		RF_D3 <= A_R2;
		RF_WR <= '1';
		PC_R3 <= PC_R2;

	elsif(opcode = "1101") then
		RF_A1 <= Instr_R2(8 downto 6);
		RF_WR <= '1';
		RF_D3 <= RF_D1;		--writing to PC
		RF_A3 <= "000";		--writing to PC
	
	elsif(opcode = "1111") then
		RF_A1 <= Instr_R2(11 downto 9);
		A_R3 <= RF_D1;
	
	else
		RF_WR <= '0';		--just some bs to write something in else
	end if;
	
	
	

end process;
Instr_R3 <= Instr_R2;

--PC_R3 <= PC_R2;
--
--muxA_R3 : mux4to1 port map(R2_11_9,R2_8_6,RF_D1,"0000000000000000",A_R3, ControlSig_R2(1 downto 0));  --SELECT LINES!!
--
--muxB_R3 : mux4to1 port map(RF_D1,R2_8_0,RF_D2,RR_RefAdd_out,B_R3, ControlSig_R2(1 downto 0));-- CHANGE SELECT LINES!!
--
--muxC_R3 : mux4to1 port map(RF_D2,R2_5_0,compRF_D2,"0000000000000000",C_R3, ControlSig_R2(1 downto 0));-- CHANGE SELECT LINES!!
--
--ControlSig_R3 <= ControlSig_R2; 		--check!!!!!!
--
--muxRF_A1 : mux2to1_3bit port map(Instr_R2(11 downto 9),Instr_R2(8 downto 6),RF_A1,ControlSig_R2(0));  --CHANGE SELECT LINES!!(CONTROLSIG)
--
--RF_A2 <= Instr_R2(8 downto 6);
--
--RF_D3 <= A_R2;
--
--RF_A3 <= Instr_R2(11 downto 9);
--
--RR_RefAdd_in <= RF_D2;
--
--Instr_R3 <= Instr_R2;

end architecture RR;