class sub_A;
	int x,y;
	function copy(output sub_A temp_h);
		temp_h=new();
		temp_h.x=this.x;
		temp_h.y=this.y;
	endfunction`
endclass
class A; //Two handle of this A then you will have two diff values of this "this". 
	int a,b;
	sub_A sub_h=new();
	function copy(output A temp_h);
		temp_h=new();
		temp_h.a=this.a;
		temp_h.b=this.b;
		sub_h.copy(temp_h.sub_h);
	endfunction
endclass

module shallow_tb();
	int p,q,r;
	A a_h=new(),b_h=new();
	initial 
		begin
			a_h.a=5;
			a_h.b=10;
			a_h.sub_h.x=4;
			a_h.sub_h.y=5;
			a_h.copy(b_h);
			$display("%d and %d",a_h,b_h);
			$display("%d and %d",a_h.sub_h,b_h.sub_h);
			$display("%d and %d and %d and %d",a_h, a_h.sub_h, a_h.sub_h.x,a_h.sub_h.y);
			$display("%d and %d and %d and %d",b_h, b_h.sub_h, b_h.sub_h.x,b_h.sub_h.y);
	end
endmodule
			

