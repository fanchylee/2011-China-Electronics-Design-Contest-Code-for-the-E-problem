`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:26 08/23/2011 
// Design Name: 
// Module Name:    main 
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
module main(
lcd_en,dis_ram_o,keyboard_col,signal_mout_m,signal_mout_m_2,signal_mout,keyboard_gnd,clk_signal,noise_mout,lcd_bg,lcd_bv
,
clk_ex ,keyboard_row ,boma
);
//outputs

parameter	CLK_FREQ=50000000 ;
parameter	CLK_1K = CLK_FREQ / 2 /1000 ;
parameter	CLK_1=CLK_FREQ / 2 / 1 ; 
parameter	CLK_90M=90000000;
parameter	CLK_80M=80000000;
parameter	CLK_70M=70000000;
parameter	CLK_60M=60000000;

parameter	CLK_90K=CLK_90M/2/90000 ;
parameter	CLK_80K=CLK_80M/2/80000;
parameter	CLK_70K=CLK_70M/2/70000;
parameter	CLK_60K=CLK_60M/2/60000 ;


output	wire		keyboard_gnd ;
output	wire		lcd_bg,lcd_bv ;

assign		keyboard_gnd = 0 ;
assign		lcd_bg = 0 ;
assign		lcd_bv = 1 ;


reg	[9:0]	counter_30k=0,counter_80k=0 ,counter_70k=0,counter_60k=0,counter_90k =0,counter_100k=0,counter_10m= 0, counter_20m = 0;
reg		clk_10m=0 ;
	reg	clk_20m = 0;
	reg	[9:0]	clk_k = 0 ;





output	wire	[15:0]	dis_ram_o;
output	wire		lcd_en	;
output	wire	[3:0]	keyboard_col;
//inputs
input	wire		clk_ex	;
input	wire	[3:0]	keyboard_row ;
input	wire	[2:0]	boma ;
	reg	[31:0]	counter = 0 ;
	reg	[3:0]	counter_3 = 0 ;
	reg	[3:0]	keycode_buf = 0 ;

	reg	[7:0]	state = 0 ;
	

	reg		state_w ;
	wire	[7:0]	dis_mode ;

	wire		clk_point ;
	wire		display_clk ;
	wire	[3:0]	keycode	;
	wire		keytrig	;

	wire	[9:0]	dis_addr_w ;
	wire		dis_done_w ;
	reg	[127:0]	bus;



	wire	[18:0]	dis_w_bus ;
	
`include "state.v"

assign	display_clk = counter[14] ; //about 600 us
assign	clk_point = counter[24] ;


reg	rst_bin2bcd ;
reg	en_bin2bcd ;
reg	[31:0]	in_bin2bcd ;
wire	[39:0]	out_bin2bcd ;


bin2bcd	bin2bcd_converter(	.RESET(rst_bin2bcd),
				.ENABLE(en_bin2bcd),
				.BIN(in_bin2bcd[31:0]),
				.CLK(clk_50m),
				.BCD_o(out_bin2bcd[39:0])
);

//for display	
keyboard four_four(	.clk(clk_k[5]),
			.row_i(keyboard_row),
			.col_o(keyboard_col),
			.keytrig(keytrig),
			.keycode_o(keycode) 
			);

dis_ram dis_ram_1(	.in(dis_w_bus[15:0]),//16bit
			.out(dis_ram_o),//16bit
			.clk(display_clk),//1
			.clk_w(dis_w_bus[16]),//1
			.en_w(dis_w_bus[17]),//1
			.rst_w(dis_w_bus[18]),//1
			.addr_db(dis_addr_w),//10
			.mode(dis_mode),//8
			.lcd_en(lcd_en),//1
			.done_w(dis_done_w)//1
);//1

dis_state dis_state(	
			.display_clk(display_clk),
			.clk_50m(clk_50m),
			.clk_point(clk_point),
			.clk_w(dis_w_bus[16]),
			.state(state),
			.display_reg(dis_w_bus[15:0]),
			.mode(dis_mode),
                        .en_w(dis_w_bus[17]),
			.done_w(dis_done_w),
                        .rst_w(dis_w_bus[18]),
                        .addr_db(dis_addr_w),
			.pbus(bus)
			);

