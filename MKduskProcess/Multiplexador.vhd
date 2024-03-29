-- Multiplexador
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTiTY Multiplexador IS
	PORT(
		A, B : IN std_logic_vector(7 DOWNTO 0);
		S1: IN std_logic;
		R : OUT std_logic_vector(7 DOWNTO 0));
END Multiplexador;

ARCHITECTURE Mux of Multiplexador IS
BEGIN
	PROCESS(A,B,S1)
		BEGIN
			CASE S1 IS
				WHEN '1' => R <= A;
				WHEN '0' => R <= B;
			END CASE;
	END PROCESS;
END Mux;