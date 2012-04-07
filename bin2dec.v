`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:20 08/23/2011 
// Design Name: 
// Module Name:    bin2dec 
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
module bin2dec(
rfd,
clk
);
//outputs
output	wire		rfd								;
//inputs
input	wire		clk								;
//wires
	wire	[31:0]	in								;
	wire	[31:0]	quotient							;
	wire	[3:0]	fractional							;

	wire	[3:0]	radix								;

	wire	[31:0]	w_10_9								;
	wire	[31:0]	w_9_8								;
//registers
	reg	[31:0]	dividend = 32'd3932257						;
	reg	[9:0]	remainder[3:0]							;
	reg	[3:0]	counter = 0							;
assign	radix = 4'd10 ;

div_gen div_10(	.clk(clk) ,
		.rfd(rfd) ,
		.divisor(radix) ,
		.dividend(dividend) ,
		.fractional(fractional) ,
		.quotient(quotient) );




/*
always@(posedge	clk) begin
	dividend <= dividend - 1 ;
	dividend <= quotient ;	
//shift register
	remainder[9] <= fractional ;
	remainder[8] <= remainder[9] ;
	remainder[7] <= remainder[8] ;
	remainder[6] <= remainder[7] ;
	remainder[5] <= remainder[6] ;
	remainder[4] <= remainder[5] ;
	remainder[3] <= remainder[4] ;
	remainder[2] <= remainder[3] ;
	remainder[1] <= remainder[2] ;
	remainder[0] <= remainder[1] ;
	if(counter < 4'd10) begin
		counter <= counter + 1 ;
	end else begin
		counter <= 0 ;
	end
end
	*/
endmodule