output	wire		noise_mout ;

noise_m noise_m(	
			.clk(clk_10m),
			.q(noise_mout)
    );
output	wire		signal_mout_m ;
output	wire		signal_mout_m_2 ;
output	wire		signal_mout ;
output	wire		clk_signal ;
reg	/*reg*/	rst_signal ;//= 0;
reg		en_signal ;
assign	signal_mout_m_2 = signal_mout_m ;
signal_m signal_m(	.clk(clk_signal),
			.areset(rst_signal),
			.oen(~en_signal),
			.q(signal_mout),
			.q_m(signal_mout_m)
    );





wire	clk_90m,clk_80m,clk_70m;
wire	clk_50m_1 ;
dcm_90m	dcm_90m(	.CLKIN_IN(clk_ex),
			.CLKFX_OUT(clk_90m),
			.CLK0_OUT(clk_50m_1)
);
wire	clk_50m_2 ;
dcm_80m dcm_80m(	.CLKIN_IN(clk_50m_1),
			.CLKFX_OUT(clk_80m),
			.CLK0_OUT(clk_50m_2)
);
dcm_70m dcm_70m(	.CLKIN_IN(clk_50m_2),
			.CLKFX_OUT(clk_70m),
			.CLK0_OUT(clk_50m)
);


always@(posedge clk_50m) begin
	if(counter_100k < 250 - 1)begin
		counter_100k <= counter_100k + 1 ;
	end else begin
		counter_100k <= 0 ;
		clk_k[0] <= ~clk_k[0] ;
	end	
end

always@(posedge clk_80m)begin
	if(counter_10m < 4-1)begin
		counter_10m <= counter_10m + 1 ;
	end else begin
		clk_10m <= ~clk_10m ;
		counter_10m <= 0 ;
	end
	
end
always @(posedge clk_80m) begin
	if(counter_20m < 1) begin
		counter_20m <= counter_20m + 1 ;
	end else begin
		clk_20m <= ~clk_20m  ;
		counter_20m <= 0 ;
	end
end
always@(posedge clk_90m) begin
	if(counter_60k < 750 - 1)begin
		counter_60k <= counter_60k + 1 ;
	end else begin
		counter_60k <= 0 ;
		clk_k[6] <= ~clk_k[6] ;
	end	
end
always@(posedge clk_70m) begin
	if(counter_70k < 500 - 1)begin
		counter_70k <= counter_70k + 1 ;
	end else begin
		counter_70k <= 0 ;
		clk_k[7] <= ~clk_k[7] ;
	end	
end
always@(posedge clk_80m) begin
	if(counter_80k < 500 -1)begin
		counter_80k <= counter_80k + 1 ;
	end else begin
		counter_80k <= 0 ;
		clk_k[8] <= ~clk_k[8] ;
	end	
end
always@(posedge clk_90m) begin
	if(counter_90k < 500-1)begin
		counter_90k <= counter_90k + 1 ;
	end else begin
		counter_90k <= 0 ;
		clk_k[9] <= ~clk_k[9] ;
	end	
end

always@(posedge clk_k[6]) begin 
		clk_k[3] <= ~clk_k[3] ;
end

always@(posedge clk_k[0]) begin
	clk_k[5] <= ~clk_k[5] ;
end
always@(posedge clk_k[8]) begin
	clk_k[4] <= ~clk_k[4] ;
end
always@(posedge clk_k[4]) begin
	clk_k[2] <= ~clk_k[2] ;
end
always @(posedge clk_k[2]) begin
	clk_k[1] <= ~clk_k[1] ;
end


assign clk_signal = clk_k[bus[11:8]] ;


