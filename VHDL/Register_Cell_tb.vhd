--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:52 07/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/4.hafta ISE 09.07/4.hafta 09.07/09.07.2018/HW6/Register_Cell_tb.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_Cell
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
 
ENTITY Register_Cell_tb IS
END Register_Cell_tb;
 
ARCHITECTURE behavior OF Register_Cell_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_Cell
    PORT(
         CLK : IN  std_logic;
         EN : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_Cell PORT MAP (
          CLK => CLK,
          EN => EN,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		EN <= '1';
      wait for 100 ns;	
		D <= X"000F";
      wait for 100 ns;	
		D <= X"0009";
		wait for 100 ns;	
		D <= X"0005";
		
				
		EN <= '0';
      wait for 100 ns;	
		D <= X"000F";
      wait for 100 ns;	
		D <= X"0009";
		wait for 100 ns;	
		D <= X"0005";
		
		EN <= '1';
      wait for 100 ns;	
		D <= X"000A";
      wait for 100 ns;	
		D <= X"000B";
		wait for 100 ns;	
		D <= X"000C";	
		wait for 100 ns;	
		D <= X"032B";
		wait for 100 ns;	
		D <= X"0012";	
		wait for 100 ns;	
		D <= X"0321";
		wait for 100 ns;	
		D <= X"063A";	
		wait for 100 ns;	
		D <= X"0367";
		wait for 100 ns;	
		D <= X"78CC";	
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
