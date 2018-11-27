--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:27:07 06/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/27.06.2018 home/27.06.2018 tubitak/ISE Projects/2.hafta/28.06.2018/Ripple_Carry_Adder/Full_Adder_tb.vhd
-- Project Name:  Ripple_Carry_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
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
 
ENTITY Full_Adder_tb IS
END Full_Adder_tb;
 
ARCHITECTURE behavior OF Full_Adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         C_IN : IN  std_logic;
         INPUT_0 : IN  std_logic;
         INPUT_1 : IN  std_logic;
         C_OUT : OUT  std_logic;
         SUM_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C_IN : std_logic := '0';
   signal INPUT_0 : std_logic := '0';
   signal INPUT_1 : std_logic := '0';

 	--Outputs
   signal C_OUT : std_logic;
   signal SUM_OUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          C_IN => C_IN,
          INPUT_0 => INPUT_0,
          INPUT_1 => INPUT_1,
          C_OUT => C_OUT,
          SUM_OUT => SUM_OUT
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		 wait for 100 ns;	
    	 C_IN <= '0';
		 	 
		 INPUT_0 <= '0';
		 INPUT_1 <= '0';
	
		 wait for 100 ns;			 
		 INPUT_0 <= '0';
		 INPUT_1 <= '1';		 

		 wait for 100 ns;		 
		 INPUT_0 <= '1';
		 INPUT_1 <= '0';
		
		 wait for 100 ns;			 
		 INPUT_0 <= '1';
		 INPUT_1 <= '1';		
		 		
				
				
		 wait for 100 ns;	
    	 C_IN <= '1';
		 	 
		 INPUT_0 <= '0';
		 INPUT_1 <= '0';
	
		 wait for 100 ns;			 
		 INPUT_0 <= '0';
		 INPUT_1 <= '1';		 

		 wait for 100 ns;		 
		 INPUT_0 <= '1';
		 INPUT_1 <= '0';
		
		 wait for 100 ns;			 
		 INPUT_0 <= '1';
		 INPUT_1 <= '1';	

		 wait for 100 ns;	
    	 C_IN <= '0';		 	 
		 INPUT_0 <= '0';
		 INPUT_1 <= '0';		 
		 


      -- insert stimulus here 

      wait;
   end process;

END;
