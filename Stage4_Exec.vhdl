library ieee;
use ieee.std_logic_1164.all;

entity Stage4_Exec is
    generic
    (
        operand_width : integer := 16
    );
   port
    (
   -- inputs
        PC_R3, Instr_R3:in std_logic_vector((operand_width-1) downto 0);
        A_R3, B_R3, C_R3:in std_logic_vector((operand_width-1) downto 0);
        ControlSig_R3:in std_logic_vector((operand_width - 1) downto 0);
        clock:in std_logic;

   -- outputs
        PC_R4, Instr_R4:out std_logic_vector((operand_width-1) downto 0);
        A_R4, B_R4, C_R4:out std_logic_vector((operand_width-1) downto 0);
        ControlSig_R4:out std_logic_vector((operand_width - 1) downto 0);
        PC: out std_logic_vector((operand_width-1) downto 0);
        PC_WR: out std_logic
   );
end Stage4_Exec;

architecture behavioural of Stage4_Exec is
    
    component ALU_2 is
        generic
        (
            operand_width : integer := 16
        );
   
       port
        (
       -- inputs
           ALU_A:in std_logic_vector((operand_width-1) downto 0);
           ALU_B:in std_logic_vector((operand_width-1) downto 0);
           ALU_Cin:in std_logic;           
           ALU_J:in std_logic_vector(1 downto 0);   
       -- outputs
           ALU_C:out std_logic_vector((operand_width-1) downto 0);
           ALU_Cout:out std_logic;
           ALU_Z:out std_logic
       );
   
   end component ALU_2;

   component carry_flag is
   port (c_in: in std_logic;
	     c_en: in std_logic;
	     clock: in std_logic;
	     c_out: out std_logic);
   end component carry_flag;

   component zero_flag is
   port (z_in: in std_logic;
	     z_en: in std_logic;
		 clock: in std_logic;
		 z_out: out std_logic);
   end component zero_flag;
	
	signal C_in,C_WR,C_out,Z_in,Z_WR,Z_out: std_logic:= '0';
	signal ALU2_A, ALU2_B, ALU2_C, ALU3_A, ALU3_B, ALU3_C: std_logic_vector((operand_width - 1) downto 0):= (others => '0');
   signal ALU2_Cin, ALU2_Cout, ALU2_Z, ALU3_Cin, ALU3_Cout, ALU3_Z: std_logic:= '0';
   signal ALU2_J, ALU3_J: std_logic_vector(1 downto 0):= (others => '0');
