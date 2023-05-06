library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_Read is
   port (clock : in std_logic;
			Instr_R2:	in std_logic_vector(15 downto 0);
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
			PC_in : out std_logic_vector(15 downto 0);
			RR_RefAdd_E : out std_logic;
			RR_RefAdd_in : out std_logic_vector(15 downto 0);
			Instr_R3	: out std_logic_vector(15 downto 0);
			PC_WR : out std_logic;
			jlr_hazard: out std_logic
			);
end entity;		

architecture RR of Register_Read is

component Complementor is
    port (X: in std_logic_vector(15 downto 0);
          Y : out std_logic_vector(15 downto 0));
end component Complementor;

signal compRF_D2 : std_logic_vector(15 downto 0):= (others => '0');

begin

C1 : Complementor port map(RF_D2,compRF_D2);

--actual mapping starts

linkproc: process(clock, Instr_R2, RF_D1, RF_D2, ControlSig_R2(2 downto 0),compRF_D2,RR_RefAdd_out,PC_R2,A_R2)		--need to check THE SENSITIVITY LIST!!
	variable R2_11_9, R2_8_6,R2_8_0,R2_5_0 : std_logic_vector(15 downto 0):= (others => '0');
	variable opcode : std_logic_vector(3 downto 0):= (others => '0');
	variable condcode : std_logic_vector(2 downto 0):= (others => '0');
begin

	--let's sign extend/complement stuff
	R2_11_9 := "0000000000000"& Instr_R2(11 downto 9);
	R2_8_6 := "0000000000000"& Instr_R2(8 downto 6);
	R2_8_0 := "0000000"& Instr_R2(8 downto 0);
	R2_5_0 := "0000000000"& Instr_R2(5 downto 0);

	--for decision making
	opcode := Instr_R2(15 downto 12);
	condcode := Instr_R2(2 downto 0);
	
	if(opcode = "0001" or opcode="0010") then
		jlr_hazard <= '0';
		PC_WR <= '0';
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
		jlr_hazard <= '0';
		PC_WR <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		B_R3 <= RF_D1;
		A_R3 <= R2_8_6;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0011") then
		jlr_hazard <= '0';
		PC_WR <= '0';
		A_R3 <= R2_11_9;
		C_R3 <= R2_8_0; -- B to C change
	
	elsif(opcode = "0100") then
		jlr_hazard <= '0';
		PC_WR <= '0';
		A_R3 <= R2_11_9;
		RF_A2 <= Instr_R2(8 downto 6);
		B_R3 <= RF_D2;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0101") then	
		jlr_hazard <= '0';
		PC_WR <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		C_R3 <= R2_5_0;
		
	elsif(opcode = "0110") then
		jlr_hazard <= '0';
		PC_WR <= '0';
		A_R3 <= R2_11_9;
		if(ControlSig_R2(2 downto 0) = "000") then 		--CHANGE CONTROL_SIG(x downto y) HERE!!!!!!!
			RF_A2 <= Instr_R2(8 downto 6);
			RR_RefAdd_in <= RF_D2;
			RR_RefAdd_E <= '1';
		else 	
			RR_RefAdd_E <= '0';
		end if;
		B_R3 <= RR_RefAdd_out;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "0111") then		
		jlr_hazard <= '0';
		PC_WR <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		A_R3 <= RF_D1;
		if(ControlSig_R2(2 downto 0) = "000") then 		--CHANGE CONTROL_SIG(x downto y) HERE!!!!!!!
			RF_A2 <= Instr_R2(8 downto 6);
			RR_RefAdd_in <= RF_D2;
			RR_RefAdd_E <= '1';
		else 	
			RR_RefAdd_E <= '0';
		end if;
		B_R3 <= RR_RefAdd_out;
		C_R3 <= R2_5_0;
	
	elsif(opcode = "1000") then	
		jlr_hazard <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;
		PC_WR <= '0';
		
	elsif(opcode = "1001") then
		jlr_hazard <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;
		PC_WR <= '0';
	
	elsif(opcode = "1010") then
		jlr_hazard <= '0';
		RF_A1 <= Instr_R2(11 downto 9);
		RF_A2 <= Instr_R2(8 downto 6);
		A_R3 <= RF_D1;
		B_R3 <= RF_D2;
		PC_R3 <= PC_R2;
		PC_WR <= '0';

	elsif(opcode = "1100") then
		jlr_hazard <= '0';
		A_R3 <= A_R2;
		PC_R3 <= PC_R2;
		PC_WR <= '0';

	elsif(opcode = "1101") then
		jlr_hazard <= '1';
		RF_A1 <= Instr_R2(8 downto 6);
		PC_WR <= '1';
		PC_in <= RF_D1;		--writing to PC
		A_R3 <= A_R2;
	
	elsif(opcode = "1111") then
		RF_A1 <= Instr_R2(11 downto 9);
		A_R3 <= RF_D1;
		PC_WR <= '0';
	
	else	-- for both 1110 and 1011
		jlr_hazard <= '0';
		PC_WR <= '0';		--just some bs to write something in else
	end if;
	
	
	

end process;

Instr_R3 <= Instr_R2;
ControlSig_R3 <= ControlSig_R2;

end architecture RR;