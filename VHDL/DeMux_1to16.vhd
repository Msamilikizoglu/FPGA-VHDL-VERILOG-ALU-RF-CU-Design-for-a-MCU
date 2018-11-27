----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:21 07/09/2018 
-- Design Name: 
-- Module Name:    DeMux_1to16 - Behavioral 
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

entity DeMux_1to16 is
    Port ( INPUT  : in  STD_LOGIC;
           SELECTOR : in  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT  : out  STD_LOGIC_VECTOR (15 downto 0));
end DeMux_1to16;

architecture Behavioral of DeMux_1to16 is
begin
	OUTPUT(0) <= INPUT and (not SELECTOR(3)) and (not SELECTOR(2)) and (not SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(1) <= INPUT and (not SELECTOR(3)) and (not SELECTOR(2)) and (not SELECTOR(1)) and (	 SELECTOR(0));
	OUTPUT(2) <= INPUT and (not SELECTOR(3)) and (not SELECTOR(2)) and (	   SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(3) <= INPUT and (not SELECTOR(3)) and (not SELECTOR(2)) and (	   SELECTOR(1)) and (	 SELECTOR(0));
	
	OUTPUT(4) <= INPUT and (not SELECTOR(3)) and (	  SELECTOR(2)) and (not SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(5) <= INPUT and (not SELECTOR(3)) and (    SELECTOR(2)) and (not SELECTOR(1)) and (	 SELECTOR(0));
	OUTPUT(6) <= INPUT and (not SELECTOR(3)) and (	  SELECTOR(2)) and (	   SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(7) <= INPUT and (not SELECTOR(3)) and (	  SELECTOR(2)) and (	   SELECTOR(1)) and (	 SELECTOR(0));
	
	OUTPUT(8)  <= INPUT and (	  SELECTOR(3)) and (not SELECTOR(2)) and (not SELECTOR(1)) and (not SELECTOR(0));	
	OUTPUT(9)  <= INPUT and (	  SELECTOR(3)) and (not SELECTOR(2)) and (not SELECTOR(1)) and (	 SELECTOR(0));
	OUTPUT(10) <= INPUT and (	  SELECTOR(3)) and (not SELECTOR(2)) and (	 SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(11) <= INPUT and (	  SELECTOR(3)) and (not SELECTOR(2)) and (	 SELECTOR(1)) and (	 SELECTOR(0));
	
	OUTPUT(12) <= INPUT and (	  SELECTOR(3)) and (	   SELECTOR(2)) and (not SELECTOR(1)) and (not SELECTOR(0));	
	OUTPUT(13) <= INPUT and (	  SELECTOR(3)) and (	   SELECTOR(2)) and (not SELECTOR(1)) and (	 SELECTOR(0));
	OUTPUT(14) <= INPUT and (	  SELECTOR(3)) and (	   SELECTOR(2)) and (	 SELECTOR(1)) and (not SELECTOR(0));
	OUTPUT(15) <= INPUT and (	  SELECTOR(3)) and (	   SELECTOR(2)) and (	 SELECTOR(1)) and (	 SELECTOR(0));
end Behavioral;