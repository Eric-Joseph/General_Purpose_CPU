LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  Neg : IN STD_LOGIC;
		  leds1: OUT STD_LOGIC_VECTOR(1 TO 7);
		  leds2: OUT STD_LOGIC_VECTOR(1 TO 7));
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
	PROCESS(bcd)
	BEGIN
		IF Neg = '1' THEN
			leds2 <= "1111110";
		ELSE
			leds2 <= "1111111";
		END IF;
		-- Need to invert outputs depending on board used
		CASE bcd IS				-- abcdefg
			WHEN "0000" =>leds1<="0000001";--0
			WHEN "0001" =>leds1<="1001111";--1
			WHEN "0010" =>leds1<="0010010";--2
			WHEN "0011" =>leds1<="0000110";--3
			WHEN "0100" =>leds1<="1001100";--4
			WHEN "0101" =>leds1<="0100100";--5
			WHEN "0110" =>leds1<="0100000";--6
			WHEN "0111" =>leds1<="0001111";--7
			WHEN "1000" =>leds1<="0000000";--8
			WHEN "1001" =>leds1<="0000100";--9
			WHEN "1010" =>leds1<="0001000";--A
			WHEN "1011" =>leds1<="1100000";--B
			WHEN "1100" =>leds1<="0110001";--C
			WHEN "1101" =>leds1<="1000010";--D
			WHEN "1110" =>leds1<="0110000";--E
			WHEN "1111" =>leds1<="0111000";--F
			WHEN OTHERS =>leds1<="1111111";--INVALID
		END CASE;
		
	END PROCESS;
END Behavior;