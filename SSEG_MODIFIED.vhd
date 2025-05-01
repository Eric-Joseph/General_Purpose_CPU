LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SSEG_Modified IS
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  leds1: OUT STD_LOGIC_VECTOR(0 TO 6));
END SSEG_Modified;

ARCHITECTURE Behavior OF SSEG_Modified IS
BEGIN
	PROCESS(bcd)
	BEGIN
		-- Need to invert outputs depending on board used
		CASE bcd IS				-- abcdefg
			WHEN "0000" =>leds1<="1101010";--N
			WHEN "0001" =>leds1<="1001100";--Y
			WHEN OTHERS =>leds1<="-------";--INVALID
		END CASE;
	END PROCESS;
END Behavior;