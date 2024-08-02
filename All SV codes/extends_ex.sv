class A;
	int a,b,c;
	function new (int tp=23);
		$display("This is from class A and tp: %0d",tp);
	endfunction
endclass

class B extends A;
	int a,b,c,x,y,z;
	function new (int tc=33);
		super.new();
		$display("This is from class B and tc: %0d",tc);
	endfunction
	function run(int t);
		a=120;
		super.a=t;
		$display("Its form own : %0d",a);
		$display("Its form inheritence : %0d",super.a);
	endfunction
	
endclass

module extends_tb();
	A a_h;
	B b_h;
	
	initial 
	begin
		//a_h=new();
		b_h=new(30);
	end
endmodule
			
