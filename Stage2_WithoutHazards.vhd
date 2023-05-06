library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity Stage2_WithoutHazards is
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
end entity Stage2_WithoutHazards;

architecture behav of Stage2_WithoutHazards is
	signal ctr : integer := 0;
begin

	update_proc: process(clock)
	begin
	if(rising_edge(clock)) then
	   ctr <= ctr + 1;
   end if;
   end process;

    stage_proc:process(ctr)
	     variable opcode: std_logic_vector(3 downto 0):= (others => '0');
		  variable ct1,ct2: std_logic_vector(2 downto 0):="000";
		  variable idx: integer:=0;
    begin
        opcode := Instr_R1(15 downto 12);
		  
		--if(rising_edge(clock)) then
		  case opcode is

-------------  LM  ----------------

		  when "0110" =>
		      if(ct1="111") then
				    IF_en <= '1';
				else
				    IF_en <= '0';
				end if;
				
				if(ct1="000") then
				    ct2 := "000";
				else
				    ct2 := ct2;
				end if;
				
				Instr_R2(15 downto 12) <= Instr_R1(15 downto 12);
				Instr_R2(11 downto 9) <= ct1;
				Instr_R2(8 downto 6) <= Instr_R1(11 downto 9);
				Instr_R2(5 downto 0) <= "000" & ct2;
				
				idx := to_integer(unsigned(ct1));
				if(Instr_R1(idx)='1') then
				    ControlSig_R2_RFWR <= '1';
--					 ct2 := ct2 + 1;
					 ct2 := std_logic_vector(to_unsigned(to_integer(unsigned(ct2))+1,3));
				else
				    ControlSig_R2_RFWR <= '0';
					 ct2 := ct2;
				end if;
				
				Counter1_R2 <= ct1;
--				ct1 := ct1 + 1;
            ct1 := std_logic_vector(to_unsigned(to_integer(unsigned(ct1))+1,3));
				
				ControlSig_R2_M2WR <= '0';
				
-------------  SM  ----------------

		  when "0111" =>
		      if(ct1="111") then
				    IF_en <= '1';
				else
				    IF_en <= '0';
				end if;
				
				if(ct1="000") then
				    ct2 := "000";
				else
				    ct2 := ct2;
				end if;
				
				Instr_R2(15 downto 12) <= Instr_R1(15 downto 12);
				Instr_R2(11 downto 9) <= ct1;
				Instr_R2(8 downto 6) <= Instr_R1(11 downto 9);
				Instr_R2(5 downto 0) <= "000" & ct2;
				
				idx := to_integer(unsigned(ct1));
				if(Instr_R1(idx)='1') then
				    ControlSig_R2_M2WR <= '1';
--					 ct2 := ct2 + 1;
                ct2 := std_logic_vector(to_unsigned(to_integer(unsigned(ct2))+1,3));
				else
				    ControlSig_R2_M2WR <= '0';
					 ct2 := ct2;
				end if;
				
				Counter1_R2 <= ct1;
--				ct1 := ct1 + 1;
            ct1 := std_logic_vector(to_unsigned(to_integer(unsigned(ct1))+1,3));
				
				ControlSig_R2_RFWR <= '0';
			
-----------  OTHERS (including NOP)  ------------
		  when others=>
				Instr_R2 <= Instr_R1;
				IF_en <= '1';
				ControlSig_R2_RFWR <= '0';
				ControlSig_R2_M2WR <= '0';
				Counter1_R2 <= "000";
				ct1 := ct1;
				ct2 := ct2;
					 
		  end case;
		--end if;
	 end process;
	 
	 PC_R2 <= PC_R1;
	 A_R2 <= A_R1;
		  
end architecture;