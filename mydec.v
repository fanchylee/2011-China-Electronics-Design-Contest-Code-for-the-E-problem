module mydec(
SERIALDATA,
SYNC,
DBL_BSB
,
CLK,
MANCH,
RST
);
parameter	threshold = 10;
output	SERIALDATA ;
output	SYNC ;
output	DBL_BSB ;

input	CLK ;
input	MANCH ;
input	RST ;


mydecoder mdecode(
	.CLK(CLK),
	.RST(RST), 
	.MANCH(MANCH),
	.SYNC(SYNC), 
//	.SERIALDATA(),
	.DBL_BSB(DBL_BSB) 
);  
reg	SERIALDATA; 
reg	[9:0]	counter ;
reg		en_adder ;
always @(posedge CLK) begin
	if(en_adder ) begin
		counter <= counter + 1 ;
	end
end
always@(negedge DBL_BSB  ) begin
	en_adder <= 1 ;
end
always @(posedge DBL_BSB)begin
	en_adder <= 0 ;
	counter <= 0 ;
	if(counter >threshold) begin
		SERIALDATA <= SYNC ;
	end
end
endmodule
