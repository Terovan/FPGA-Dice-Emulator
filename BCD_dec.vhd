----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2023 10:40:13 PM
-- Design Name: 
-- Module Name: BCD_dec - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_dec is
port
(
    ABC : in std_logic_vector(2 downto 0);
    Q_a_g : out std_logic_vector (6 downto 0)
    );
end BCD_dec;

architecture Behavioral of BCD_dec is
    signal Q_a_g_sg : std_logic_vector (6 downto 0);
    
begin
    process(ABC)
    begin
        case (ABC) is
            when "001" => Q_a_g_sg <= "0110000";
            when "010" => Q_a_g_sg <= "1101101";
            when "011" => Q_a_g_sg <= "1111001";
            when "100" => Q_a_g_sg <= "0110011";
            when "101" => Q_a_g_sg <= "1011011";
            when "110" => Q_a_g_sg <= "1011111";
            when others => null;
        end case;
    end process; 
    
    Q_a_g <= not Q_a_g_sg; --for common anode
    --Q_a_g <= Q_a_g_sg;     --for common cathode
end Behavioral;