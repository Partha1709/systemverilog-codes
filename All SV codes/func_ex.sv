module func_tb;
	int a=25;
	
	//function sum (input int x, y, output int z); //System Verilog type 
	//	z=x+y;
	//	$display("Value of x : %0d, y : %0d, and z : %0d", x,y,z);
	//
	//endfunction
	
	//function int sum1 (input int x,y=50); //Verilog type
	//	//return (x+y);
	//	sum1 = x+y;
	//	$display("value of x : %d, y : %d and sum1 : %0d",x,y,sum1);
	//endfunction
	
	//function void welcome();
	//	$display("==HI==");
	//	$display("==Welcome==");
	//endfunction
	
	function int sum (input int a,b=200,c=30);
		a=a+a;
		$display(a);
		$display("From function a : %d",a);
	endfunction
	

	initial 
		begin
		repeat(2) sum(100);
		
		
	end
	
endmodule
