`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:55:00 01/10/2018
// Design Name:   ALU
// Module Name:   C:/Users/muham/Desktop/7yy/SSTU Iso Files/experiment8llllkkk/Final_project/tes_alu2.v
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

module tes_alu2;

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
        
		// Add stimulus here

	end
      
endmodule

