module assert_tb;
	reg a,b;
	assign b=!a;
	always_comb 
		begin
			label1:assert(b!=a)
				$display($time,"PASS");
			else 
				$display($time,"FAIL");
		end
	initial begin	
		a=1;
		#10 a=0;
	end
endmodule 
