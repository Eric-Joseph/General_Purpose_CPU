library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_Problem3 is
port( Clock : in std_logic; --input clock signal
		A,B : in unsigned(7 downto 0); --8bit inputs from latches A and B
		student_id : in unsigned(3 downto 0); --4 bit student id from FSM
		OP : in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
		Output : OUT unsigned(3 downto 0)); --lower 4-bits of 8-bit Result Output
end  ALU_Problem3;

architecture calculation of ALU_Problem3 is --temporary signal declarations.
signal Reg1, Reg2, Result : unsigned(7 downto 0):=(others => '0');
signal Reg4 : unsigned (0 to 7);
begin
Reg1 <= A; --temporary store A in Reg1 local variable
Reg2 <= B; --temporary storeB in Reg2 local variable
process(Clock, OP)
begin
	if (rising_edge(Clock)) THEN
		if (student_id = "0000" OR student_id = "0010" OR student_id = "0100" OR student_id = "0110" OR student_id = "1000") then
			Result <= "00000000";
		else
			Result <= "00000001";
		end if;
	end if;
end process;
Output <= Result(3 downto 0); --Since the output seven segments can
end calculation;