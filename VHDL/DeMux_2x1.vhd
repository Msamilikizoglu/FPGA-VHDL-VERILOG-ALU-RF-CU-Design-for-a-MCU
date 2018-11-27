----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:24 06/25/2018 
-- Design Name: 
-- Module Name:    DeMux_2x1 - Behavioral 
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

entity DeMux_2x1 is
    Port ( INPUT : in  STD_LOGIC;
           SELECTOR : in  STD_LOGIC;
           OUTPUT : out  STD_LOGIC_VECTOR (1 downto 0));
end DeMux_2x1;

architecture Behavioral of DeMux_2x1 is
begin
	OUTPUT(0) <= INPUT and (not SELECTOR);
	OUTPUT(1) <= INPUT and SELECTOR;
end Behavioral;

