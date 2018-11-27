`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:28 01/10/2018
// Design Name:   ALU
// Module Name:   C:/Users/muham/Desktop/7yy/SSTU Iso Files/experiment8llllkkk/Final_project/test_alu.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg [1:0] InsSel;
	reg [7:0] ALUinA;
	reg [7:0] ALUinB;

	// Outputs
	wire [7:0] ALUout;
	wire CO;
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.InsSel(InsSel), 
		.ALUinA(ALUinA), 
		.ALUinB(ALUinB), 
		.ALUout(ALUout), 
		.CO(CO), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		InsSel = 0;
		ALUinA = 0;
		ALUinB = 0;

		// Wait 100 ns for global reset to finish
		#100;  
		ALUinA = 8'd5;
		ALUinB = 8'd5;
		#20;
		InsSel = 2'b01;
		#200;
		
		ALUinA = 8'd8;
		ALUinB = 8'd2;
		#200;
		
		ALUinA = 8'd12;
		ALUinB = 8'd45;
		#400;
		
		$stop;	
		// Add stimulus here
		 
		// Add stimulus here

	end
      
endmodule

