`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:31 08/31/2011 
// Design Name: 
// Module Name:    signal_m 
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
module noise_m(clk,q
    );
	 
input clk;
output  q;

reg [11:0] LFSR =0;
always@(posedge clk) begin
	if(LFSR == 12'b0)
		LFSR<=12'b000000001;
	else  begin
		LFSR[1]<=LFSR[0];
		LFSR[2]<=LFSR[1];
		LFSR[3]<=LFSR[2];
		LFSR[4]<=LFSR[3];
        	LFSR[5]<=LFSR[4];
	        LFSR[6]<=LFSR[5];
        	LFSR[7]<=LFSR[6];
       		LFSR[8]<=LFSR[7];
		LFSR[9]<=LFSR[8];
		LFSR[10]<=LFSR[9];
		LFSR[11]<=LFSR[10];
		LFSR[0]<=LFSR[0]^LFSR[3]^LFSR[4]^LFSR[11];
	end
end

assign q=LFSR[0];

endmodule
   
