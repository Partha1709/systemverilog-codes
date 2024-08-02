class A;
	int a,b,c;

	function dsp();
		$display("I'm from parent");
	endfunction
endclass

class B extends A;
	
	function dsp();
		$display("I'm from child");
	endfunction
endclass

module child_pr;
	A a_h1,a_h2;
	B b_h1,b_h2;
	initial
		begin
		a_h1=new();
		b_h1=new();
		a_h2=new();
		b_h2=new();
		a_h1=b_h1;
		//b_h2=a_h1; //This line you will get an error, you can't assign different type, for that you have to use $cast
		$cast(b_h2,a_h1); //$cast is used to assign different type of handles. 
		//a_h.dsp();
		//b_h.dsp();
		//$display("Address of a_h : %0d",a_h);
		//$display("Address of b_h : %0d",b_h);		
		//a_h=b_h;
		
		//$display("Address of a_h : %0d",a_h);
		//$display("Address of b_h : %0d",b_h);				
		//a_h.dsp();
	end
endmodule
