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
module signal_m(clk,areset,oen,q,q_m
    );
	 
input clk;
input areset;
input oen;

output  q;
output q_m;

reg [7:0] LFSR = 0;

always@(posedge clk) begin
	if(~areset)
		LFSR<=9'b000000001;
	else if(~oen) begin
		LFSR[1]<=LFSR[0];
		LFSR[2]<=LFSR[1];
		LFSR[3]<=LFSR[2];
		LFSR[4]<=LFSR[3];
		LFSR[5]<=LFSR[4];
		LFSR[6]<=LFSR[5];
		LFSR[7]<=LFSR[6];
        
		LFSR[0]<=LFSR[1]^LFSR[2]^LFSR[3]^LFSR[7];
	end
end

assign q_m=LFSR[0]^clk;
assign q=LFSR[0];

endmodule
