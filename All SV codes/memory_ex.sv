module mem_tb;
	bit [3:0] [7:0]a; //
	bit [31:0] b;
	bit [7:0] c [3:0];
	initial 
		begin
			b[25]=1'b1;
			a[3][0]=1'b1;
			c[0]=8'd3;
			$display("value of a : %b and %b ",a[3][0],a);
			$display("Value of c: %p",c);
			
	end
endmodule