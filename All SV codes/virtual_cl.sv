virtual class A; 
	int a,b,c;
	function dsp();
		$display("I'm from parent class");
	endfunction
endclass

class A_copy extends A;
	function dsp();
		$display("I'm from child class");
	endfunction
endclass

module virtual_tb();
	A_copy a_h;
	initial
		begin
			a_h=new();
			a_h.a=100;
			a_h.dsp();
			$display("Value of a from Class A is : %0d",a_h.a);
	end
endmodule
