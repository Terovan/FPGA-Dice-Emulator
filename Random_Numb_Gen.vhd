----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 10:40:13 PM
-- Design Name: 
-- Module Name: Random_Num_Gen - Behavioral
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
use ieee.std_logic_unsigned.all;


entity Random_Numb_Gen is
generic ( width : integer := 3 );
port
(
	rst : in std_logic;
	clk:in std_logic;
	cnt : out std_logic_vector (width-1 downto 0)
    );
end Random_Numb_Gen;

architecture Behavioral of Random_Numb_Gen is
    signal divider:std_logic_vector(23 downto 0);

    
begin
	process(clk) 
	begin
		if(rising_edge(clk)) then
			divider<=divider+'1';
		end if;
	end process;

	process(divider(23),rst)
		variable rand_temp : std_logic_vector(width-1 downto 0):=(width-1 => '1',others => '0');
		variable temp : std_logic := '0';
	begin
	if(rst='1') then
		if(rising_edge(divider(21))) then
		--pentru generarea de nr random
			temp := rand_temp(width-1) xor rand_temp(width-2);
			rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
			rand_temp(0) := temp;
		end if;
	end if;

cnt <= rand_temp;
	
end process;
end Behavioral;