library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity ALU2 is
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

end ALU2;


architecture Structural of ALU2 is
    component FULL_ADDER is
        port (
            A : in std_logic;
            B : in std_logic;
            Cin : in std_logic;
            Sum : out std_logic;
            Cout : out std_logic
        );
    end component;
	 
	 component mux4to1 is
    port (
        D0 : in std_logic;
        D1 : in std_logic;
        D2 : in std_logic;
        D3 : in std_logic;
        S : in std_logic_vector(1 downto 0);
        Y : out std_logic
    );
	end component;
    
    signal C : std_logic_vector(operand_width-2 downto 0);
    signal S : std_logic_vector(operand_width-1 downto 0);
	 signal N : std_logic_vector(operand_width-1 downto 0);
	 signal D : std_logic_vector(operand_width-1 downto 0);
    
begin
    -- adder
	 FA0: FULL_ADDER port map (ALU_A(0), ALU_B(0), ALU_Cin, S(0), C(0));
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
    
	 --nander
	 N0: NAND_2 port map (ALU_A(0), ALU_B(0), N(0));
    N1: NAND_2 port map (ALU_A(1), ALU_B(1), N(1));
    N2: NAND_2 port map (ALU_A(2), ALU_B(2), N(2));
    N3: NAND_2 port map (ALU_A(3), ALU_B(3), N(3));
    N4: NAND_2 port map (ALU_A(4), ALU_B(4), N(4));
    N5: NAND_2 port map (ALU_A(5), ALU_B(5), N(5));
    N6: NAND_2 port map (ALU_A(6), ALU_B(6), N(6));
    N7: NAND_2 port map (ALU_A(7), ALU_B(7), N(7));
    N8: NAND_2 port map (ALU_A(8), ALU_B(8), N(8));
    N9: NAND_2 port map (ALU_A(9), ALU_B(9), N(9));
    N10: NAND_2 port map (ALU_A(10), ALU_B(10), N(10));
    N11: NAND_2 port map (ALU_A(11), ALU_B(11), N(11));
    N12: NAND_2 port map (ALU_A(12), ALU_B(12), N(12));
    N13: NAND_2 port map (ALU_A(13), ALU_B(13), N(13));
    N14: NAND_2 port map (ALU_A(14), ALU_B(14), N(14));
    N15: NAND_2 port map (ALU_A(15), ALU_B(15), N(15));
	 
	 
	 mux1: mux4to1 port map (S(0),N(0),D(0),'0',ALU_J,ALU_C(0));
	 mux2: mux4to1 port map (S(1),N(1),D(1),'0',ALU_J,ALU_C(1));
	 mux3: mux4to1 port map (S(2),N(2),D(2),'0',ALU_J,ALU_C(2));
	 mux4: mux4to1 port map (S(3),N(3),D(3),'0',ALU_J,ALU_C(3));
	 mux5: mux4to1 port map (S(4),N(4),D(4),'0',ALU_J,ALU_C(4));
	 mux6: mux4to1 port map (S(5),N(5),D(5),'0',ALU_J,ALU_C(5));
	 mux7: mux4to1 port map (S(6),N(6),D(6),'0',ALU_J,ALU_C(6));
	 mux8: mux4to1 port map (S(7),N(7),D(7),'0',ALU_J,ALU_C(7));
	 mux9: mux4to1 port map (S(8),N(8),D(8),'0',ALU_J,ALU_C(8));
	 mux10: mux4to1 port map (S(9),N(9),D(9),'0',ALU_J,ALU_C(9));
	 mux11: mux4to1 port map (S(10),N(10),D(10),'0',ALU_J,ALU_C(10));
	 mux12: mux4to1 port map (S(11),N(11),D(11),'0',ALU_J,ALU_C(11));
	 mux13: mux4to1 port map (S(12),N(12),D(12),'0',ALU_J,ALU_C(12));
	 mux14: mux4to1 port map (S(13),N(13),D(13),'0',ALU_J,ALU_C(13));
	 mux15: mux4to1 port map (S(14),N(14),D(14),'0',ALU_J,ALU_C(14));
	 mux16: mux4to1 port map (S(15),N(15),D(15),'0',ALU_J,ALU_C(15));

	 
	 ALU_Cout <= C(15);
	 
	 ALU_Z <= not S(0) and not S(1) and not S(2) and not S(3) and not S(4) and not S(5) and not S(6) and not S(7) and not S(8) and not S(9) and not S(10) and not S(11) and not S(12) and not S(13) and not S(14) and not S(15); 
    
end Structural;