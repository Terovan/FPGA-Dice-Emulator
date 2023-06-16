----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2023 07:52:50 PM
-- Design Name: 
-- Module Name: Dice_roller - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use IEEE.math_real.ALL;

entity Dice_roller is
port
(
   SYS_CLK : in std_logic;
   EN: in std_logic;
   AN : out std_logic_vector (7 downto 0);
   Q_a_g : out std_logic_vector (6 downto 0)
   );
end Dice_roller;

architecture Behavioral of Dice_roller is
    signal divider:std_logic_vector(23 downto 0);

component Random_Numb_Gen
generic
(
    width : integer := 3
    );
port
(
    clk : in std_logic;
    rst : in std_logic;
    cnt : out std_logic_vector(2 downto 0)
    );
end component;

component BCD_DEC
port
(
   ABC : in std_logic_vector (2 downto 0);
   Q_a_g : out std_logic_vector (6 downto 0)
   );
end component;
    signal cntout : std_logic_vector(2 downto 0);
    
begin
    Random_Numb_Gen1 : Random_Numb_Gen port map (clk => SYS_CLK, rst => EN, cnt => cntout);
    BCD_dec1 : BCD_dec port map (ABC => cntout, Q_a_g => Q_a_g);
    AN <= "11111110";


end Behavioral;