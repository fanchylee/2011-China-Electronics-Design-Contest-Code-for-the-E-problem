module qc12864_gdram_initializer(
data_out,state ,
clk, rst , start
);
//outputs
output	reg	[15:0]	data_out=			0				;
output	reg	[1:0]	state=				0				;
//inputs
input	wire		rst								;
input	wire		start								;
input	wire		clk								;
//wires
//registers
	reg	[11:0]	counter=			0				;
	reg	[4:0]	data_Y=				0				;
	reg	[3:0]	data_X=				0				;
//parameters
parameter uninitialized=0 ;
parameter initializing=1 ;
parameter initialed=2 ;


always@(negedge rst or posedge clk ) begin
	case(state)
	uninitialized:	begin	
		if(start == 0) begin
			state <= initializing ;	
		end
	end	
	initializing:	begin
		counter <= counter + 1 ;	
		case(counter[5:0]) 
		0:	begin
			data_out <= 15'h0034 ;
		end
		1:	begin
		end

		2:	begin
			data_out <= 15'h0036 ;
		end
		3:	begin
		end	
		
		4:	begin
			data_out <= {8'b00000000 , 3'b100 , data_Y} ;
		end
		5:	begin
		end

		6:	begin
			data_out <= {8'b00000000 , 4'b1000 , data_X} ;
		end
		7:	begin
		end
		
		63:	begin
			data_Y <= data_Y + 1 ;
			data_X <= 4'b0000 ;
		end
		default:	begin
			data_out <= 15'h0100 ;	
		end		
		endcase
		if(counter[11:10] == 2'b11) begin
			state <= initialed ;
		end
	end
	initialed:	begin
		if(rst == 0) begin
			state <= uninitialized ;
		end
	end
	
	endcase
end
