library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity ADDER is
	 generic
	 (
		 operand_width : integer := 16
	 );

    port
	 (
    -- inputs
      ALU_A:in std_logic_vector((operand_width-1) downto 0);
		
		ALU_B:in std_logic_vector((operand_width-1) downto 0); -- make this +2 in alu1

    -- outputs
		ALU_C:out std_logic_vector((operand_width-1) downto 0)
    );

end ADDER;


architecture Structural of ADDER is
    component FULL_ADDER is
        port (
            A : in std_logic;
            B : in std_logic;
            Cin : in std_logic;
            Sum : out std_logic;
            Cout : out std_logic
        );
    end component;
    
    signal C : std_logic_vector(operand_width-1 downto 0);
    signal S : std_logic_vector(operand_width-1 downto 0);
    
begin
    FA0: FULL_ADDER port map (ALU_A(0), ALU_B(0), '0', S(0), C(0));
    FA1: FULL_ADDER port map (ALU_A(1), ALU_B(1), C(0), S(1), C(1));
    FA2: FULL_ADDER port map (ALU_A(2), ALU_B(2), C(1), S(2), C(2));
    FA3: FULL_ADDER port map (ALU_A(3), ALU_B(3), C(2), S(3), C(3));
    FA4: FULL_ADDER port map (ALU_A(4), ALU_B(4), C(3), S(4), C(4));
    FA5: FULL_ADDER port map (ALU_A(5), ALU_B(5), C(4), S(5), C(5));
    FA6: FULL_ADDER port map (ALU_A(6), ALU_B(6), C(5), S(6), C(6));
    FA7: FULL_ADDER port map (ALU_A(7), ALU_B(7), C(6), S(7), C(7));
    FA8: FULL_ADDER port map (ALU_A(8), ALU_B(8), C(7), S(8), C(8));
    FA9: FULL_ADDER port map (ALU_A(9), ALU_B(9), C(8), S(9), C(9));
    FA10: FULL_ADDER port map (ALU_A(10), ALU_B(10), C(9), S(10), C(10));
    FA11: FULL_ADDER port map (ALU_A(11), ALU_B(11), C(10), S(11), C(11));
    FA12: FULL_ADDER port map (ALU_A(12), ALU_B(12), C(11), S(12), C(12));
    FA13: FULL_ADDER port map (ALU_A(13), ALU_B(13), C(12), S(13), C(13));
    FA14: FULL_ADDER port map (ALU_A(14), ALU_B(14), C(13), S(14), C(14));
    FA15: FULL_ADDER port map (ALU_A(15), ALU_B(15), C(14), S(15), C(15));
    
    ALU_C <= S;
    
end Structural;