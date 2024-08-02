module tb_typedef; 
	typedef bit [7:0] my_byte; 
	my_byte b1,b2,b3;
	initial 
		begin
			b1=4'b1101;
			$display("b1=%d",b1);
	end
endmodule
	
