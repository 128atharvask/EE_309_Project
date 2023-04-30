library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity FULL_ADDER is
	port(a1, b1, c1: in std_logic; s, c: out std_logic);
end entity FULL_ADDER;

architecture Struct of FULL_ADDER is
	signal s1, s2, s3, s4, s5, s6, s7 : std_logic;
begin
	--component instances
NAND1: NAND_2 port map (A => a1, B => b1, Y =>s1);
NAND2: NAND_2 port map (A => a1, B => s1, Y =>s2);
NAND3: NAND_2 port map (A => b1, B => s1, Y =>s3);
NAND4: NAND_2 port map (A => s2, B => s3, Y =>s4);
NAND5: NAND_2 port map (A => c1, B => s4, Y => s5);
NAND6: NAND_2 port map (A => s4, B => s5, Y => s6);
NAND7: NAND_2 port map (A => s5, B => c1, Y => s7);
	--sum
NAND8: NAND_2 port map (A => s6, B => s7, Y => s);
	--carry
NAND9: NAND_2 port map (A => s5, B => s1, Y => c);
end Struct;