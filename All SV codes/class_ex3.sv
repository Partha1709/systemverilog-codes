class A;
	int a,b,c;
	function dsp(input int t);
		int a,y,z;
		a=t;
		this.a=a;
		$display("from function prop a = %0d",a);
		$display("Value of this = %0d",this);

	endfunction
endclass

module class_ex3();
	int a,b,c;
	A a_h1,a_h2;
	initial begin
		a_h1=new();
		a_h2=new();
		a_h1.dsp(40);
		a_h2.dsp(60);
		$display("from class prop a = %0d",a_h1.a);
		$display("Value of a_h1 : %0d",a_h1);
		$display("Value of a_h2 : %0d",a_h2);
	end
endmodule 
