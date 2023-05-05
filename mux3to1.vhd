library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux3to1 is
    port (pc_normal, pc_ex , pc_rr: in std_logic_vector(15 downto 0);
			 pc_wr_ex : in std_logic;
			 pc_wr_rr : in std_logic;
          F : out std_logic_vector(15 downto 0));
end entity mux3to1;

architecture wrking of mux3to1 is
begin		
	process(pc_normal,pc_ex,pc_rr,pc_wr_ex,pc_wr_rr)
	begin
	if(pc_wr_ex = '0' and pc_wr_rr = '0') then
		F <= pc_normal;
	elsif (pc_wr_ex = '1' and pc_wr_rr = '0') then
		F <= pc_ex;
	elsif (pc_wr_ex = '0' and pc_wr_rr = '1') then 
		F <= pc_rr;
	else 
		F <= pc_ex;
	end if;
	end process;
end wrking;