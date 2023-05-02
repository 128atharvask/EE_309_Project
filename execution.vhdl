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
        ControlSig_R3:in std_logic_vector(1 downto 0);

   -- outputs
        PC_R4, Instr_R4:out std_logic_vector((operand_width-1) downto 0);
        A_R4, B_R4, C_R4:out std_logic_vector((operand_width-1) downto 0);
        ControlSig_R4:out std_logic_vector(1 downto 0)
   );
end Stage4_Exec;

architecture behavioural of Stage4_Exec is
    signal opcode: std_logic_vector(3 downto 0);
    signal condcode: std_logic_vector(1 downto 0);
    signal carry, zero: std_logic;
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
begin
    opcode <= Instr_R3(15 downto 12);
    condcode <= Instr_R3(1 downto 0);
    
    stage_proc:process(clock, C_out, Z_out)
    begin
        C_in <= ALU2_Cout; Z_in <= ALU2_Z;
        case opcode is
            when "0001" =>
                A_R4 <= A_R3;
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                ALU2_J <= "00";
                case condcode is
                    when "00" =>
                        ALU2_Cin <= '0';
                        C_WR <= '1';
                        Z_WR <= '1';
                        ALU2_C => C_R4;
                        Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                    when "01" =>
                        if (Z_out = '1') then
                            ALU2_Cin <= '0';
                            C_WR <= '1';
                            Z_WR <= '1';
                            ALU2_C => C_R4;
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
                            ALU2_C => C_R4;
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
                        ALU2_C => C_R4;
                        Instr_R4(15 downto 12) <= Instr_R3(15 downto 12);
                    when others => null;
                end case;
            when "0010" =>
                case condcode is
                    when "00" =>
                        ALU2_Cin <= '0';
                        ALU2_Z => zero;
                        ALU2_C => C_R4;
                    when "01" =>
                        if (zero = '1') then
                            ALU2_Cin <= '0';
                            ALU2_Z => zero;
                            ALU2_C => C_R4;
                        end if;
                    when "10" =>
                        if (carry = '1') then
                            ALU2_Cin <= '0';
                            ALU2_Z => zero;
                            ALU2_C => C_R4;
                        end if;
                    when others => null;
                end case;
            when "0000" =>
                ALU2_A <= B_R3;
                ALU2_B <= C_R3;
                ALU2_C => C_R4;
                ALU2_Cin <= ;
                ALU_J <= "00";
            when "" =>

            when others => null;
        end case;
    end process;
end architecture;