library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADDER is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      ALU_A:in std_logic_vector((operand_width-1) downto 0);

    -- outputs
		ALU_C:out std_logic_vector((operand_width-1) downto 0)
    );

end ADDER;


architecture Structural of ADDER is
	component FULL_ADDER is
	port(a1, b1, c1: in std_logic; s, c: out std_logic);
	end component;
    
    signal C : std_logic_vector(operand_width-1 downto 0);
    signal S : std_logic_vector(operand_width-1 downto 0);
	 signal B : std_logic_vector(operand_width-1 downto 0) := "0000000000010000";
    
begin
    FA0: FULL_ADDER port map (ALU_A(0), B(0), '0', S(0), C(0)); --check syntax
    FA1: FULL_ADDER port map (ALU_A(1), B(1), C(0), S(1), C(1));
    FA2: FULL_ADDER port map (ALU_A(2), B(2), C(1), S(2), C(2));
    FA3: FULL_ADDER port map (ALU_A(3), B(3), C(2), S(3), C(3));
    FA4: FULL_ADDER port map (ALU_A(4), B(4), C(3), S(4), C(4));
    FA5: FULL_ADDER port map (ALU_A(5), B(5), C(4), S(5), C(5));
    FA6: FULL_ADDER port map (ALU_A(6), B(6), C(5), S(6), C(6));
    FA7: FULL_ADDER port map (ALU_A(7), B(7), C(6), S(7), C(7));
    FA8: FULL_ADDER port map (ALU_A(8), B(8), C(7), S(8), C(8));
    FA9: FULL_ADDER port map (ALU_A(9), B(9), C(8), S(9), C(9));
    FA10: FULL_ADDER port map (ALU_A(10), B(10), C(9), S(10), C(10));
    FA11: FULL_ADDER port map (ALU_A(11), B(11), C(10), S(11), C(11));
    FA12: FULL_ADDER port map (ALU_A(12), B(12), C(11), S(12), C(12));
    FA13: FULL_ADDER port map (ALU_A(13), B(13), C(12), S(13), C(13));
    FA14: FULL_ADDER port map (ALU_A(14), B(14), C(13), S(14), C(14));
    FA15: FULL_ADDER port map (ALU_A(15), B(15), C(14), S(15), C(15));
    
    ALU_C <= S;
    
end Structural;