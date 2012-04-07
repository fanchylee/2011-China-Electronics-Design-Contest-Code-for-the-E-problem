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








endmodule
