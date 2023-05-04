library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- The Arithmetic and the Logical Unit of IITB-CPU
-- See ALU Documentation in the Report for details regarding inputs and outputs of ALU

entity ALU_2 is
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

end ALU_2;


architecture behavioural of ALU_2 is

    -- Ripple Adder Implementation
    function add1(A: in std_logic_vector((operand_width-1) downto 0);
                 B: in std_logic_vector((operand_width-1) downto 0))
    
        return std_logic_vector is
            variable sum: std_logic_vector((operand_width-1) downto 0):= (others => '1');
            variable carry: std_logic_vector((operand_width-1) downto 0) := (others => '0');
    begin
          L1: for i in 0 to (operand_width-1) loop
                if i = 0 then 
                    sum(i) := A(i) xor B(i);
                    carry(i) := A(i) and B(i);
                else
                    sum(i) := A(i) xor B(i) xor carry(i-1);
                    carry(i) := (A(i) and B(i)) or (carry(i-1) and (A(i) or B(i)));
                end if;
            end loop L1;
        return carry((operand_width-1)) & sum;
    end add1;

    -- Bitwise NAND implementation
    function nander(A: in std_logic_vector((operand_width-1) downto 0);
		B: in std_logic_vector((operand_width-1) downto 0))
	    return std_logic_vector is
		    variable bitwise_nand : std_logic_vector((operand_width-1) downto 0);
	begin
		L2: for i in (operand_width-1) downto 0 loop
				bitwise_nand(i) := (A(i) nand B(i));
			end loop L2;
		return bitwise_nand;
	end nander;
	
	
	--subtraction
	--SUB
	function sub(A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
		variable diff : std_logic_vector(operand_width downto 0):= (others=>'0');
		variable carry : std_logic_vector(operand_width-1 downto 0):= (others=>'0');
		begin
		L3: for i in 0 to (operand_width-1) loop
			if i = 0 then
				diff(i) := A(i) xor B(i) xor '0';
				carry(i) := A(i) and (not B(i));
			else
				diff(i) := A(i) xor B(i) xor carry(i-1);
				carry(i) := (not(B(i)) and carry(i-1)) or (A(i) and carry(i-1)) or (A(i) and not(B(i)));
			end if;
		end loop L3;
		diff(operand_width) := carry(operand_width-1);
		return diff;
	end sub;	
	
begin

    
	 add_proc:process(ALU_J, ALU_A, ALU_B, ALU_Cin)
		 variable ALU_CND : std_logic_vector(1 downto 0) := "00";
		 variable sum: std_logic_vector((operand_width-1) downto 0) := "0000000000000001";
		 variable full_add: std_logic_vector((operand_width) downto 0) := "00000000000000000";
		 variable carry: std_logic := '0';
		 variable bitwise_nand: std_logic_vector((operand_width-1) downto 0) := "0000000000000000";
		 variable sz_int: std_logic := '0'; -- Signal for storing computational Zero output, Z_int
		 variable sub_result : std_logic_vector(operand_width downto 0);
	 begin


            -- Case Addition
            if(ALU_J = "00") then
					
                full_add := add1(ALU_A, ALU_B);
                carry := full_add((operand_width));
                sum := full_add((operand_width-1) downto 0);
                ALU_C <= sum;
                if(sum = "0000000000000000") then
                    sz_int := '1';
                else
                    sz_int := '0';
                end if;

                if(ALU_CND = "00") then
                    ALU_Cout <= carry;
                    ALU_Z <= sz_int;
                elsif(ALU_CND = "10") then
                    ALU_Cout <= carry;
                    ALU_Z <= sz_int;
                elsif(ALU_CND = "01") then
                    ALU_Cout <= carry;
                    ALU_Z <= sz_int;
                else
                    ALU_Cout <= carry;
                    ALU_Z <= sz_int;
                end if;
            
            -- Case NAND
            elsif(ALU_J = "01") then -- NAND
                bitwise_nand := nander(ALU_A, ALU_B);
                ALU_C <= bitwise_nand;
                if(bitwise_nand = "0000000000000000") then
                    sz_int := '1';
                else
                    sz_int := '0';
                end if;
                ALU_Cout <= ALU_Cin;
                if(ALU_CND = "00") then
                    ALU_Z <= sz_int;
                elsif(ALU_CND = "10") then
                    ALU_Z <= sz_int;
                elsif(ALU_CND = "01") then
                    ALU_Z <= sz_int;
                else
                    ALU_Z <= sz_int;
                end if;

					 
				  --subtraction
				 elsif(ALU_J = "10") then
					sub_result := sub(ALU_B,ALU_A);
					ALU_C <= sub_result((operand_width-1) downto 0);
					ALU_Cout <= sub_result(operand_width);
					if(sub_result((operand_width-1) downto 0) = "0000000000000000" and sub_result(operand_width) = '0') then
						ALU_Z <= '1';
					else
						ALU_Z <= '0';
					end if;
					 
					 
					 
					 
            -- For BEQ
            elsif(ALU_J = "11") then
                if(ALU_A = ALU_B) then
                    sz_int := '1';
                else
                    sz_int := '0';
                end if;
                ALU_Cout <= sz_int;
                ALU_Z <= sz_int;
            else null;
            end if;

    end process;
end architecture behavioural;