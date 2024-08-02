package pkg;
	int a; 
endpackage

module tb1;
	initial begin
		pkg::a=5;
		#5;
		$display("From tb1 gave a=5 and getting a=%0d",pkg::a);
	end
endmodule

module tb2;
	initial begin
		$display("From tb2 a : %d",pkg::a);
		#2;
		pkg::a=2;
	end
endmodule
		
