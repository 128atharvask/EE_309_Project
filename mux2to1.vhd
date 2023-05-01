library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
    port (A, B, S : in std_logic;
          F : out std_logic);
end entity mux2to1;

architecture structural of mux2to1 is
    signal and1_out, and2_out, or_out : std_logic;

begin
    and1_gate : AND_2 port map (A, not S, and1_out);
    and2_gate : AND_2 port map (B, S, and2_out);
    or_gate : OR_2 port map (and1_out, and2_out, or_out);
    F <= or_out;
end architecture structural;