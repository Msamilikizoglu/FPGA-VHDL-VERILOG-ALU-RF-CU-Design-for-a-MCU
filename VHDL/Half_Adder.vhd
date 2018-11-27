----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:01 06/28/2018 
-- Design Name: 
-- Module Name:    Half_Adder - Behavioral 
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

entity Half_Adder is
    Port ( INPUT_0 : in  STD_LOGIC;
           INPUT_1 : in  STD_LOGIC;
           C_OUT : out  STD_LOGIC;
           SUM_OUT : out  STD_LOGIC);
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
	C_OUT <= INPUT_0 and INPUT_1;
	SUM_OUT <= INPUT_0 xor INPUT_1;
end Behavioral;

