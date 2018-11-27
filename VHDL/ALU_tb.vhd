--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:20:50 07/10/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/4.hafta ISE 09.07/4.hafta 09.07/09.07.2018 - Kopya/HW6/ALU_tb.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         SELECTOR : IN  std_logic_vector(3 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S_OUT : OUT  std_logic_vector(15 downto 0);
         C_OUT : OUT  std_logic;
         Psr_C : OUT  std_logic;
         Psr_L : OUT  std_logic;
         Psr_F : OUT  std_logic;
         Psr_Z : OUT  std_logic;
         Psr_N : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SELECTOR : std_logic_vector(3 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal S_OUT : std_logic_vector(15 downto 0);
   signal C_OUT : std_logic;
   signal Psr_C : std_logic;
   signal Psr_L : std_logic;
   signal Psr_F : std_logic;
   signal Psr_Z : std_logic;
   signal Psr_N : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          SELECTOR => SELECTOR,
          A => A,
          B => B,
          S_OUT => S_OUT,
          C_OUT => C_OUT,
          Psr_C => Psr_C,
          Psr_L => Psr_L,
          Psr_F => Psr_F,
          Psr_Z => Psr_Z,
          Psr_N => Psr_N
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A<=X"0FFF";
		B<=X"0FA0";

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
		
		
		--FOR Carry Flag	 	
		SELECTOR <= "0100"; --sum	
		A<=X"0FFF";
		B<=X"0FFF";
		wait for 100 ns;	
		A<=X"FFFF";
		B<=X"0001";
		wait for 100 ns;	
		A<=X"0001";
		B<=X"FFFF";
		wait for 100 ns;	
		A<=X"FFFF";
		B<=X"FFFF";

		--FOR Low Flag
		
		--FOR Overflow Flag
		
		--FOR Zero Flag
		
		--FOR Negative Flag
		

		wait for 100 ns;	
		A<=X"0001";
		B<=X"0001";
		wait for 100 ns;	
		A<=X"000F";
		B<=X"00F1";
		wait for 100 ns;	
		A<=X"0F01";
		B<=X"00AB";
		wait for 100 ns;	
		A<=X"00D1";
		B<=X"0052";
		wait for 100 ns;	
		A<=X"FFFF";
		B<=X"0001";
		
      wait for 100 ns;	
		A<=B"0111_1111_1111_1111";
		B<=X"0001";
		wait for 100 ns;	
		A<=B"1000_0000_0000_1111";
		A<=B"1000_0000_0000_1111";
		
		

		
		

      wait;
   end process;

END;
