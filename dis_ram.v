
module dis_ram(
out,
lcd_en,
lcd_rst ,
addr_db,
done_w
,
rst_w,
clk_w,
en_w,
clk,
in,
mode
);


	
parameter	dd=4'b0000 ;
parameter	gd=4'b0001 ;
parameter	dd_de=4'b0010 ;
parameter	gd_de=4'b0011 ;

`include "dis_ram_par.v"

output	wire	[15:0]	out ;
output	wire		lcd_en ;
output	wire		lcd_rst ;
output	wire	[9:0]	addr_db ;
output	reg		done_w;

input	wire	[15:0]	in ;
input	wire		clk ; //for display , cannot be large than 10KHz
input	wire	[7:0]	mode ;
input	wire		clk_w ;
input	wire		en_w ;
input	wire		rst_w ;
	
	wire		en_wr ;

	reg	[3:0]	addr_db_x ;
	reg	[5:0]	addr_db_y ;
	reg	[10:0]	addr_w ;

	reg		en_internal ;
	reg		z_can_be_deleted=1 ;
	reg		zero2space=0 ;
	reg	[10:0]	addr_r = 11'b0;
/* display ram for 128x64*/
	reg	[15:0]	line_0 [15:0] ;
	reg	[15:0]	line_1 [15:0] ;

	wire		zero ;
	wire	[4:0]	qc12864_display_ram_address ;
	wire		out_z ;
//	wire		dis_fifo_full,dis_fifo_empty,dis_fifo_af,dis_fifo_ae ,dis_fifo_rst ;

/*
shift_ram_display 	qc12864_display_ram(	
					.a(qc12864_display_ram_address)	, 
					.q({out[15:5],out_z,out[3:0]}),	
					.d(in),
					.clk(clk)	);
*/

integer	i = 0 ;
blk_mem_gen_v4_3  bram_dis(
	.enb(1'b1),
	.clka(clk_w),
	.wea(en_wr), // Bus [0 : 0] 
	.addra(addr_w), // Bus [10 : 0] 
	.dina(in), // Bus [15 : 0] 
	.clkb(clk),
	.addrb(addr_r), // Bus [10 : 0] 
	.doutb({out[15:5],out_z,out[3:0]})
); // Bus [15 : 0] 


assign	addr_db[9:0] = {addr_db_y[5:0],addr_db_x[3:0]} ;
assign	en_wr = en_w & en_internal ;
assign	qc12864_display_ram_address = 5'b11110 ;
assign	lcd_en = (~(	out[0] | 
			out[1] | 
			out[2] | 
			out[3] | 
			out[4] | 
			out[5] | 
			out[6] | 
			out[7] | 
			out[8]) 
		)| zero | clk 		;

assign	zero = (out[7:0] == "0" ) & out[8] & mode[5] & z_can_be_deleted; //delete zeros in display 
assign	out[4] = out_z & (zero2space | (~z_can_be_deleted)) ;
assign	lcd_rst = 1;//keycode[0] | keycode[1] | keycode[2] | keycode[3]  | (~keytrig) ;
//assign		qc12864_rst = ~keytrig ;
/*
function	[9:0]	addr2addr_db_dd
input	[10:0]	addr ;
begin
	if(addr - DD_LINE_0) begin
		
	end
end
endfunction
*/

always @(mode[4] or out[8:5] or out_z or out[3:0]) begin
	if(mode[4] & out[8]) begin
		if({out[7:5],out_z,out[3:0]} == "0") begin
			zero2space = 0 ;	
		end else begin
			zero2space = 1 ;
		end
	end else begin
		zero2space = 1 ;
	end
end

always @(posedge clk_w) begin
	if(rst_w) begin
		case(mode[3:0])
		dd:
		begin
			addr_w <= DD_LINE_0;
			en_internal <= 0 ;
			done_w <= 0 ;
		end	
		gd:
		begin
			addr_w <= GD_LINE_0;
			en_internal <= 0 ;
			done_w <= 0 ;
		end
		default:
		begin
			en_internal <= 0 ;
			done_w <= 0 ;
		end	
		endcase
	end else begin
		if(~done_w)
			addr_w <= addr_w + 1 ;
		case(mode[3:0]) 
		dd:
		begin
			case(addr_w)
			DD_LINE_0 + 0 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 1 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 2 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 3 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 4 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 5 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 6 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 7 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 8 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 9 :begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 10:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 11:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 12:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 13:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 14:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_0 + 15:begin addr_db_y <=0  ;addr_db_x <= addr_w - DD_LINE_0 ;en_internal <= 1 ; end
			DD_LINE_1 + 0 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 1 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 2 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 3 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 4 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 5 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 6 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 7 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 8 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 9 :begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 10:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 11:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 12:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 13:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 14:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_1 + 15:begin addr_db_y <=1  ;addr_db_x <= addr_w - DD_LINE_1 ;en_internal <= 1 ; end
			DD_LINE_2 + 0 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 1 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 2 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 3 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 4 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 5 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 6 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 7 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 8 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 9 :begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 10:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 11:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 12:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 13:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 14:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_2 + 15:begin addr_db_y <=2  ;addr_db_x <= addr_w - DD_LINE_2 ;en_internal <= 1 ; end
			DD_LINE_3 + 0 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 1 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 2 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 3 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 4 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 5 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 6 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 7 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 8 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 9 :begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 10:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 11:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 12:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 13:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 14:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 15:begin addr_db_y <=3  ;addr_db_x <= addr_w - DD_LINE_3 ;en_internal <= 1 ; end
			DD_LINE_3 + 16:
			begin
				done_w <= 1 ;
				en_internal <= 0 ;
			end
			default:
			begin
				en_internal <= 0 ;
			end
			endcase
		end
		gd:
		begin
			case(addr_w)
			GD_LINE_0   +  0 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  1 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  2 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  3 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  4 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  5 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  6 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  7 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  8 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  9 :begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  10:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  11:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  12:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  13:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  14:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_0   +  15:begin addr_db_y <=0   ;addr_db_x <= addr_w - GD_LINE_0    ;en_internal <= 1 ; end
			GD_LINE_1   +  0 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  1 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  2 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  3 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  4 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  5 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  6 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  7 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  8 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  9 :begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  10:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  11:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  12:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  13:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  14:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_1   +  15:begin addr_db_y <=1   ;addr_db_x <= addr_w - GD_LINE_1    ;en_internal <= 1 ; end
			GD_LINE_2   +  0 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  1 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  2 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  3 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  4 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  5 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  6 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  7 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  8 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  9 :begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  10:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  11:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  12:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  13:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  14:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_2   +  15:begin addr_db_y <=2   ;addr_db_x <= addr_w - GD_LINE_2    ;en_internal <= 1 ; end
			GD_LINE_3   +  0 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  1 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  2 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  3 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  4 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  5 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  6 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  7 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  8 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  9 :begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  10:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  11:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  12:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  13:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  14:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_3   +  15:begin addr_db_y <=3   ;addr_db_x <= addr_w - GD_LINE_3    ;en_internal <= 1 ; end
			GD_LINE_4   +  0 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  1 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  2 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  3 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  4 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  5 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  6 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  7 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  8 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  9 :begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  10:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  11:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  12:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  13:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  14:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_4   +  15:begin addr_db_y <=4   ;addr_db_x <= addr_w - GD_LINE_4    ;en_internal <= 1 ; end
			GD_LINE_5   +  0 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  1 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  2 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  3 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  4 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  5 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  6 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  7 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  8 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  9 :begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  10:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  11:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  12:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  13:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  14:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_5   +  15:begin addr_db_y <=5   ;addr_db_x <= addr_w - GD_LINE_5    ;en_internal <= 1 ; end
			GD_LINE_6   +  0 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  1 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  2 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  3 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  4 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  5 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  6 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  7 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  8 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  9 :begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  10:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  11:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  12:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  13:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  14:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_6   +  15:begin addr_db_y <=6   ;addr_db_x <= addr_w - GD_LINE_6    ;en_internal <= 1 ; end
			GD_LINE_7   +  0 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  1 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  2 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  3 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  4 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  5 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  6 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  7 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  8 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  9 :begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  10:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  11:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  12:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  13:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  14:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_7   +  15:begin addr_db_y <=7   ;addr_db_x <= addr_w - GD_LINE_7    ;en_internal <= 1 ; end
			GD_LINE_8   +  0 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  1 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  2 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  3 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  4 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  5 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  6 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  7 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  8 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  9 :begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  10:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  11:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  12:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  13:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  14:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_8   +  15:begin addr_db_y <=8   ;addr_db_x <= addr_w - GD_LINE_8    ;en_internal <= 1 ; end
			GD_LINE_9   +  0 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  1 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  2 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  3 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  4 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  5 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  6 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  7 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  8 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  9 :begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  10:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  11:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  12:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  13:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  14:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_9   +  15:begin addr_db_y <=9   ;addr_db_x <= addr_w - GD_LINE_9    ;en_internal <= 1 ; end
			GD_LINE_10  +  0 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  1 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  2 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  3 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  4 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  5 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  6 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  7 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  8 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  9 :begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  10:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  11:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  12:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  13:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  14:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_10  +  15:begin addr_db_y <=10  ;addr_db_x <= addr_w - GD_LINE_10   ;en_internal <= 1 ; end
			GD_LINE_11  +  0 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  1 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  2 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  3 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  4 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  5 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  6 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  7 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  8 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  9 :begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  10:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  11:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  12:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  13:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  14:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_11  +  15:begin addr_db_y <=11  ;addr_db_x <= addr_w - GD_LINE_11   ;en_internal <= 1 ; end
			GD_LINE_12  +  0 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  1 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  2 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  3 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  4 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  5 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  6 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  7 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  8 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  9 :begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  10:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  11:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  12:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  13:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  14:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_12  +  15:begin addr_db_y <=12  ;addr_db_x <= addr_w - GD_LINE_12   ;en_internal <= 1 ; end
			GD_LINE_13  +  0 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  1 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  2 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  3 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  4 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  5 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  6 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  7 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  8 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  9 :begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  10:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  11:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  12:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  13:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  14:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_13  +  15:begin addr_db_y <=13  ;addr_db_x <= addr_w - GD_LINE_13   ;en_internal <= 1 ; end
			GD_LINE_14  +  0 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  1 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  2 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  3 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  4 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  5 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  6 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  7 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  8 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  9 :begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  10:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  11:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  12:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  13:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  14:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_14  +  15:begin addr_db_y <=14  ;addr_db_x <= addr_w - GD_LINE_14   ;en_internal <= 1 ; end
			GD_LINE_15  +  0 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  1 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  2 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  3 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  4 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  5 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  6 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  7 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  8 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  9 :begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  10:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  11:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  12:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  13:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  14:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_15  +  15:begin addr_db_y <=15  ;addr_db_x <= addr_w - GD_LINE_15   ;en_internal <= 1 ; end
			GD_LINE_16  +  0 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  1 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  2 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  3 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  4 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  5 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  6 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  7 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  8 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  9 :begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  10:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  11:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  12:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  13:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  14:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_16  +  15:begin addr_db_y <=16  ;addr_db_x <= addr_w - GD_LINE_16   ;en_internal <= 1 ; end
			GD_LINE_17  +  0 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  1 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  2 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  3 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  4 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  5 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  6 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  7 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  8 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  9 :begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  10:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  11:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  12:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  13:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  14:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_17  +  15:begin addr_db_y <=17  ;addr_db_x <= addr_w - GD_LINE_17   ;en_internal <= 1 ; end
			GD_LINE_18  +  0 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  1 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  2 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  3 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  4 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  5 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  6 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  7 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  8 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  9 :begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  10:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  11:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  12:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  13:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  14:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_18  +  15:begin addr_db_y <=18  ;addr_db_x <= addr_w - GD_LINE_18   ;en_internal <= 1 ; end
			GD_LINE_19  +  0 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  1 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  2 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  3 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  4 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  5 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  6 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  7 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  8 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  9 :begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  10:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  11:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  12:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  13:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  14:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_19  +  15:begin addr_db_y <=19  ;addr_db_x <= addr_w - GD_LINE_19   ;en_internal <= 1 ; end
			GD_LINE_20  +  0 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  1 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  2 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  3 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  4 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  5 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  6 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  7 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  8 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  9 :begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  10:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  11:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  12:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  13:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  14:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_20  +  15:begin addr_db_y <=20  ;addr_db_x <= addr_w - GD_LINE_20   ;en_internal <= 1 ; end
			GD_LINE_21  +  0 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  1 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  2 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  3 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  4 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  5 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  6 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  7 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  8 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  9 :begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  10:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  11:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  12:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  13:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  14:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_21  +  15:begin addr_db_y <=21  ;addr_db_x <= addr_w - GD_LINE_21   ;en_internal <= 1 ; end
			GD_LINE_22  +  0 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  1 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  2 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  3 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  4 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  5 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  6 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  7 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  8 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  9 :begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  10:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  11:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  12:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  13:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  14:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_22  +  15:begin addr_db_y <=22  ;addr_db_x <= addr_w - GD_LINE_22   ;en_internal <= 1 ; end
			GD_LINE_23  +  0 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  1 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  2 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  3 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  4 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  5 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  6 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  7 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  8 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  9 :begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  10:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  11:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  12:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  13:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  14:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_23  +  15:begin addr_db_y <=23  ;addr_db_x <= addr_w - GD_LINE_23   ;en_internal <= 1 ; end
			GD_LINE_24  +  0 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  1 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  2 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  3 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  4 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  5 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  6 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  7 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  8 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  9 :begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  10:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  11:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  12:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  13:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  14:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_24  +  15:begin addr_db_y <=24  ;addr_db_x <= addr_w - GD_LINE_24   ;en_internal <= 1 ; end
			GD_LINE_25  +  0 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  1 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  2 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  3 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  4 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  5 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  6 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  7 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  8 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  9 :begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  10:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  11:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  12:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  13:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  14:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_25  +  15:begin addr_db_y <=25  ;addr_db_x <= addr_w - GD_LINE_25   ;en_internal <= 1 ; end
			GD_LINE_26  +  0 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  1 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  2 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  3 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  4 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  5 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  6 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  7 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  8 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  9 :begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  10:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  11:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  12:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  13:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  14:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_26  +  15:begin addr_db_y <=26  ;addr_db_x <= addr_w - GD_LINE_26   ;en_internal <= 1 ; end
			GD_LINE_27  +  0 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  1 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  2 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  3 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  4 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  5 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  6 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  7 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  8 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  9 :begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  10:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  11:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  12:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  13:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  14:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_27  +  15:begin addr_db_y <=27  ;addr_db_x <= addr_w - GD_LINE_27   ;en_internal <= 1 ; end
			GD_LINE_28  +  0 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  1 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  2 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  3 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  4 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  5 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  6 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  7 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  8 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  9 :begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  10:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  11:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  12:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  13:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  14:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_28  +  15:begin addr_db_y <=28  ;addr_db_x <= addr_w - GD_LINE_28   ;en_internal <= 1 ; end
			GD_LINE_29  +  0 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  1 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  2 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  3 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  4 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  5 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  6 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  7 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  8 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  9 :begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  10:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  11:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  12:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  13:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  14:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_29  +  15:begin addr_db_y <=29  ;addr_db_x <= addr_w - GD_LINE_29   ;en_internal <= 1 ; end
			GD_LINE_30  +  0 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  1 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  2 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  3 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  4 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  5 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  6 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  7 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  8 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  9 :begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  10:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  11:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  12:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  13:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  14:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_30  +  15:begin addr_db_y <=30  ;addr_db_x <= addr_w - GD_LINE_30   ;en_internal <= 1 ; end
			GD_LINE_31  +  0 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  1 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  2 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  3 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  4 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  5 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  6 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  7 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  8 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  9 :begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  10:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  11:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  12:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  13:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  14:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_31  +  15:begin addr_db_y <=31  ;addr_db_x <= addr_w - GD_LINE_31   ;en_internal <= 1 ; end
			GD_LINE_32  +  0 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  1 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  2 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  3 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  4 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  5 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  6 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  7 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  8 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  9 :begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  10:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  11:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  12:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  13:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  14:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_32  +  15:begin addr_db_y <=32  ;addr_db_x <= addr_w - GD_LINE_32   ;en_internal <= 1 ; end
			GD_LINE_33  +  0 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  1 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  2 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  3 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  4 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  5 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  6 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  7 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  8 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  9 :begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  10:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  11:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  12:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  13:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  14:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_33  +  15:begin addr_db_y <=33  ;addr_db_x <= addr_w - GD_LINE_33   ;en_internal <= 1 ; end
			GD_LINE_34  +  0 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  1 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  2 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  3 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  4 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  5 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  6 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  7 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  8 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  9 :begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  10:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  11:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  12:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  13:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  14:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_34  +  15:begin addr_db_y <=34  ;addr_db_x <= addr_w - GD_LINE_34   ;en_internal <= 1 ; end
			GD_LINE_35  +  0 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  1 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  2 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  3 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  4 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  5 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  6 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  7 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  8 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  9 :begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  10:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  11:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  12:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  13:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  14:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_35  +  15:begin addr_db_y <=35  ;addr_db_x <= addr_w - GD_LINE_35   ;en_internal <= 1 ; end
			GD_LINE_36  +  0 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  1 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  2 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  3 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  4 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  5 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  6 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  7 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  8 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  9 :begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  10:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  11:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  12:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  13:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  14:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_36  +  15:begin addr_db_y <=36  ;addr_db_x <= addr_w - GD_LINE_36   ;en_internal <= 1 ; end
			GD_LINE_37  +  0 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  1 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  2 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  3 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  4 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  5 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  6 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  7 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  8 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  9 :begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  10:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  11:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  12:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  13:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  14:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_37  +  15:begin addr_db_y <=37  ;addr_db_x <= addr_w - GD_LINE_37   ;en_internal <= 1 ; end
			GD_LINE_38  +  0 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  1 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  2 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  3 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  4 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  5 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  6 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  7 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  8 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  9 :begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  10:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  11:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  12:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  13:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  14:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_38  +  15:begin addr_db_y <=38  ;addr_db_x <= addr_w - GD_LINE_38   ;en_internal <= 1 ; end
			GD_LINE_39  +  0 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  1 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  2 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  3 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  4 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  5 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  6 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  7 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  8 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  9 :begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  10:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  11:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  12:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  13:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  14:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_39  +  15:begin addr_db_y <=39  ;addr_db_x <= addr_w - GD_LINE_39   ;en_internal <= 1 ; end
			GD_LINE_40  +  0 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  1 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  2 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  3 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  4 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  5 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  6 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  7 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  8 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  9 :begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  10:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  11:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  12:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  13:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  14:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_40  +  15:begin addr_db_y <=40  ;addr_db_x <= addr_w - GD_LINE_40   ;en_internal <= 1 ; end
			GD_LINE_41  +  0 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  1 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  2 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  3 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  4 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  5 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  6 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  7 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  8 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  9 :begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  10:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  11:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  12:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  13:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  14:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_41  +  15:begin addr_db_y <=41  ;addr_db_x <= addr_w - GD_LINE_41   ;en_internal <= 1 ; end
			GD_LINE_42  +  0 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  1 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  2 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  3 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  4 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  5 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  6 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  7 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  8 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  9 :begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  10:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  11:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  12:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  13:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  14:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_42  +  15:begin addr_db_y <=42  ;addr_db_x <= addr_w - GD_LINE_42   ;en_internal <= 1 ; end
			GD_LINE_43  +  0 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  1 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  2 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  3 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  4 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  5 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  6 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  7 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  8 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  9 :begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  10:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  11:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  12:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  13:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  14:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_43  +  15:begin addr_db_y <=43  ;addr_db_x <= addr_w - GD_LINE_43   ;en_internal <= 1 ; end
			GD_LINE_44  +  0 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  1 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  2 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  3 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  4 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  5 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  6 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  7 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  8 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  9 :begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  10:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  11:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  12:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  13:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  14:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_44  +  15:begin addr_db_y <=44  ;addr_db_x <= addr_w - GD_LINE_44   ;en_internal <= 1 ; end
			GD_LINE_45  +  0 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  1 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  2 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  3 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  4 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  5 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  6 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  7 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  8 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  9 :begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  10:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  11:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  12:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  13:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  14:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_45  +  15:begin addr_db_y <=45  ;addr_db_x <= addr_w - GD_LINE_45   ;en_internal <= 1 ; end
			GD_LINE_46  +  0 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  1 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  2 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  3 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  4 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  5 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  6 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  7 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  8 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  9 :begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  10:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  11:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  12:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  13:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  14:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_46  +  15:begin addr_db_y <=46  ;addr_db_x <= addr_w - GD_LINE_46   ;en_internal <= 1 ; end
			GD_LINE_47  +  0 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  1 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  2 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  3 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  4 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  5 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  6 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  7 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  8 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  9 :begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  10:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  11:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  12:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  13:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  14:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_47  +  15:begin addr_db_y <=47  ;addr_db_x <= addr_w - GD_LINE_47   ;en_internal <= 1 ; end
			GD_LINE_48  +  0 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  1 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  2 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  3 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  4 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  5 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  6 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  7 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  8 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  9 :begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  10:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  11:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  12:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  13:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  14:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_48  +  15:begin addr_db_y <=48  ;addr_db_x <= addr_w - GD_LINE_48   ;en_internal <= 1 ; end
			GD_LINE_49  +  0 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  1 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  2 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  3 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  4 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  5 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  6 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  7 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  8 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  9 :begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  10:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  11:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  12:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  13:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  14:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_49  +  15:begin addr_db_y <=49  ;addr_db_x <= addr_w - GD_LINE_49   ;en_internal <= 1 ; end
			GD_LINE_50  +  0 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  1 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  2 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  3 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  4 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  5 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  6 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  7 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  8 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  9 :begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  10:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  11:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  12:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  13:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  14:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_50  +  15:begin addr_db_y <=50  ;addr_db_x <= addr_w - GD_LINE_50   ;en_internal <= 1 ; end
			GD_LINE_51  +  0 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  1 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  2 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  3 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  4 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  5 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  6 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  7 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  8 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  9 :begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  10:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  11:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  12:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  13:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  14:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_51  +  15:begin addr_db_y <=51  ;addr_db_x <= addr_w - GD_LINE_51   ;en_internal <= 1 ; end
			GD_LINE_52  +  0 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  1 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  2 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  3 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  4 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  5 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  6 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  7 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  8 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  9 :begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  10:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  11:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  12:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  13:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  14:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_52  +  15:begin addr_db_y <=52  ;addr_db_x <= addr_w - GD_LINE_52   ;en_internal <= 1 ; end
			GD_LINE_53  +  0 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  1 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  2 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  3 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  4 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  5 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  6 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  7 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  8 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  9 :begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  10:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  11:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  12:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  13:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  14:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_53  +  15:begin addr_db_y <=53  ;addr_db_x <= addr_w - GD_LINE_53   ;en_internal <= 1 ; end
			GD_LINE_54  +  0 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  1 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  2 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  3 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  4 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  5 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  6 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  7 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  8 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  9 :begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  10:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  11:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  12:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  13:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  14:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_54  +  15:begin addr_db_y <=54  ;addr_db_x <= addr_w - GD_LINE_54   ;en_internal <= 1 ; end
			GD_LINE_55  +  0 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  1 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  2 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  3 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  4 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  5 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  6 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  7 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  8 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  9 :begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  10:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  11:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  12:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  13:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  14:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_55  +  15:begin addr_db_y <=55  ;addr_db_x <= addr_w - GD_LINE_55   ;en_internal <= 1 ; end
			GD_LINE_56  +  0 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  1 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  2 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  3 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  4 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  5 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  6 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  7 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  8 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  9 :begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  10:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  11:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  12:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  13:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  14:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_56  +  15:begin addr_db_y <=56  ;addr_db_x <= addr_w - GD_LINE_56   ;en_internal <= 1 ; end
			GD_LINE_57  +  0 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  1 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  2 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  3 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  4 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  5 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  6 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  7 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  8 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  9 :begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  10:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  11:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  12:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  13:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  14:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_57  +  15:begin addr_db_y <=57  ;addr_db_x <= addr_w - GD_LINE_57   ;en_internal <= 1 ; end
			GD_LINE_58  +  0 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  1 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  2 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  3 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  4 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  5 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  6 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  7 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  8 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  9 :begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  10:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  11:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  12:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  13:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  14:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_58  +  15:begin addr_db_y <=58  ;addr_db_x <= addr_w - GD_LINE_58   ;en_internal <= 1 ; end
			GD_LINE_59  +  0 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  1 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  2 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  3 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  4 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  5 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  6 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  7 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  8 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  9 :begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  10:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  11:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  12:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  13:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  14:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_59  +  15:begin addr_db_y <=59  ;addr_db_x <= addr_w - GD_LINE_59   ;en_internal <= 1 ; end
			GD_LINE_60  +  0 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  1 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  2 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  3 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  4 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  5 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  6 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  7 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  8 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  9 :begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  10:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  11:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  12:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  13:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  14:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_60  +  15:begin addr_db_y <=60  ;addr_db_x <= addr_w - GD_LINE_60   ;en_internal <= 1 ; end
			GD_LINE_61  +  0 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  1 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  2 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  3 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  4 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  5 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  6 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  7 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  8 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  9 :begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  10:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  11:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  12:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  13:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  14:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_61  +  15:begin addr_db_y <=61  ;addr_db_x <= addr_w - GD_LINE_61   ;en_internal <= 1 ; end
			GD_LINE_62  +  0 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  1 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  2 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  3 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  4 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  5 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  6 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  7 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  8 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  9 :begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  10:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  11:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  12:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  13:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  14:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_62  +  15:begin addr_db_y <=62  ;addr_db_x <= addr_w - GD_LINE_62   ;en_internal <= 1 ; end
			GD_LINE_63  +  0 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  1 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  2 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  3 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  4 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  5 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  6 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  7 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  8 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  9 :begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  10:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  11:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  12:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  13:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  14:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  15:begin addr_db_y <=63  ;addr_db_x <= addr_w - GD_LINE_63   ;en_internal <= 1 ; end
			GD_LINE_63  +  16:
			begin
				done_w <= 1 ;
				en_internal <= 0 ;
			end
			default:
			begin
				en_internal <= 0 ;
			end
			endcase
		end
		default:
		begin
			en_internal <= 0 ;
		end
		endcase
	end

end

always @(posedge clk) begin
	casez({out[11:5],out_z,out[3:0]})
	{4'b0000,8'b????????} 	:z_can_be_deleted <= 1 ;
	{4'b0001,"0"}		:z_can_be_deleted <= z_can_be_deleted ;
	{4'b0001,"."}		:z_can_be_deleted <= 1 ;
	{4'b1001,8'b????????}	:z_can_be_deleted <= 1 ;//下一位的零必须不显示
	{4'b0101,8'b????????}	:z_can_be_deleted <= 0 ;//下一位的零必须显示
	default			:z_can_be_deleted <= 0 ;
	endcase

	case(mode[3:0])
	dd:
	begin
		if(addr_r < 11'd128) begin
			addr_r <= addr_r + 1 ;		
		end else begin
			addr_r <= 11'd16;
		end
	end
	gd:
	begin
		if(addr_r < 11'd1450) begin
			addr_r <= addr_r + 1 ;		
		end else begin
			addr_r <= 11'd120 ;
		end
		
	end
	default:
	begin
		if(addr_r < 11'd128) begin
			addr_r <= addr_r + 1 ;		
		end else begin
			addr_r <= 11'd33 ;
		end
	end
	endcase
end

endmodule
