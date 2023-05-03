library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity Stage2_Test is
    port (PC_R1,Instr_R1,A_R1: in std_logic_vector(15 downto 0);
	       clock: in std_logic);
end entity Stage2_Test;

architecture Test of Stage2_Test is
    component Stage2_WithoutHazards is
    port (PC_R1: in std_logic_vector(15 downto 0);
	       Instr_R1: in std_logic_vector(15 downto 0);
			 A_R1: in std_logic_vector(15 downto 0);
          clock: in std_logic;
			 
          PC_R2: out std_logic_vector(15 downto 0);
			 Instr_R2: out std_logic_vector(15 downto 0);
			 A_R2: out std_logic_vector(15 downto 0);
			 Counter1_R2: out std_logic_vector(2 downto 0);
		    IF_en: out std_logic;
			 ControlSig_R2_RFWR: out std_logic;
			 ControlSig_R2_M2WR: out std_logic);
    end component Stage2_WithoutHazards;
	 
	 signal PC_R2,Instr_R2,A_R2: std_logic_vector(15 downto 0);
	 signal Counter1_R2: std_logic_vector(2 downto 0);
	 signal IF_en,ControlSig_R2_RFWR,ControlSig_R2_M2WR: std_logic;
begin
    pc: Stage2_WithoutHazards
	     port map (PC_R1 => PC_R1,
	               Instr_R1 => Instr_R1,
						A_R1 => A_R1,
						clock => clock,
						 
						PC_R2 => PC_R2,
						Instr_R2 => Instr_R2,
						A_R2 => A_R2,
						Counter1_R2 => Counter1_R2,
						IF_en => IF_en,
						ControlSig_R2_RFWR => ControlSig_R2_RFWR,
						ControlSig_R2_M2WR => ControlSig_R2_M2WR);
						
end architecture;