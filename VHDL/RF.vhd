----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:32 07/09/2018 
-- Design Name: 
-- Module Name:    RB - Behavioral 
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

entity RF is
    Port ( CLK : in  STD_LOGIC;
			  WR_EN : in  STD_LOGIC;
			  RA : in  STD_LOGIC_VECTOR (3 downto 0);
           RB : in  STD_LOGIC_VECTOR (3 downto 0);
           RW : in  STD_LOGIC_VECTOR (3 downto 0);
           W_DAT : in  STD_LOGIC_VECTOR (15 downto 0);			  
           A_DAT : out  STD_LOGIC_VECTOR (15 downto 0);
           B_DAT : out  STD_LOGIC_VECTOR (15 downto 0));
end RF;

architecture Behavioral of RF is

	COMPONENT Mux_16to4_16bit
	PORT(
		INPUT0 : IN std_logic_vector(15 downto 0);
		INPUT1 : IN std_logic_vector(15 downto 0);
		INPUT2 : IN std_logic_vector(15 downto 0);
		INPUT3 : IN std_logic_vector(15 downto 0);
		INPUT4 : IN std_logic_vector(15 downto 0);
		INPUT5 : IN std_logic_vector(15 downto 0);
		INPUT6 : IN std_logic_vector(15 downto 0);
		INPUT7 : IN std_logic_vector(15 downto 0);
		INPUT8 : IN std_logic_vector(15 downto 0);
		INPUT9 : IN std_logic_vector(15 downto 0);
		INPUT10 : IN std_logic_vector(15 downto 0);
		INPUT11 : IN std_logic_vector(15 downto 0);
		INPUT12 : IN std_logic_vector(15 downto 0);
		INPUT13 : IN std_logic_vector(15 downto 0);
		INPUT14 : IN std_logic_vector(15 downto 0);
		INPUT15 : IN std_logic_vector(15 downto 0);
		SELECTOR : IN std_logic_vector(3 downto 0);          
		OUTPUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
		COMPONENT Register_Cell
	PORT(
		CLK : IN std_logic;
		EN : IN std_logic;
		D : IN std_logic_vector(15 downto 0);          
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	COMPONENT DeMux_1to16
	PORT(
		INPUT : IN std_logic;
		SELECTOR : IN std_logic_vector(3 downto 0);          
		OUTPUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	signal DeMux_0_Out: std_logic_vector(15 downto 0);
	signal Reg_00_Out: std_logic_vector(15 downto 0);
	signal Reg_01_Out: std_logic_vector(15 downto 0);
	signal Reg_02_Out: std_logic_vector(15 downto 0);
	signal Reg_03_Out: std_logic_vector(15 downto 0);
	signal Reg_04_Out: std_logic_vector(15 downto 0);
	signal Reg_05_Out: std_logic_vector(15 downto 0);
	signal Reg_06_Out: std_logic_vector(15 downto 0);
	signal Reg_07_Out: std_logic_vector(15 downto 0);
	signal Reg_08_Out: std_logic_vector(15 downto 0);
	signal Reg_09_Out: std_logic_vector(15 downto 0);
	signal Reg_10_Out: std_logic_vector(15 downto 0);
	signal Reg_11_Out: std_logic_vector(15 downto 0);
	signal Reg_12_Out: std_logic_vector(15 downto 0);
	signal Reg_13_Out: std_logic_vector(15 downto 0);
	signal Reg_14_Out: std_logic_vector(15 downto 0);
	signal Reg_15_Out: std_logic_vector(15 downto 0);

begin

	DeMux_1to16_0: DeMux_1to16 PORT MAP(
		INPUT => WR_EN,
		SELECTOR => RW,
		OUTPUT => DeMux_0_Out
	);
	
	
	Reg_00: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(0), D => W_DAT, Q => Reg_00_Out );
	Reg_01: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(1), D => W_DAT, Q => Reg_01_Out );
	Reg_02: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(2), D => W_DAT, Q => Reg_02_Out );
	Reg_03: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(3), D => W_DAT, Q => Reg_03_Out );
	Reg_04: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(4), D => W_DAT, Q => Reg_04_Out );
	Reg_05: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(5), D => W_DAT, Q => Reg_05_Out );
	Reg_06: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(6), D => W_DAT, Q => Reg_06_Out );
	Reg_07: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(7), D => W_DAT, Q => Reg_07_Out );
	Reg_08: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(8), D => W_DAT, Q => Reg_08_Out );
	Reg_09: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(9), D => W_DAT, Q => Reg_09_Out );
	Reg_10: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(10), D => W_DAT, Q => Reg_10_Out );
	Reg_11: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(11), D => W_DAT, Q => Reg_11_Out );
	Reg_12: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(12), D => W_DAT, Q => Reg_12_Out );
	Reg_13: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(13), D => W_DAT, Q => Reg_13_Out );
	Reg_14: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(14), D => W_DAT, Q => Reg_14_Out );
	Reg_15: Register_Cell PORT MAP( CLK => CLK, EN => DeMux_0_Out(15), D => W_DAT, Q => Reg_15_Out );

	Mux_16to4_16bit_0: Mux_16to4_16bit PORT MAP(
		INPUT0 => Reg_00_Out,
		INPUT1 => Reg_01_Out,
		INPUT2 => Reg_02_Out,
		INPUT3 => Reg_03_Out,
		INPUT4 => Reg_04_Out,
		INPUT5 => Reg_05_Out,
		INPUT6 => Reg_06_Out,
		INPUT7 => Reg_07_Out,
		INPUT8 => Reg_08_Out,
		INPUT9 => Reg_09_Out,
		INPUT10 => Reg_10_Out,
		INPUT11 => Reg_11_Out,
		INPUT12 => Reg_12_Out,
		INPUT13 => Reg_13_Out,
		INPUT14 => Reg_14_Out,
		INPUT15 => Reg_15_Out,
		SELECTOR => RA,
		OUTPUT => A_DAT );
		
	Mux_16to4_16bit_1: Mux_16to4_16bit PORT MAP(
		INPUT0 => Reg_00_Out,
		INPUT1 => Reg_01_Out,
		INPUT2 => Reg_02_Out,
		INPUT3 => Reg_03_Out,
		INPUT4 => Reg_04_Out,
		INPUT5 => Reg_05_Out,
		INPUT6 => Reg_06_Out,
		INPUT7 => Reg_07_Out,
		INPUT8 => Reg_08_Out,
		INPUT9 => Reg_09_Out,
		INPUT10 => Reg_10_Out,
		INPUT11 => Reg_11_Out,
		INPUT12 => Reg_12_Out,
		INPUT13 => Reg_13_Out,
		INPUT14 => Reg_14_Out,
		INPUT15 => Reg_15_Out,
		SELECTOR => RB,
		OUTPUT => B_DAT );	
	
end Behavioral;

