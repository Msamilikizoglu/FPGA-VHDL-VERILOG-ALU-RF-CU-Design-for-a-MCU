----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:39 07/09/2018 
-- Design Name: 
-- Module Name:    Inner_Block - Behavioral 
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

entity Inner_Block is
    Port ( SELECTOR : in  STD_LOGIC_VECTOR (3 downto 0);
			  Mux_4to1_Cin_IN2 : STD_LOGIC;
			  A : in  STD_LOGIC;
			  B : in  STD_LOGIC;
			  S_OUT : out  STD_LOGIC;
			  C_OUT : out  STD_LOGIC);
end Inner_Block;

architecture Behavioral of Inner_Block is

	signal Mux_4to1_Cin_In : std_logic_vector(3 downto 0);
	signal Mux_4to1_Cin_Out : std_logic;
	signal Mux_2to1_B_In : std_logic_vector(1 downto 0);
	signal Mux_2to1_B_Out : std_logic;
	signal Mux_2to1_S_In : std_logic_vector(1 downto 0);
	signal Mux_2to1_S_Out : std_logic;
	signal FA_0_S : std_logic;
	signal FA_0_C_Out : std_logic;

	COMPONENT Full_Adder
	PORT(
		C_IN : IN std_logic;
		INPUT_0 : IN std_logic;
		INPUT_1 : IN std_logic;          
		C_OUT : OUT std_logic;
		SUM_OUT : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Mux_4to1
	PORT(
		INPUT : IN std_logic_vector(3 downto 0);
		SELECTOR : IN std_logic_vector(1 downto 0);          
		OUTPUT : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Mux_2to1
	PORT(
		INPUT : IN std_logic_vector(1 downto 0);
		SELECTOR : IN std_logic;          
		OUTPUT : OUT std_logic
		);
	END COMPONENT;

begin

	Mux_4to1_Cin_In <= B & Mux_4to1_Cin_IN2 & '1' & '0';
	Mux_2to1_B_In <= (not B) & B;
	Mux_2to1_S_In <= FA_0_C_Out & FA_0_S;
	
	Mux_4to1_Cin: Mux_4to1 PORT MAP(
		INPUT => Mux_4to1_Cin_In,
		SELECTOR => SELECTOR(2 downto 1),
		OUTPUT => Mux_4to1_Cin_Out
	);
	
	FA_0: Full_Adder PORT MAP(
		C_IN => Mux_4to1_Cin_Out,
		INPUT_0 => A,
		INPUT_1 => Mux_2to1_B_Out,
		C_OUT => FA_0_C_Out,
		SUM_OUT => FA_0_S
	);
	Mux_2to1_B: Mux_2to1 PORT MAP(
		INPUT => Mux_2to1_B_In,
		SELECTOR => SELECTOR(0),
		OUTPUT => Mux_2to1_B_Out
	);

	Mux_2to1_S: Mux_2to1 PORT MAP(
		INPUT => Mux_2to1_S_In,
		SELECTOR => SELECTOR(3),
		OUTPUT => Mux_2to1_S_Out
	);

	S_OUT <= Mux_2to1_S_Out;	
	C_OUT <= FA_0_C_Out;
	
end Behavioral;

