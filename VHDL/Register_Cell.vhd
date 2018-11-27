----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:59 07/09/2018 
-- Design Name: 
-- Module Name:    Register_Cell - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Cell is
    Port ( CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end Register_Cell;

architecture Behavioral of Register_Cell is
signal w1: std_logic_vector(15 downto 0):= (others=>'0');
begin
	process (CLK) begin
		if rising_edge(CLK) then
			if(EN='1') then
				w1 <= D;
				else
				w1 <= w1;
				end if;
		end if;
	end process;
Q <= w1;
end Behavioral;

