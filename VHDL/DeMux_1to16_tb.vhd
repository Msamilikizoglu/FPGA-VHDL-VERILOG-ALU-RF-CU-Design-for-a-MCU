--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:21:47 07/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/4.hafta ISE 09.07/4.hafta 09.07/09.07.2018/HW6/DeMux_1to16_tb.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DeMux_1to16
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DeMux_1to16_tb IS
END DeMux_1to16_tb;
 
ARCHITECTURE behavior OF DeMux_1to16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux_1to16
    PORT(
         INPUT : IN  std_logic;
         SELECTOR : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic := '0';
   signal SELECTOR : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux_1to16 PORT MAP (
          INPUT => INPUT,
          SELECTOR => SELECTOR,
          OUTPUT => OUTPUT
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		INPUT <= '1';
		wait for 100 ns;	
		SELECTOR <= "0000";
		wait for 100 ns;	
		SELECTOR <= "0001";
		wait for 100 ns;	
		SELECTOR <= "0010";
		wait for 100 ns;	
		SELECTOR <= "0011";


		wait for 100 ns;	
		SELECTOR <= "0100";
		wait for 100 ns;	
		SELECTOR <= "0101";
		wait for 100 ns;	
		SELECTOR <= "0110";
		wait for 100 ns;	
		SELECTOR <= "0111";


		wait for 100 ns;	
		SELECTOR <= "1000";
		wait for 100 ns;	
		SELECTOR <= "1001";
		wait for 100 ns;	
		SELECTOR <= "1010";
		wait for 100 ns;	
		SELECTOR <= "1011";


		wait for 100 ns;	
		SELECTOR <= "1100";
		wait for 100 ns;	
		SELECTOR <= "1101";
		wait for 100 ns;	
		SELECTOR <= "1110";
		wait for 100 ns;	
		SELECTOR <= "1111";

		wait for 100 ns;			
		SELECTOR <= "0000";	
		INPUT <= '0';
		wait for 100 ns;	
		SELECTOR <= "0001";
		wait for 100 ns;	
		SELECTOR <= "0010";
		wait for 100 ns;	
		SELECTOR <= "0011";


		wait for 100 ns;	
		SELECTOR <= "0100";
		wait for 100 ns;	
		SELECTOR <= "0101";
		wait for 100 ns;	
		SELECTOR <= "0110";
		wait for 100 ns;	
		SELECTOR <= "0111";


		wait for 100 ns;	
		SELECTOR <= "1000";
		wait for 100 ns;	
		SELECTOR <= "1001";
		wait for 100 ns;	
		SELECTOR <= "1010";
		wait for 100 ns;	
		SELECTOR <= "1011";


		wait for 100 ns;	
		SELECTOR <= "1100";
		wait for 100 ns;	
		SELECTOR <= "1101";
		wait for 100 ns;	
		SELECTOR <= "1110";
		wait for 100 ns;	
		SELECTOR <= "1111";

		wait for 100 ns;			
		SELECTOR <= "0000";	
      -- insert stimulus here 

      wait;
   end process;

END;
