----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:32 07/09/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( SELECTOR : in  STD_LOGIC_VECTOR (3 downto 0);
			  A : in  STD_LOGIC_VECTOR (15 downto 0);
			  B : in  STD_LOGIC_VECTOR (15 downto 0);
			  S_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
			  C_OUT : out  STD_LOGIC;
			  Psr_C : out STD_LOGIC; 
			  Psr_L : out STD_LOGIC; 
			  Psr_F : out STD_LOGIC; 
			  Psr_Z : out STD_LOGIC; 
			  Psr_N : out STD_LOGIC );
end ALU;

architecture Behavioral of ALU is
	signal FF_X_C_Out, FF_X_S_Out :  STD_LOGIC_VECTOR (15 downto 0); 
	signal w1_Psr_C : STD_LOGIC; 
	signal w1_Psr_L : STD_LOGIC; 
	signal w1_Psr_F : STD_LOGIC; 
	signal w1_Psr_Z : STD_LOGIC; 
	signal w1_Psr_N : STD_LOGIC; 

	COMPONENT Inner_Block
	PORT(
		SELECTOR : IN std_logic_vector(3 downto 0);
		Mux_4to1_Cin_IN2 : IN std_logic;
		A : IN std_logic;
		B : IN std_logic;          
		S_OUT : OUT std_logic;
		C_OUT : OUT std_logic
		);
	END COMPONENT;
begin
	Inner_Block_0: Inner_Block PORT MAP(
			SELECTOR => SELECTOR,
			Mux_4to1_Cin_IN2 => SELECTOR(0),
			A => A(0),
			B => B(0),
			S_OUT => FF_X_S_Out(0),
			C_OUT => FF_X_C_Out(0)
		);
	gen: for x in 0 to 14 generate
		Inner_Block_X: Inner_Block PORT MAP(
			SELECTOR => SELECTOR,
			Mux_4to1_Cin_IN2 => FF_X_C_Out(x),
			A => A(x+1),
			B => B(x+1),
			S_OUT => FF_X_S_Out(x+1),
			C_OUT => FF_X_C_Out(x+1)
		);
	end generate;
	S_OUT <= FF_X_S_Out;
	C_OUT <= FF_X_C_Out(15);
	
	process (A,B,SELECTOR,FF_X_S_Out,FF_X_C_Out) begin
		if(FF_X_S_Out=X"0000") then			--Zero Flag
			w1_Psr_Z	<= '1';
		else
			w1_Psr_Z	<= '0';
		end if;
		if(FF_X_S_Out(15) ='1') then			--Negative Flag
			w1_Psr_N	<= '1';
		else
			w1_Psr_N	<= '0';
		end if;	
		if(A(15)='0' and B(15)='0' and A<B) then								--Low Flag
			w1_Psr_L	<= '1';
		elsif (A(15)='0' and B(15)='0' and A>=B) then
			w1_Psr_L	<= '0';		
		elsif (A(15)='1' and B(15)='1' and A>B) then
			w1_Psr_L	<= '1';
		elsif (A(15)='1' and B(15)='1' and A<=B) then
			w1_Psr_L	<= '0';
		elsif (A(15)='1' and B(15)='0') then
			w1_Psr_L	<= '1';			
		elsif (A(15)='0' and B(15)='1') then
			w1_Psr_L	<= '0';
		else
			w1_Psr_L	<= 'Z';
		end if;	
		w1_Psr_F	<= '0';
		w1_Psr_C	<= '0';
					
		case SELECTOR is
			when "0100" => 						--SUM		
				if(A(15)='1' and B(15)='1') then
					w1_Psr_C	<= FF_X_C_Out(15);
				else
					w1_Psr_C	<= '0';
				end if;
				if(A(15)='0' and B(15)='0' and FF_X_S_Out(15)='1') then
					w1_Psr_F	<= '1';			
				elsif (A(15)='1' and B(15)='1' and FF_X_S_Out(15)='0') then
					w1_Psr_F	<= '1';	
				else
					w1_Psr_F	<= '0';	
				end if;		
			when "0101" => 						--SUB
				if(A(15)='0' and B(15)='1' and FF_X_S_Out(15)='1') then
					w1_Psr_F	<= '1';			
				elsif (A(15)='1' and B(15)='0' and FF_X_S_Out(15)='0') then
					w1_Psr_F	<= '1';	
				else
					w1_Psr_F	<= '0';					
				end if;
			when others => 
				w1_Psr_F	<= '0';
				w1_Psr_C	<= '0';	
		end case;	
	--w1_Psr_N		MSB
	--w1_Psr_Z 		z A=B ise zero 1, deðilse 0 olur  ---> her bit xorlanýr. sonuçlar or lanýr. çýkýþ 1 ise z 0 , çýkýþ 0 ise z 1 dir.
	--w1_Psr_F		******overflow sadece toplama çýkarmada
	--w1_Psr_L		a<b 1 yap hepsi için
	--w1_Psr_C		*******toplama çýkarmada			
	end process;
	Psr_C <= w1_Psr_C;
	Psr_L <= w1_Psr_L;
	Psr_F <= w1_Psr_F;
	Psr_Z <= w1_Psr_Z;
	Psr_N <= w1_Psr_N;
	
end Behavioral;

