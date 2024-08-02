class cla;
	int a,b,c;
	function new();
		$display("This is a function");
	endfunction
endclass

module class_ex2();
	cla cla_h1, cla_h2;
	
	initial begin
		$display("Before ",cla_h1);
		cla_h1=new();
	end
endmodule
