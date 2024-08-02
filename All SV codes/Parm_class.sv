class A #(type T=bit);
	T a,b,c;
	function dsp();
		$display("I'm from parent and value of t: ",$typename(T));
	endfunction
endclass

module param_tb; 
	//A #(5)a_h;
	//A #(50)a_h1;
	A #(byte)a_h;
	initial 
		begin
			a_h=new();
			//a_h1=new();
			a_h.dsp();
			//a_h1.dsp();
			a_h.a=300;
			$display("Value of a: %d",a_h.a);
		
	end
endmodule    