always @(negedge clk_50m) begin
	counter <= counter + 1 ;
	case(state)
	keyboard_test: 
	begin
		bus[7:0] <= out_bin2bcd[7:0] ;
		if(keytrig == 1) 
			rst_bin2bcd <= 1 ;
		else
			rst_bin2bcd <= 0 ;
	end
	freq_sig:
	begin
		bus[13] <= rst_signal ;
		if(keytrig == 1 ) begin
			rst_signal <= 0 ;
			en_signal <= 1 ;	
		end else begin
			rst_signal <= 1 ;
		end
		case(keycode_buf)
		4'b0100:
		begin
			rst_signal <= 0 ;
		end
		endcase
		case(boma)
		3'b100:  bus[23:16] <= 8'd1 ;
		3'b010:  bus[23:16] <= 8'd2 ;
		3'b001:	 bus[23:16] <= 8'd5 ;
		default: bus[23:16] <= 8'd0;
		endcase
	end
	freq_sig_stop:
	begin
		rst_signal <= 0 ;
	end
	endcase
end

always @(negedge keytrig)begin
	case(state)
	keyboard_test: 
	begin
		in_bin2bcd[31:0] <= {28'b0,counter_3[3:0]};
		bus[43:40] <= keycode_buf ;
	end
	freq_sig:
	begin
	case(keycode_buf)                                   	
       	4'b1100:
       	begin
		if(bus[11:8] == 9) begin
			bus[11:8] <= 0 ;
			bus[12] <= 1 ;
		end else begin
			if( bus[11:8] < 9)begin
       				bus[11:8] <= bus[11:8] + 1 ;
				bus[12]<= 0;
			end
		end
       	end
       	4'b1000:
       	begin	
       		if(bus[11:8] == 0) begin
       			bus[11:8] <= 4'd9 ;
			bus[12] <= 4'd0 ;
       		end else begin
			if(bus[11:8] > 1)begin
       				bus[11:8] <= bus[11:8] - 1  ;
				bus[12] <= 0;
			end	
			if(bus[11:8] == 1) begin
				bus[11:8] <= 0 ;
				bus[12] <= 1 ;
			end
       		end
       	end
	4'b0010:
	begin
		bus[11:8] <= 4'd5 ;
		bus[12] <= 0 ;
	end
	4'b0111:
	begin
		bus[11:8] <= 4'd1;
		bus[12] <= 4'd0 ;
	end	
	4'b0110:
	begin
		bus[11:8] <= 4'd2;
		bus[12]<= 4'd0 ;
	end
	4'b0101:
	begin
		bus[11:8] <= 4'd3;
		bus[12]<=4'd0;
	end
	4'b1011:
	begin
		bus[11:8] <= 4'd4 ;
		bus[12] <= 4'd0 ;
	end
	4'b1010:
	begin
		bus[11:8] <= 4'd5 ;
		bus[12] <= 4'd0 ;
	end
	4'b1001:
	begin
		bus[11:8] <= 4'd6;
		bus[12] <= 4'd0 ;
	end
	4'b1111:
	begin
		bus[11:8] <= 4'd7;
		bus[12] <= 4'd0 ;
	end	
	4'b1110:
	begin
		bus[11:8] <= 4'd8;
		bus[12] <= 4'd0 ;
	end
	4'b1101:
	begin
		bus[11:8] <= 4'd9 ;
		bus[12] <= 4'd0 ;
	end
	4'b0011:
	begin
		bus[11:8] <= 4'd0 ;
		bus[12] <= 4'd1 ;
	end
       	default:
	begin
        	bus[11:8] <= bus[11:8] ;
		bus[12]<= bus[12] ;
	end     
	endcase
	end
/*
	default:
	begin
	end
*/	
	endcase
end

always @(posedge keytrig) begin
	counter_3 <= counter_3 + 1 ;
	keycode_buf <= keycode ;
	case(state) 
	keyboard_test:	en_bin2bcd <= 1 ;
	freq_sig:	en_bin2bcd <= 0 ;
	default:	en_bin2bcd <= 0 ;
	endcase
	case(keycode) 
	//4'b0001:state <= keyboard_test ;
	//4'b0000:state <= none ;
	4'b0010:state <= freq_sig ;
	4'b0100:state <= freq_sig_stop ;
	default:
	begin
		state <= state ;
	end
	endcase
end

endmodule
