library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Gates.all;

entity mux4to1 is
    port (
        D0 : in std_logic;
        D1 : in std_logic;
        D2 : in std_logic;
        D3 : in std_logic;
        S : in std_logic_vector(1 downto 0);
        Y : out std_logic
    );
end mux4to1;

architecture structural of mux4to1 is
    signal a : std_logic;
    signal b : std_logic;
    signal c : std_logic;
    signal d : std_logic;

begin
    -- AND gates
    U1 : AND_2 port map (D0, not S(0), a);
    U2 : AND_2 port map (D1, S(0), b);
    U3 : AND_2 port map (D2, not S(0), c);
    U4 : AND_2 port map (D3, S(0), d);

    -- OR gates
    U5 : OR_2 port map (a, b, Y);
    U6 : OR_2 port map (c, d, Y);
end structural;