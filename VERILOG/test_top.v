`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:44:32 01/10/2018
// Design Name:   TOP
// Module Name:   C:/Users/muham/Desktop/7yy/SSTU Iso Files/experiment8llllkkk/Final_project/test_top.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] InA;
	reg [7:0] InB;
	reg Start;

	// Outputs
	wire Busy;
	wire [7:0] Out;

	// Instantiate the Unit Under Test (UUT)
	TOP uut (
		.clk(clk), 
		.reset(reset), 
		.InA(InA), 
		.InB(InB), 
		.Start(Start), 
		.Busy(Busy), 
		.Out(Out)
	);
	
	always begin
		clk = 1;
		#2;
		clk = 0;
		#2;	
	end


	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		InA = 0;
		InB = 0;
		Start = 0;

		// Wait 100 ns for global reset to finish
		#100;		
		reset = 1;
		#40;
		reset = 0;
		#40;
		// Add stimulus here
		InA = 8'd5;
		InB = 8'd5;
		Start = 1;
		
		#2000;

		InA = 8'd90;
		InB = 8'd14;
		Start = 1;
		
		#2000;

		InA = 8'd120;
		InB = 8'd120;
		Start = 1;
		
		#2000;
		
		InA = 8'd50;
		InB = 8'd200;
		Start = 1;
		
		#2000;
		
				
		InA = 8'd11;
		InB = 8'd1;
		Start = 1;
		
		#2000;
		
		$stop;	
		// Add stimulus here

        
		// Add stimulus here

	end
      
endmodule

