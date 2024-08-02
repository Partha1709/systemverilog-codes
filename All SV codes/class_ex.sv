class cl;
	int i;
	string str;
	
	function dsp (string str_s);
		$display("This is from class function: %s",str_s);
	endfunction
endclass

module class_tb();
	typedef struct {int i; string str;} st;
	st s1,s2,s3;
	cl c1,c2,c3;
	
	initial begin
		c1=new();
		c2=new();
		c3=new();
		s1.i=40;
		s2.i=50;
		c1.i=30;
		c2.i=40;
		s3.str="This is a string";
		c1.dsp("This is from c1");
		c2.dsp("This is from c2");
		$display("c1=%p",c1);
		$display(c1,c2,c3);
		//$display(" s1=%p, s2=%p, s3=%p", s1,s2,s3);
	end
endmodule 
