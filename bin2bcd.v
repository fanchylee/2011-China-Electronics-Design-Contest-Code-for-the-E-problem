`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: none
// Engineer: fanchy
// 
// Create Date:    00:30:10 08/26/2011 
// Design Name: 
// Module Name:    bin2bcd 
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
module bin2bcd(CLK,RESET,ENABLE,  BIN ,BCD_o);

parameter INPUT_SIZE = 32 ; //bits
parameter OUTPUT_SIZE = 10 ; //decimal digits
parameter COUNT_SIZE = 6   ;//bits



integer k = 1 ;

output	reg	[OUTPUT_SIZE * 4 -1:0]  BCD_o =0 ;
input					CLK;
input		[INPUT_SIZE-1:0]	BIN;
input   				ENABLE;
input   				RESET;

	reg	[OUTPUT_SIZE * 4 -1:0]  BCD =0 ;
	reg	[COUNT_SIZE:0]		CNT = 0;
	reg	[3:0]			BCD_t = 0; 
	reg	[INPUT_SIZE-1:0]	BIN_INPUT=0;

function       [3:0]   CORRECT;
// The CORRECT function adds 3 when the number is equal or more than 5
input   [3:0]   DECADE;
begin
	CORRECT = (DECADE >= 5)?(DECADE+3):(DECADE);
end
endfunction

always @ (posedge CLK or posedge RESET) begin
	if(RESET) begin//asynhronous reset
		//conversion takes INPUT_SIZE+1 clock cycles
		CNT = INPUT_SIZE+1;
		BCD = 0 ;
		//below line is necessary for Metamor VHDL complier
		//Metamor Reports: WARNING : Flip-flop 'BIN_INPUT' has missing set or reset
		BIN_INPUT = 0 ;
	end else begin//active clock edge
		if(ENABLE) begin
			if(CNT == INPUT_SIZE + 1 ) begin
				//start conversion; latch input BIN number
				BIN_INPUT = BIN;
				CNT = CNT -1;
			end else begin
				if (CNT == 0) begin
					BCD_o = BCD ;	
				end else begin
					for(k = 1 ; k <= OUTPUT_SIZE ; k = k + 1) begin
						BCD_t[0] = BCD[(k-1)* 4] ;
						BCD_t[1] = BCD[(k-1)* 4 + 1];
						BCD_t[2] = BCD[(k-1)* 4 + 2] ;
						BCD_t[3] = BCD[(k-1)* 4 + 3] ;
						BCD_t[3:0] = CORRECT(BCD_t[3:0]) ;
						BCD[(k-1)* 4]  = BCD_t[0];    				
                                        	BCD[(k-1)* 4 + 1] = BCD_t[1]	;
						BCD[(k-1)* 4 + 2] = BCD_t[2]	;
						BCD[(k-1)* 4 + 3] = BCD_t[3]	;
					end//this for-loop generates combinational logic
					CNT = CNT -1;//conversion section
					BCD = (BCD<<1);//shift one bit left the BCD register
					BCD[0] = BIN_INPUT[INPUT_SIZE - 1];//MSB bit of BIN is shifted as LSB of BCD
					BIN_INPUT = BIN_INPUT<<1;//shift one bit left the BIN_INPUT number
				end
			end
		end
	end
end
endmodule
