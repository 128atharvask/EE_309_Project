library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IITB_RISC23 is		--DON'T FORGET TO CHANGE TOP LEVEL ENTITY AND EVEN IN ITS ARCHITECTURE!!!!!
   port (clock:	in std_logic;
			Instr_R2:	in std_logic_vector(15 downto 0);
			PC_R2:	in std_logic_vector(15 downto 0);
			A_R2:	in std_logic_vector(15 downto 0);
			B_R2:	in std_logic_vector(15 downto 0);
			C_R2:	in std_logic_vector(15 downto 0);
			ControlSig_R2:	in std_logic_vector(15 downto 0);	--later, change size of the control signals!!
			RF_D1 : in std_logic_vector(15 downto 0);
			RF_D2 : in std_logic_vector(15 downto 0);			
	
			
	
			PC_R3: out std_logic_vector(15 downto 0);
			A_R3:	out std_logic_vector(15 downto 0);
			B_R3:	out std_logic_vector(15 downto 0);
			C_R3:	out std_logic_vector(15 downto 0);
			ControlSig_R3:	out std_logic_vector(15 downto 0); ---check if needed here
			RF_A1 : out std_logic_vector(2 downto 0);
			RF_A2 : out std_logic_vector(2 downto 0);
			RF_D3 : out std_logic_vector(15 downto 0);
			RF_A3 : out std_logic_vector(2 downto 0)
			);
end entity;			

architecture RR of IITB_RISC23 is
signal R2_11_9, R2_8_6,R2_8_0,R2_5_0 : std_logic_vector(15 downto 0);
signal refaddoutt : std_logic_vector(15 downto 0);
signal compRF_D2 : std_logic_vector(15 downto 0);

component RefAdd is
	port(clk : in std_logic;
			RefAdd_in : in std_logic_vector(15 downto 0);
			RefAdd_out : out std_logic_vector(15 downto 0);
			RefAdd_E : in std_logic
			);
end component RefAdd;


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






--initialising RefAdd
RA : RefAdd port map(clock,RF_D2,refaddoutt, ControlSig_R2(0));		--change control signal!!

--let's sign extend/complement stuff
R2_11_9 <= "0000000000000"& Instr_R2(11 downto 9);
R2_8_6 <= "0000000000000"& Instr_R2(8 downto 6);
R2_8_0 <= "0000000"& Instr_R2(8 downto 0);
R2_5_0 <= "0000000000"& Instr_R2(5 downto 0);
C1 : Complementor port map(RF_D2,compRF_D2);


--actual mapping starts

PC_R3 <= PC_R2;

muxA_R3 : mux4to1 port map(R2_11_9,R2_8_6,RF_D1,"0000000000000000",A_R3, ControlSig_R2(1 downto 0));  --SELECT LINES!!

muxB_R3 : mux4to1 port map(RF_D1,R2_8_0,RF_D2,refaddoutt,B_R3, ControlSig_R2(1 downto 0));-- CHANGE SELECT LINES!!

muxC_R3 : mux4to1 port map(RF_D2,R2_5_0,compRF_D2,"0000000000000000",C_R3, ControlSig_R2(1 downto 0));-- CHANGE SELECT LINES!!

ControlSig_R3 <= ControlSig_R2; 		--check!!!!!!

muxRF_A1 : mux2to1_3bit port map(Instr_R2(11 downto 9),Instr_R2(8 downto 6),RF_A1,ControlSig_R2(0));  --CHANGE SELECT LINES!!(CONTROLSIG)

RF_A2 <= Instr_R2(8 downto 6);

RF_D3 <= A_R2;

RF_A3 <= Instr_R2(11 downto 9);

end architecture RR;