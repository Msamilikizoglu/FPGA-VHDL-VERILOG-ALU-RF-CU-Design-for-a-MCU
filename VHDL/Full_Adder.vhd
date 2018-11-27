----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:47 06/28/2018 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

entity Full_Adder is
    Port ( C_IN : in  STD_LOGIC;
           INPUT_0 : in  STD_LOGIC;
           INPUT_1 : in  STD_LOGIC;
           C_OUT : out  STD_LOGIC;
           SUM_OUT : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

	signal HA_0_C_Out, HA_0_Sum_Out : std_logic;
	signal HA_1_C_Out, HA_1_Sum_Out : std_logic;
	
	COMPONENT Half_Adder
	PORT(
		INPUT_0 : IN std_logic;
		INPUT_1 : IN std_logic;          
		C_OUT : OUT std_logic;
		SUM_OUT : OUT std_logic
		);
	END COMPONENT;
begin
	HA_0: Half_Adder PORT MAP(
		INPUT_0 => INPUT_0,
		INPUT_1 => INPUT_1,
		C_OUT => HA_0_C_Out,
		SUM_OUT => HA_0_Sum_Out 
	);
	HA_1: Half_Adder PORT MAP(
		INPUT_0 => C_IN,
		INPUT_1 => HA_0_Sum_Out,
		C_OUT => HA_1_C_Out,
		SUM_OUT => HA_1_Sum_Out
	);
	
	SUM_OUT <= HA_1_Sum_Out;
	C_OUT <= HA_0_C_Out or HA_1_C_Out;

end Behavioral;

