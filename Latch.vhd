Library ieee;
use ieee.std_logic_1164.all;

entity latch1 is
	port (A : in std_logic_vector(7 downto 0); --8 bit input
			Resetn, Clock : in std_logic; --1 bit input and 1 bit reset input
			Q : out std_logic_vector(7 downto 0)); --8 bit output
end latch1;		

architecture behavior of latch1 is
begin
	process (Resetn, Clock) --Process takes reset and clocks as inputs
	begin
		if  Resetn = '0' then --when reset input is '0' the latch does not operate
			Q <= "00000000";
		elsif Clock'EVENT and Clock = '1' then -- level sensitive based on clock
			Q <= A;
		end if;
	end process;
end behavior;