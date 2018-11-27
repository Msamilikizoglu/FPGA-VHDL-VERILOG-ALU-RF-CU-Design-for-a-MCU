----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:29 07/09/2018 
-- Design Name: 
-- Module Name:    Mux_16to4_16bit - Behavioral 
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

entity Mux_16to4_16bit is
    Port ( INPUT0  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT1  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT2  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT3  : in  STD_LOGIC_VECTOR (15 downto 0);
		  	  INPUT4  : in  STD_LOGIC_VECTOR (15 downto 0);
		  	  INPUT5  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT6  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT7  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT8  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT9  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT10  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT11  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT12  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT13  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT14  : in  STD_LOGIC_VECTOR (15 downto 0);
			  INPUT15  : in  STD_LOGIC_VECTOR (15 downto 0);
           SELECTOR : in  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT  : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux_16to4_16bit;

architecture Behavioral of Mux_16to4_16bit is
signal w1: STD_LOGIC_VECTOR (15 downto 0) ;
begin
process (SELECTOR, INPUT0, INPUT1, INPUT2,  INPUT3, INPUT4, INPUT5, INPUT6, INPUT7, INPUT8, INPUT9, INPUT10, INPUT11, INPUT12, INPUT13, INPUT14, INPUT15) begin
	case SELECTOR is
		when "0000" => w1 <= INPUT0 ;
		when "0001" => w1 <= INPUT1 ;
		when "0010" => w1 <= INPUT2 ;
		when "0011" => w1 <= INPUT3 ;

		when "0100" => w1 <= INPUT4 ;
		when "0101" => w1 <= INPUT5 ;
		when "0110" => w1 <= INPUT6 ;
		when "0111" => w1 <= INPUT7 ;

		when "1000" => w1 <= INPUT8 ;
		when "1001" => w1 <= INPUT9 ;
		when "1010" => w1 <= INPUT10 ;
		when "1011" => w1 <= INPUT11 ;

		when "1100" => w1 <= INPUT12 ;
		when "1101" => w1 <= INPUT13 ;
		when "1110" => w1 <= INPUT14 ;
		when "1111" => w1 <= INPUT15 ;

		when others => w1 <= (others => '0');
	end case ;
end process;

OUTPUT<=  w1;

end Behavioral;

