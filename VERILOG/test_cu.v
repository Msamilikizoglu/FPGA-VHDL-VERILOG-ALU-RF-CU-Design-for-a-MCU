`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:44 01/10/2018
// Design Name:   CU
// Module Name:   C:/Users/muham/Desktop/7yy/SSTU Iso Files/experiment8llllkkk/Final_project/test_cu.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cu;

	// Inputs
	reg Start;
	reg clk;
	reg reset;
	reg Z;
	reg CO;

	// Outputs
	wire [7:0] CUconst;
	wire [2:0] InMuxAdd;
	wire [3:0] OutMuxAdd;
	wire [3:0] RegAdd;
	wire WE;
	wire [1:0] InsSel;
	wire Busy;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.Start(Start), 
		.clk(clk), 
		.reset(reset), 
		.Z(Z), 
		.CO(CO), 
		.CUconst(CUconst), 
		.InMuxAdd(InMuxAdd), 
		.OutMuxAdd(OutMuxAdd), 
		.RegAdd(RegAdd), 
		.WE(WE), 
		.InsSel(InsSel), 
		.Busy(Busy)
	);

	initial begin
		// Initialize Inputs
		Start = 0;
		clk = 0;
		reset = 0;
		Z = 0;
		CO = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

