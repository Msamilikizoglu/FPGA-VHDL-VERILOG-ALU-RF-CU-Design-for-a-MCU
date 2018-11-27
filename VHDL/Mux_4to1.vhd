----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:02 07/09/2018 
-- Design Name: 
-- Module Name:    Mux_4to1 - Behavioral 
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

entity Mux_4to1 is
    Port ( INPUT : in  STD_LOGIC_VECTOR (3 downto 0);
           SELECTOR : in  STD_LOGIC_VECTOR (1 downto 0);
           OUTPUT : out  STD_LOGIC);
end Mux_4to1;

architecture Behavioral of Mux_4to1 is
signal w1: STD_LOGIC := '0';
begin
process (SELECTOR, INPUT) begin
	case SELECTOR is
		when "00" => w1 <= INPUT(0) ;
		when "01" => w1 <= INPUT(1) ;
		when "10" => w1 <= INPUT(2) ;
		when "11" => w1 <= INPUT(3) ;
		when others => w1 <= '0';
	end case ;
end process;

OUTPUT<=  w1;

end Behavioral;
