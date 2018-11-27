--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:58 07/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/4.hafta ISE 09.07/4.hafta 09.07/09.07.2018/HW6/RF_tb.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
 
ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         CLK : IN  std_logic;
         WR_EN : IN  std_logic;
         RA : IN  std_logic_vector(3 downto 0);
         RB : IN  std_logic_vector(3 downto 0);
         RW : IN  std_logic_vector(3 downto 0);
         W_DAT : IN  std_logic_vector(15 downto 0);
         A_DAT : OUT  std_logic_vector(15 downto 0);
         B_DAT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WR_EN : std_logic := '0';
   signal RA : std_logic_vector(3 downto 0) := (others => '0');
   signal RB : std_logic_vector(3 downto 0) := (others => '0');
   signal RW : std_logic_vector(3 downto 0) := (others => '0');
   signal W_DAT : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal A_DAT : std_logic_vector(15 downto 0);
   signal B_DAT : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          CLK => CLK,
          WR_EN => WR_EN,
          RA => RA,
          RB => RB,
          RW => RW,
          W_DAT => W_DAT,
          A_DAT => A_DAT,
          B_DAT => B_DAT
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
      wait for 100 ns;	

		WR_EN <= '1';
      wait for 100 ns;	
		RW <= "0000";
		W_DAT <= X"0000";
      wait for 100 ns;	
		RW <= "0001";
		W_DAT <= X"0001";
      wait for 100 ns;	
		RW <= "0010";
		W_DAT <= X"0002";
      wait for 100 ns;	
		RW <= "0011";
		W_DAT <= X"0003";
      wait for 100 ns;	


		RW <= "0100";
		W_DAT <= X"0004";
      wait for 100 ns;	
		RW <= "0101";
		W_DAT <= X"0005";
      wait for 100 ns;	
		RW <= "0110";
		W_DAT <= X"0006";
      wait for 100 ns;	
		RW <= "0111";
		W_DAT <= X"0007";
      wait for 100 ns;	
		
		
		
		WR_EN <= '0';
		
		wait for 100 ns;	
		RA <= "0000";
      wait for 100 ns;	
		RA <= "0001";
      wait for 100 ns;	
		RA <= "0010";
      wait for 100 ns;	
		RA <= "0011";
      wait for 100 ns;	

		RB <= "0100";
      wait for 100 ns;	
		RB <= "0101";
      wait for 100 ns;	
		RB <= "0110";
      wait for 100 ns;	
		RB <= "0111";
      wait for 100 ns;	

		WR_EN <= '1';
		RA <= "0000";
		RB <= "0001";
      wait for 100 ns;	
		RW <= "0000";
		W_DAT <= X"00FA";
      wait for 100 ns;	
		RW <= "0001";
		W_DAT <= X"00FB";
      wait for 100 ns;	
		RW <= "0010";
		W_DAT <= X"00FC";
      wait for 100 ns;	

		WR_EN <= '0';
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
