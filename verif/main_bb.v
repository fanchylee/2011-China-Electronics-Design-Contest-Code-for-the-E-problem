module dis_ram (out,lcd_en,lcd_rst,addr_db,done_w,rst_w,clk_w,en_w,clk,in,mode);
output [15:0]out;
output lcd_en;
output lcd_rst;
output [9:0]addr_db;
output done_w;
input rst_w;
input clk_w;
input en_w;
input clk;
input [15:0]in;
input [7:0]mode;
endmodule

