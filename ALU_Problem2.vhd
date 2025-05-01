library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_Problem2 is
port( Clock : in std_logic; --input clock signal
		A,B : in unsigned(7 downto 0); --8bit inputs from latches A and B
		OP : in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
		Neg : out std_logic; --is the result negative? Set -ve output
		R1 : out unsigned(3 downto 0); --lower 4-bits of 8-bit Result Output
		R2 : out unsigned(3 downto 0)); --higher 4-bits of 8-bit Result Output
end  ALU_Problem2;

architecture calculation of ALU_Problem2 is --temporary signal declarations.
signal Reg1, Reg2, Result, temp : unsigned(7 downto 0):=(others => '0');
signal Reg4 : unsigned (0 to 7);
begin
Reg1 <= A; --temporary store A in Reg1 local variable
Reg2 <= B; --temporary store B in Reg2 local variable
process(Clock, OP, temp)
begin
	  if (rising_edge(Clock)) THEN
		case OP is
			WHEN "0000000000000001" =>
			-- Shift A to right by two bits, input bit = 1 (SHR)
				Result <= "11" & Reg1(7 downto 2);
				Neg <= '0';
			WHEN "0000000000000010" =>
					--Produce the difference of A and B and then increment by 4
					if ((Reg1 + 4) > Reg2) then
					Result <= (Reg1 + 4) - Reg2;
						Neg <= '0';
					elsif(Reg2 > (Reg1 + 4)) then
					Result <= Reg2 - (Reg1 + 4);
						Neg <= '1';
					end if;
					
			WHEN "0000000000000100" =>
					--Find the greater value of A and B and produce the results ( Max(A,B) )
					if (Reg1 > Reg2) then
						Result <= A;
					elsif(Reg2 > Reg1) then
						Result <= B;
					end if;
					Neg <= '0';
			WHEN "0000000000001000" =>
					--Swap the upper 4 bits of A by the lower 4 bits of B
					Result <= Reg2(3 downto 0) & Reg1(3 downto 0);
					Neg <= '0';
			WHEN "0000000000010000" =>
					--Increment A by 1
					Result <= A + 1;
					Neg <= '0';
			WHEN "0000000000100000" =>
					--Produce the result of ANDing A and B
					Result <= (A and B);
					Neg <= '0';
			WHEN "0000000001000000" =>
					--Invert the upper four bits of A
					Result <= A;
					Result(7 downto 4) <= not A(7 downto 4);
					Neg <= '0';
			WHEN "0000000010000000" =>
					--Rotate B to left by 3 bits (ROL)
					Result <= B;
					Result <= B(4 downto 0) & B (7 downto 5);
					Neg <= '0';
			WHEN "0000000100000000" =>
					--Show null on the output
					--"0" was chosen as the null value as there was no state available
					--to represent null in the SSEG
					Result <= "00000000";
					Neg <= '0';
			WHEN OTHERS =>
				--Don't care, do nothing
		end case;
		end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); --only 4-bits, split the 8-bit to two 4-bits
end calculation;