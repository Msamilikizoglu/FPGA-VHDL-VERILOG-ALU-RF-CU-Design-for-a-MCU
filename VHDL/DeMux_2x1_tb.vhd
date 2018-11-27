--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:47:17 06/25/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/ISE Projects/25.06.2018/HW2/DeMux_2x1_tb.vhd
-- Project Name:  HW2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DeMux_2x1
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
 
ENTITY DeMux_2x1_tb IS
END DeMux_2x1_tb;
 
ARCHITECTURE behavior OF DeMux_2x1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux_2x1
    PORT(
         INPUT : IN  std_logic;
         SELECTOR : IN  std_logic;
         OUTPUT : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic := '1';
   signal SELECTOR : std_logic := '0';

 	--Outputs
   signal OUTPUT : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DeMux_2x1 PORT MAP (
          INPUT => INPUT,
          SELECTOR => SELECTOR,
          OUTPUT => OUTPUT
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



		SELECTOR<= '0';
      wait for 100 ns;	
		
		SELECTOR<= '1';
      wait for 100 ns;	

		SELECTOR<= '0';
      wait for 100 ns;		
		
      -- insert stimulus here 

      wait;
   end process;

END;
