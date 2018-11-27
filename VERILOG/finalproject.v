`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:24 12/26/2017 
// Design Name: 
// Module Name:    finalproject 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TOP(
	input clk,
	input reset,
	input [7:0] InA,
	input [7:0] InB,
	input Start,
	output Busy,
	output [7:0] Out
    );
	wire [7:0]ALUinA;
	wire [7:0]ALUinB;
	wire [7:0]ALUout;
	wire CO,Z,WE;
	wire [1:0]InsSel;
	wire [7:0]CUconst;
	wire [2:0]InMuxAdd;
	wire [3:0]OutMuxAdd;
	wire [3:0]RegAdd; 
	
	(*KEEP = "TRUE"*)	 
	RB Register_Block(.clk(clk), .reset(reset), .RegAdd(RegAdd), .InMuxAdd(InMuxAdd), 
							.InA(InA), .InB(InB), .CUconst(CUconst), .ALUout(ALUout), 
							.OutMuxAdd(OutMuxAdd), .WE(WE), .Out(Out), .ALUinA(ALUinA), 
							.ALUinB(ALUinB));
							
	ALU Arithmetic_Logic_Unit( .InsSel(InsSel), .ALUinA(ALUinA), .ALUinB(ALUinB), 
										.ALUout(ALUout), .CO(CO), .Z(Z));	
										
	CU Control_Unit( 	.Start(Start), .clk(clk), .reset(reset), .Z(Z), .CO(CO), 
							.CUconst(CUconst), .InMuxAdd(InMuxAdd), .OutMuxAdd(OutMuxAdd), 
							.RegAdd(RegAdd), .WE(WE), .InsSel(InsSel), .Busy(Busy));	
endmodule

//endmodule

// --- ALU ----------------------------------------------------------------------
module ALU(
	input [1:0] InsSel,
	input [7:0] ALUinA,
	input [7:0] ALUinB,
	output [7:0] ALUout,
	output CO,
	output Z
    );
	(*KEEP = "TRUE"*)
	wire [7:0] ANDout;
	wire [7:0] XORout;
	wire [7:0] ADDout;
	wire [7:0] CLSout;
	wire cout;
	(*KEEP = "TRUE"*)
	AND8 New_And(ALUinA, ALUinB, ANDout);
	XOR8 New_XOR(ALUinA, ALUinB, XORout);
	ADD8 New_ADD(ALUinA, ALUinB, ADDout, cout);
	CLS8 New_CLS(ALUout, CLSout);
	ZComp8to8 New_Zcomp(ALUout, Z);
	MUX4to1 MUX_ALU_OUT(.sel(InsSel), .in0(ANDout), .in1(XORout), .in2(ADDout), .in3(CLSout), .Out(ALUout));
	MUX4to1_1bit MUX_COUT(.sel(InsSel), .in0(1'b0), .in1(1'b0), .in2(cout), .in3(CLSout[0]), .Out(CO));
endmodule

// --- ALU SUBMODULES----------------------------------------------
		// --- 8-bit AND Gate -----------------
		module AND8(
			input [7:0] a,
			input [7:0] b,
			output [7:0] r
			);
			(*KEEP = "TRUE"*)
			assign r = a & b;
		endmodule

		// --- 8-bit XOR Gate -----------------
		module XOR8(
			input [7:0] a,
			input [7:0] b,
			output [7:0] r
			);
			(*KEEP = "TRUE"*)
			assign r = a ^ b;

		endmodule

		// --- 8-bit ADD Module -----------------
		module ADD8(
			input [7:0] a,
			input [7:0] b,
			output [7:0] r,
			output cout
			);
			(*KEEP = "TRUE"*)
			assign {cout,r} = a + b;
		endmodule

		// --- 8-bit Circular Left Shift Module -----------------
		module CLS8(
			input [7:0] a,
			output [7:0] r
			);
			(*KEEP = "TRUE"*)
			assign r = {a[6:0],a[7]};
		endmodule

		// --- 8-bit 8-bit Zero Comparator Module -----------------
		module ZComp8to8(
			input [7:0]a,
			output reg z
			);
			(*KEEP = "TRUE"*)
			always @(*) 
			begin
				if(a==0)
				z=1;
				else
				z=0;
			end
		endmodule

		// --- 8-bit 4-1 MUX --------------------------
		module MUX4to1(
			input [1:0] sel,
			input [7:0] in0,
			input [7:0] in1,
			input [7:0] in2,
			input [7:0] in3,
			output reg [7:0] Out);
			always@(*)begin
			case(sel)
			2'b00 : Out = in0;
			2'b01 : Out = in1;
			2'b10 : Out = in2;
			2'b11 : Out = in3;
			default : Out = 8'hxx;
			endcase
			end
		endmodule
		
		// --- 1-bit 4-1 MUX --------------------------
		module MUX4to1_1bit(
			input [1:0] sel,
			input in0,
			input in1,
			input in2,
			input in3,
			output reg Out);
			always@(*)begin
			case(sel)
			2'b00 : Out = in0;
			2'b01 : Out = in1;
			2'b10 : Out = in2;
			2'b11 : Out = in3;
			default : Out = 8'hxx;
			endcase
			end
		endmodule
// --- ALU SUBMODULES *** END ***-----------------------------------------------

// --- CU ----------------------------------------------------------------------
module CU(
	input Start,
	input clk,
	input reset,
	input Z,
	input CO,
	output reg[7:0] CUconst,
	output reg[2:0] InMuxAdd,
	output reg[3:0] OutMuxAdd,
	output reg[3:0] RegAdd,
	output reg WE,
	output reg [1:0] InsSel,
	output reg Busy
	);
		
	(*KEEP = "TRUE"*)
	localparam [3:0]
				//before_start = 4'b1111,
				s_start = 4'b0000,
				s_getA = 4'b0001,
				s_getB = 4'b0010,
				compA_B = 4'b0011,
				addAB = 4'b0100,
				compB = 4'b0101,
				subAB = 4'b0110,
				subAB1 = 4'b0111,
				subAB2 = 4'b1000,
				subAB3 = 4'b1001,
				subAB4 = 4'b1010,
				subAB5 = 4'b1011,
				ending = 4'b1111;

	reg [3:0] state_next;
	(*KEEP = "TRUE"*)
	reg [3:0] state;

	always @(posedge clk, posedge reset) begin
		if(reset==1) begin
			state <= s_start;
			Busy = 1'b0;
		end
		else if (Start) begin
			case(state)
			s_start: begin
					Busy = 1'b1;
					WE = 1'b1;
					state <= s_getA;
				end
			s_getA: begin
					RegAdd = 4'b0001;
					InMuxAdd = 3'b000;
					state <= s_getB;
				end			
			s_getB: begin 
					Busy = 1'b1;
					RegAdd = 4'b0010;
					InMuxAdd = 3'b001;
					state <= compA_B;
				end
			compA_B: begin 
					InsSel = 2'b01;
					RegAdd = 4'b0011; // COMPA_B is stored at register3
					InMuxAdd = 3'b011;
			//		repeat (1) begin
			//		@ (posedge clk) ;
			//		end
					#4
					if(Z) 
						state <= addAB;
					else
						state <= subAB;
				 end	
			addAB: begin
					InsSel = 2'b10;
					RegAdd = 4'b0000; // addAB is stored at register 0 for Out[7:0]
					InMuxAdd = 3'b011;	
					state <= ending;					
				 end
			subAB: begin 
					CUconst = 8'b1111_1111;
					InMuxAdd = 3'b010;
					RegAdd = 4'b0001;
					state <= subAB1;	
				 end
			subAB1: begin 				 
					InsSel = 2'b01;
					InMuxAdd = 3'b011;
					RegAdd = 4'b0010; // compB is stored at register 2, but need to be added by +1
					state <= subAB2;	
				 end
			subAB2: begin 					
					CUconst = 8'b0000_0001;
					InMuxAdd = 3'b010;
					RegAdd = 4'b0001;
					state <= subAB3;	
				 end
			subAB3: begin 					
					InsSel = 2'b10;
					InMuxAdd = 3'b011;
					RegAdd = 4'b0010; // compB is actually stored at register 2 at the moment
					state <= subAB4;	
				 end
			subAB4: begin 					
					RegAdd = 4'b0001;
					InMuxAdd = 3'b000; // Added A to register 1
					state <= subAB5;	
				 end
			subAB5: begin 					
					InsSel = 2'b10;
					InMuxAdd = 3'b011;	
					RegAdd = 4'b0000; // addAB is stored at register 0 for Out[7:0]
					state <= ending;	
				 end
			ending: begin 
					Busy = 1'b0;
					WE = 1'b0;

					state <= s_start;
				end		
			endcase
		end
	end
endmodule

// --- RB ----------------------------------------------------------------------
module RB(
	input clk,
	input reset,
	input [3:0] RegAdd,
	input [2:0] InMuxAdd,
	input [7:0] InA,
	input [7:0] InB,
	input [7:0] CUconst,
	input [7:0] ALUout,
	input [3:0] OutMuxAdd,
	input WE,
	output [7:0] Out,
	output [7:0] ALUinA,
	output [7:0] ALUinB);
	wire [7:0] RegIn;
	wire [7:0] RegOut;
	wire [7:0] RegOut0, RegOut1, RegOut2, RegOut3, RegOut4, RegOut5, RegOut6, RegOut7;
	wire [7:0] RegOut8, RegOut9, RegOut10, RegOut11, RegOut12, RegOut13, RegOut14, RegOut15;
	wire [15:0] RegIndex;
	(*KEEP = "TRUE"*)
	MUX8to1 InMux (InMuxAdd, InA,InB,CUconst,ALUout,RegOut,RegOut,RegOut,RegOut,RegIn);
	MUX16to1 OutMux (OutMuxAdd,RegOut0,RegOut1, RegOut2, RegOut3, RegOut4, RegOut5, RegOut6, RegOut7,
	RegOut8, RegOut9,RegOut10,RegOut11,RegOut12,RegOut13,RegOut14,RegOut15,RegOut);
	AddDec AddDec (WE,RegAdd,RegIndex);
	Register Reg0 (RegIn,RegIndex[0],clk,reset,RegOut0);
	Register Reg1 (RegIn,RegIndex[1],clk,reset,RegOut1);
	Register Reg2 (RegIn,RegIndex[2],clk,reset,RegOut2);
	Register Reg3 (RegIn,RegIndex[3],clk,reset,RegOut3);
	Register Reg4 (RegIn,RegIndex[4],clk,reset,RegOut4);
	Register Reg5 (RegIn,RegIndex[5],clk,reset,RegOut5);
	Register Reg6 (RegIn,RegIndex[6],clk,reset,RegOut6);
	Register Reg7 (RegIn,RegIndex[7],clk,reset,RegOut7);
	Register Reg8 (RegIn,RegIndex[8],clk,reset,RegOut8);
	Register Reg9 (RegIn,RegIndex[9],clk,reset,RegOut9);
	Register Reg10 (RegIn,RegIndex[10],clk,reset,RegOut10);
	Register Reg11 (RegIn,RegIndex[11],clk,reset,RegOut11);
	Register Reg12 (RegIn,RegIndex[12],clk,reset,RegOut12);
	Register Reg13 (RegIn,RegIndex[13],clk,reset,RegOut13);
	Register Reg14 (RegIn,RegIndex[14],clk,reset,RegOut14);
	Register Reg15 (RegIn,RegIndex[15],clk,reset,RegOut15);
	assign Out = RegOut0;
	assign ALUinA = RegOut1;
	assign ALUinB = RegOut2;
endmodule

// --- RB SUBMODULES------------------------------------------------------------------
		// --- 8-bit register with enable and reset -----------------
		module Register(
			input [7:0] Rin,
			input En,
			input clk,
			input reset,
			output [7:0] Rout);
			(*KEEP="TRUE"*)reg [7:0] Reg8;
			integer i; initial begin for( i=0; i<=7; i=i+1 )begin Reg8[i] <= 1'b0; end end
			assign Rout = Reg8;
			always@(posedge clk or posedge reset)begin
			if(reset)begin
			for( i=0; i<=7; i=i+1 )begin Reg8[i] <= 1'b0; end
			end
			else begin
			if(En)begin Reg8 <= Rin; end
			else begin Reg8 <= Reg8; end
			end
			end
		endmodule


		// --- 8-bit 8-1 MUX --------------------------
		module MUX8to1(
			input [2:0] sel,
			input [7:0] in0,
			input [7:0] in1,
			input [7:0] in2,
			input [7:0] in3,
			input [7:0] in4,
			input [7:0] in5,
			input [7:0] in6,
			input [7:0] in7,
			output reg [7:0] Out);
			always@(*)begin
			case(sel)
			3'b000 : Out = in0;
			3'b001 : Out = in1;
			3'b010 : Out = in2;
			3'b011 : Out = in3;
			3'b100 : Out = in4;
			3'b101 : Out = in5;
			3'b110 : Out = in6;
			3'b111 : Out = in7;
			default : Out = 8'hxx;
			endcase
			end
		endmodule

		// --- 8-bit 16-1 MUX --------------------------
		module MUX16to1(
			input [3:0] sel,
			input [7:0] in0,
			input [7:0] in1,
			input [7:0] in2,
			input [7:0] in3,
			input [7:0] in4,
			input [7:0] in5,
			input [7:0] in6,
			input [7:0] in7,
			input [7:0] in8,
			input [7:0] in9,
			input [7:0] in10,
			input [7:0] in11,
			input [7:0] in12,
			input [7:0] in13,
			input [7:0] in14,
			input [7:0] in15,
			output [7:0] Out);
			wire [7:0] tempL, tempM;
			MUX8to1 sub8to1L( sel[2:0], in0, in1, in2, in3, in4, in5, in6, in7, tempL);
			MUX8to1 sub8to1M( sel[2:0], in8, in9, in10, in11, in12, in13, in14, in15, tempM);
			assign Out = (sel[3]) ? tempM : tempL;
		endmodule

		// --- 8-bit 4-16 DECODER --------------------------
		module AddDec(
			input WE,
			input [3:0] RegAdd,
			output [15:0] RegIndex);
			assign RegIndex[0] = WE & ~RegAdd[3] & ~RegAdd[2] & ~RegAdd[1] & ~RegAdd[0];
			assign RegIndex[1] = WE & ~RegAdd[3] & ~RegAdd[2] & ~RegAdd[1] & RegAdd[0];
			assign RegIndex[2] = WE & ~RegAdd[3] & ~RegAdd[2] & RegAdd[1] & ~RegAdd[0];
			assign RegIndex[3] = WE & ~RegAdd[3] & ~RegAdd[2] & RegAdd[1] & RegAdd[0];
			assign RegIndex[4] = WE & ~RegAdd[3] & RegAdd[2] & ~RegAdd[1] & ~RegAdd[0];
			assign RegIndex[5] = WE & ~RegAdd[3] & RegAdd[2] & ~RegAdd[1] & RegAdd[0];
			assign RegIndex[6] = WE & ~RegAdd[3] & RegAdd[2] & RegAdd[1] & ~RegAdd[0];
			assign RegIndex[7] = WE & ~RegAdd[3] & RegAdd[2] & RegAdd[1] & RegAdd[0];
			assign RegIndex[8] = WE & RegAdd[3] & ~RegAdd[2] & ~RegAdd[1] & ~RegAdd[0];
			assign RegIndex[9] = WE & RegAdd[3] & ~RegAdd[2] & ~RegAdd[1] & RegAdd[0];
			assign RegIndex[10] = WE & RegAdd[3] & ~RegAdd[2] & RegAdd[1] & ~RegAdd[0];
			assign RegIndex[11] = WE & RegAdd[3] & ~RegAdd[2] & RegAdd[1] & RegAdd[0];
			assign RegIndex[12] = WE & RegAdd[3] & RegAdd[2] & ~RegAdd[1] & ~RegAdd[0];
			assign RegIndex[13] = WE & RegAdd[3] & RegAdd[2] & ~RegAdd[1] & RegAdd[0];
			assign RegIndex[14] = WE & RegAdd[3] & RegAdd[2] & RegAdd[1] & ~RegAdd[0];
			assign RegIndex[15] = WE & RegAdd[3] & RegAdd[2] & RegAdd[1] & RegAdd[0];
		endmodule
// --- RB SUBMODULES *** END ***------------------------------------------------------
















