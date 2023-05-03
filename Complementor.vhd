library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Complementor is
    port (X: in std_logic_vector(15 downto 0);
          Y : out std_logic_vector(15 downto 0));
end entity Complementor;

architecture doit of Complementor is
begin
Y(15) <= not(X(15));
Y(14) <= not(X(14));
Y(13) <= not(X(13));
Y(12) <= not(X(12));
Y(11) <= not(X(11));
Y(10) <= not(X(10));
Y(9) <= not(X(9));
Y(8) <= not(X(8));
Y(7) <= not(X(7));
Y(6) <= not(X(6));
Y(5) <= not(X(5));
Y(4) <= not(X(4));
Y(3) <= not(X(3));
Y(2) <= not(X(2));
Y(1) <= not(X(1));
Y(0) <= not(X(0));

end doit;