begin
    
	 ControlSig_R4 <= ControlSig_R3;
	 cf: carry_flag port map(c_in=>C_in, c_en=>C_WR, clock=>clock, c_out=>C_out);
	 zf: zero_flag port map (z_in=>Z_in, z_en=>Z_WR, clock=>clock, z_out=>Z_out);
	 ALU2: ALU_2 port map(ALU_A => ALU2_A, ALU_B => ALU2_B, ALU_Cin => ALU2_Cin, ALU_J => ALU2_J, ALU_C => ALU2_C, ALU_Cout => ALU2_Cout, ALU_Z => ALU2_Z);
	 ALU3: ALU_2 port map(ALU_A => ALU3_A, ALU_B => ALU3_B, ALU_Cin => ALU3_Cin, ALU_J => ALU3_J, ALU_C => ALU3_C, ALU_Cout => ALU3_Cout, ALU_Z => ALU3_Z);
	 
    stage_proc:process(clock, C_out, Z_out, ALU2_A, ALU2_B, ALU3_A, ALU3_B,ALU3_C, ALU2_Cin, C_in, Z_in,ALU2_Cout,ALU2_Z,A_R3,B_R3,C_R3,ALU2_C,Instr_R3)
		 variable opcode: std_logic_vector(3 downto 0):= (others => '0');
		 variable condcode: std_logic_vector(1 downto 0):= (others => '0');
		 
	 begin
       opcode := Instr_R3(15 downto 12);
		 condcode := Instr_R3(1 downto 0);
		 Instr_R4(11 downto 0) <= Instr_R3(11 downto 0);
		 
		  
		  C_in <= ALU2_Cout;
		  Z_in <= ALU2_Z;
        case opcode is
            when "0001" => -- Add
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                ALU2_J <= "00";
                PC_WR <= '0';
                case condcode is
                    when "00" =>
                        ALU2_Cin <= '0';
                        C_WR <= '1';
                        Z_WR <= '1';
                        C_R4 <= ALU2_C;
                        Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                    when "01" =>
                        if (Z_out = '1') then
                            ALU2_Cin <= '0';
                            C_WR <= '1';
                            Z_WR <= '1';
                            C_R4 <= ALU2_C;
                            Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                        else
                            C_WR <= '0';
                            Z_WR <= '0';
                            ALU2_Cin <= '0';
                            Instr_R4(15 downto 12) <= "1110"; -- Do Nothing
                        end if;
                    when "10" =>
                        if (C_out = '1') then
                            ALU2_Cin <= '0';
                            C_WR <= '1';
                            Z_WR <= '1';
                            C_R4 <= ALU2_C;
                            Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                        else
                            C_WR <= '0';
                            Z_WR <= '0';
                            ALU2_Cin <= '0';
                            Instr_R4(15 downto 12) <= "1110"; -- Do Nothing
                        end if;
                    when "11" =>
                        ALU2_Cin <= C_out;
                        C_WR <= '1';
                        Z_WR <= '1';
                        C_R4 <= ALU2_C;
                        Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                    when others =>
                        C_WR <= '0';
                        Z_WR <= '0';
                end case;
            when "0010" => -- NAND
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                ALU2_J <= "01";
                C_WR <= '0';
                PC_WR <= '0';
                case condcode is
                    when "00" =>
                        ALU2_Cin <= '0';
                        Z_WR <= '1';
                        C_R4 <= ALU2_C;
                        Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                    when "01" =>
                        if (Z_out = '1') then
                            ALU2_Cin <= '0';
                            Z_WR <= '1';
                            C_R4 <= ALU2_C;
                            Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                        else
                            ALU2_Cin <= '0';
                            Z_WR <= '0';
                            Instr_R4(15 downto 12) <= "1110"; -- Do Nothing
                        end if;
                    when "10" =>
                        if (C_out = '1') then
                            ALU2_Cin <= '0';
                            Z_WR <= '1';
                            C_R4 <= ALU2_C;
                            Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                        else
                            ALU2_Cin <= '0';
                            Z_WR <= '0';
                            Instr_R4(15 downto 12) <= "1110"; -- Do Nothing
                        end if;
                    when others => null;
                end case;
            when "0000" => -- Add Immediate
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                C_R4 <= ALU2_C;
                ALU2_Cin <= '0';
                ALU2_J <= "00";
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "0011" => -- LLI
                A_R4 <= A_R3;
                B_R4 <= B_R3;
                Z_WR <= '0';
                C_WR <= '0';
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "0100" => -- LW
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                B_R4 <= ALU2_C;
                Z_WR <= '1';
                C_WR <= '0';
                ALU2_J <= "00";
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "0101" => -- SW
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                B_R4 <= ALU2_C;
                ALU2_J <= "00";
                Z_WR <= '0';
                C_WR <= '0';
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "0110" => -- LM
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                B_R4 <= ALU2_C;
                ALU2_J <= "00";
                Z_WR <= '0';
                C_WR <= '0';
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "0111" => -- SM
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                B_R4 <= ALU2_C;
                ALU2_J <= "00";
                Z_WR <= '0';
                C_WR <= '0';
                PC_WR <= '0';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when "1000" => -- BEQ
                ALU2_A <= A_R3;
                ALU2_B <= B_R3;
                ALU2_J <= "10";
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                if (ALU2_Z = '1') then
                    ALU3_A <= PC_R3;
                    ALU3_B <= "000000000" & Instr_R3(5 downto 0) & "0";
                    PC <= ALU3_C;
						  ALU3_J <= "00";
                    PC_WR <= '1';
                else 
                    PC_WR <= '0';
                end if;
                -- HAZARD HANDLING
            when "1001" => -- BLT
                ALU2_A <= A_R3;
                ALU2_B <= B_R3;
                ALU2_J <= "10";
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                if (ALU2_Cout = '1') then
                    ALU3_A <= PC_R3;
                    ALU3_B <= "000000000" & Instr_R3(5 downto 0) & "0";
                    PC <= ALU3_C;
                    ALU3_J <= "00";
                    PC_WR <= '1';
                else 
                    PC_WR <= '0';
                end if;
                -- HAZARD HANDLING
            when "1010" => -- BLE
                ALU2_A <= A_R3;
                ALU2_B <= B_R3;
                ALU2_J <= "10";
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                if ((ALU2_Cout = '1') or (ALU2_Z = '1')) then
                    ALU3_A <= PC_R3;
                    ALU3_B <= "000000000" & Instr_R3(5 downto 0) & "0";
                    PC <= ALU3_C;
                    ALU3_J <= "00";
                    PC_WR <= '1';
                else
                    PC_WR <= '0';
                end if;
                -- HAZARD HANDLING
            when "1100" => -- JAL
                ALU3_A <= PC_R3;
                ALU3_B <= "000000" & Instr_R3(8 downto 0) & "0";
                PC <= ALU3_C;
                ALU3_J <= "00";
                PC_WR <= '1';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                A_R4 <= A_R3;
                -- HAZARD HANDLING
            when "1101" => -- JLR
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                A_R4 <= A_R3;
            when "1111" => -- JRI
                ALU3_A <= A_R3;
                ALU3_B <= "000000" & Instr_R3(8 downto 0)
                 & "0";
                PC <= ALU3_C;
                ALU3_J <= "00";
                PC_WR <= '1';
                Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
            when others => null;
        end case;
    end process;
end architecture;