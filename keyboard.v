`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:52 08/25/2011 
// Design Name: 
// Module Name:    keyboard 
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
module keyboard(
col_o,
keycode_o ,
keytrig
,////above are outputs///////below are inputs/////////////////////////////////////
clk,
row_i
);

parameter UNI = 1'b0 ;
parameter THRESHOLD = 500 ; //about ms
parameter TRIG_PULSE_LENGTH = 5 ;
parameter COUNT_SIZE = 20 ;//about 0.6s


output	reg	[3:0]	col_o = {UNI,UNI,UNI,~UNI};
output	reg	[3:0]	keycode_o ;
output	reg		keytrig = UNI ;

input	wire		clk ;
input	wire	[3:0]	row_i ;

	reg	[COUNT_SIZE-1:0]	counter_1 = 0 ;
	reg	[3:0]	curcol_row ; 

function 	[3:0] 	to_KEYCODE;
input		[7:0]	colrow ;
begin
	case(colrow[7:4])
	{UNI,UNI,UNI,~UNI} : begin
		case(colrow[3:0])
		{UNI,UNI,UNI,~UNI}:to_KEYCODE = 4'b0000 ;
		{UNI,UNI,~UNI,UNI}:to_KEYCODE = 4'b0001 ;
		{UNI,~UNI,UNI,UNI}:to_KEYCODE = 4'b0010 ;
		{~UNI,UNI,UNI,UNI}:to_KEYCODE = 4'b0011 ;
		default:to_KEYCODE = 4'bxxxx ;
		endcase
	end
	{UNI,UNI,~UNI,UNI} : begin
		case(colrow[3:0])
		{UNI,UNI,UNI,~UNI}:to_KEYCODE = 4'b0100 ;
		{UNI,UNI,~UNI,UNI}:to_KEYCODE = 4'b0101 ;
		{UNI,~UNI,UNI,UNI}:to_KEYCODE = 4'b0110 ;
		{~UNI,UNI,UNI,UNI}:to_KEYCODE = 4'b0111 ;
		default:to_KEYCODE = 4'bxxxx ;
		endcase
	end
	{UNI,~UNI,UNI,UNI} : begin
		case(colrow[3:0])
		{UNI,UNI,UNI,~UNI}:to_KEYCODE = 4'b1000 ;
		{UNI,UNI,~UNI,UNI}:to_KEYCODE = 4'b1001 ;
		{UNI,~UNI,UNI,UNI}:to_KEYCODE = 4'b1010 ;
		{~UNI,UNI,UNI,UNI}:to_KEYCODE = 4'b1011 ;
		default:to_KEYCODE = 4'bxxxx ;
		endcase
	end
	{~UNI,UNI,UNI,UNI} : begin
		case(colrow[3:0])
		{UNI,UNI,UNI,~UNI}:to_KEYCODE = 4'b1100 ;
		{UNI,UNI,~UNI,UNI}:to_KEYCODE = 4'b1101 ;
		{UNI,~UNI,UNI,UNI}:to_KEYCODE = 4'b1110 ;
		{~UNI,UNI,UNI,UNI}:to_KEYCODE = 4'b1111 ;
		default:to_KEYCODE = 4'bxxxx ;
		endcase
	end
	default:to_KEYCODE = 4'bxxxx ;
	endcase
end
endfunction

always @(posedge clk) begin
	case(col_o)
	{UNI,UNI,UNI,~UNI} : col_o <= (col_o<<1) | {3'b000,UNI};	
	{UNI,UNI,~UNI,UNI} : col_o <= (col_o<<1) | {3'b000,UNI};	
	{UNI,~UNI,UNI,UNI} : col_o <= (col_o<<1) | {3'b000,UNI};	
	default: col_o <= {UNI,UNI,UNI,~UNI}  ;
	endcase

	if(row_i[0] == ~UNI) begin
		curcol_row <= col_o ;
		counter_1 <= counter_1 + 1 ;
		keycode_o <= to_KEYCODE({curcol_row[3:0],{UNI,UNI,UNI,~UNI}}) ;
		case(counter_1)	 
		(THRESHOLD + TRIG_PULSE_LENGTH): begin
			keytrig <= UNI ;
		end 
		THRESHOLD: begin
			keytrig <= ~UNI ;	
		end
		default: begin
			keytrig <= keytrig ;
		end
		endcase
	end else 
		if(row_i[1] == ~UNI) begin
			curcol_row <= col_o ;
			counter_1 <= counter_1 + 1 ;
			keycode_o <= to_KEYCODE({curcol_row[3:0],{UNI,UNI,~UNI,UNI}}) ;
			case(counter_1)	 
			(THRESHOLD + TRIG_PULSE_LENGTH): begin
				keytrig <= UNI ;
			end 
			THRESHOLD: begin
				keytrig <= ~UNI ;	
			end
			default: begin
				keytrig <= keytrig ;
			end
			endcase
		end else
			if(row_i[2] == ~UNI) begin
				curcol_row <= col_o ;
				counter_1 <= counter_1 + 1 ;
				keycode_o <= to_KEYCODE({curcol_row[3:0],{UNI,~UNI,UNI,UNI}}) ;
				case(counter_1)	 
				(THRESHOLD + TRIG_PULSE_LENGTH): begin
					keytrig <= UNI ;
				end 
				THRESHOLD: begin
					keytrig <= ~UNI ;	
				end
				default: begin
					keytrig <= keytrig ;
				end
				endcase
			end else 
				if(row_i[3] == ~UNI) begin
					curcol_row <= col_o ;
					counter_1 <= counter_1 + 1 ;
					keycode_o <= to_KEYCODE({curcol_row[3:0],{~UNI,UNI,UNI,UNI}}) ;
					case(counter_1)	 
					(THRESHOLD + TRIG_PULSE_LENGTH): begin
						keytrig <= UNI ;
					end 
					THRESHOLD: begin
						keytrig <= ~UNI ;	
					end
					default: begin
						keytrig <= keytrig ;
					end
					endcase
				end else begin
					if(col_o == curcol_row)begin
						counter_1 <= 0 ;
						keytrig <= UNI ;
						keycode_o <= 4'bxxxx ;
					end
				end
end
/*
always @(negedge clk) begin
	if(col_o == 4'b1011) 
		row_i[3:0] <= 4'b1110 ;
	else
		row_i[3:0] <= 4'bzzzz ;
end
*/
endmodule
