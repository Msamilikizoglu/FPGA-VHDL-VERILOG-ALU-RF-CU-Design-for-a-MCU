----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:59 07/09/2018 
-- Design Name: 
-- Module Name:    Mux_2to1 - Behavioral 
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

entity Mux_2to1 is
    Port ( INPUT : in  STD_LOGIC_VECTOR (1 downto 0);
           SELECTOR : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC);
end Mux_2to1;

architecture Behavioral of Mux_2to1 is
signal w1: STD_LOGIC := '0';
begin
process (SELECTOR, INPUT) begin
	case SELECTOR is
		when '0' => w1 <= INPUT(0) ;
		when '1'	=> w1 <= INPUT(1) ;
		when others => w1 <= '0';
	end case ;
end process;

OUTPUT<=  w1;

end Behavioral;
