LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Unidade_Controle IS
	PORT(opcode : IN std_logic_vector(2 DOWNTO 0);
		  funct : IN std_logic_vector (2 downto 0);
		  ula_op : OUT std_logic_vector(2 DOWNTO 0);
		  mem_to_reg, branch, mem_read, mem_write, ula_src, reg_write, extend3, jump, reg_for_write : OUT std_logic);
END Unidade_Controle;

ARCHITECTURE Behavioral OF Unidade_Controle IS
BEGIN
	PROCESS(opcode)
	BEGIN
		CASE opcode IS
			WHEN "000" => -- tipo R
				mem_to_reg <= '0';
				ula_op <= funct;
				branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				ula_src <= '1';
				reg_write <= '1';
				extend3 <= '1';
				jump <= '0';
				reg_for_write <= '0';
			WHEN "111" => -- jump
				mem_to_reg <= '0';
				ula_op <= "111";
				branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				ula_src <= '0';
				reg_write <= '0';
				extend3 <= '1';
				jump <= '1';
				reg_for_write <= '0';
			WHEN "001" => -- lw
				mem_to_reg <= '1';
				ula_op <= "110";
				branch <= '0';
				mem_read <= '1';
				mem_write <= '0';
				ula_src <= '0';
				reg_write <= '1';
				extend3 <= '1';
				jump <= '0';
				reg_for_write <= '0';
			WHEN "110" => -- li
				mem_to_reg <= '0';
				ula_op <= "110";
				branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				ula_src <= '0';
				reg_write <= '1';
				extend3 <= '1';
				jump <= '0';
				reg_for_write <= '0';
			WHEN "010" => -- sw;
				mem_to_reg <= '0';
				ula_op <= "010";
				branch <= '0';
				mem_read <= '0';
				mem_write <= '1';
				ula_src <= '0';
				reg_write <= '0';
				extend3 <= '0';
				jump <= '0';
				reg_for_write <= '1';
			WHEN "011" => -- bne
				mem_to_reg <= '0';
				ula_op <= "101";
				branch <= '1';
				mem_read <= '0';
				mem_write <= '0';
				ula_src <= '1';
				reg_write <= '0';
				extend3 <= '1';
				jump <= '0';
				reg_for_write <= '0';
			WHEN OTHERS =>
				mem_to_reg <= '0';
				ula_op <= "111";
				branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				ula_src <= '0';
				reg_write <= '0';
				extend3 <= '1';
				jump <= '0';
				reg_for_write <= '0';
		END CASE;
	END PROCESS;
END Behavioral;
			
			
			