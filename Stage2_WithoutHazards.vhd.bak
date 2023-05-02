library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity Stage2_ID is
    port (PC_R1, Instr_R1: in std_logic_vector(15 downto 0);
          ct1, ct2: in std_logic_vector(2 downto 0);
          Hzd_in, clock: in std_logic;
			 
          PC_R2, Instr_R2: out std_logic_vector(15 downto 0);
			 Counter1_R2: out std_logic_vector(2 downto 0);
		    Hzd_out, IF_en: out std_logic;
			 ControlSig_R2_RFWR, ControlSig_R2_M2WR: out std_logic);
end entity Stage2_ID;

architecture behav of Stage2_ID is
    signal opcode: std_logic_vector(3 downto 0);
begin
    opcode <= Instr_R1(15 downto 12);
    PC_R2 <= PC_R1;
	 Hzd_out <= Hzd_in;
	 
    stage_proc:process(clock)
	     variable ct1,ct2: std_logic_vector(2 downto 0);
		  variable idx: integer;
		  variable prev1op, prev2op, prev3op: std_logic_vector(3 downto 0);
		  variable prev1add, prev2add, prev3add: std_logic_vector(2 downto 0);
    begin
        case opcode is
-------------  LW  ----------------
        -- No Hazards

-------------  LM  ----------------
        -- No hazards
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
				load_flag:='0';
				
-------------  SW  ----------------
        
		  when "0101" =>
		      
				if((prev1op="0100" or prev1op="0011") and prev1add=Instr_R1(11 downto 9)
				         and not Instr_R1(11 downto 9)="000") then -- LW (not PC)/LLI
				    -- Take value from 01 in stage M
				elsif((prev1op="0001" or prev1op="0010" or prev1op="0000")
				         and prev1add=Instr_R1(11 downto 9) and not Instr_R1(11 downto 9)="000") then -- A&L (not PC)
				    -- Take value from 001 in stage RR
				elsif((prev1op="0001" or prev1op="0010" or prev1op="0000")
				         and prev1add=Instr_R1(11 downto 9) and Instr_R1(11 downto 9)="000") then -- A&L (PC)
				    -- Take value from 011 in stage RR
				elsif(prev1op="0110" and Instr_R1(11 downto 9)="111") then -- LM just ended => last register 111
				    -- Take value from 01 in stage M
				else
				    -- DEFAULTS
				end if;
				
				

				if((prev2op="0100" or prev2op="0011") and prev2add=Instr_R1(11 downto 9)) then -- LW (not PC)/LLI
				    -- Take value from 010 in stage RR
				elsif((prev2op="0001" or prev2op="0010" or prev2op="0000")
				         and prev2add=Instr_R1(11 downto 9)) then
					 -- Take value from 010 in stage RR
				elsif((prev2op="0001" or prev2op="0010" or prev2op="0000")
				         and prev2add=Instr_R1(11 downto 9) and not Instr_R1(11 downto 9)="000") then -- A&L (not PC)
				    -- Take value from 010 in stage RR
				else
				    -- DEFAULTS
				end if;
				
				
					 
				if((prev3op="0100" or prev3op="0011") and prev3add=Instr_R1(11 downto 9)) then -- LW (not PC)/LLI
				    -- Take value from 011 in stage RR
				elsif
				else
				    -- DEFAULTS
				end if;
				
					 
					 
				
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
				load_flag:='0';
			
-----------  OTHERS  ------------
		  when others=>
				if(load_flag='0') then
				    Instr_R2 <= Instr_R1;
				    IF_en <= '1';
				    ControlSig_R2_RFWR <= '0';
				    ControlSig_R2_M2WR <= '0';
				    Counter1_R2 <= "000";
					     
					 
		  end case;
	 end process;
end architecture;