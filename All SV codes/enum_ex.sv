module enum_tb;
	enum {RED,GREEN,BLUE,YELLOW} color;
	initial 
		begin
			color=RED; //
			$display("The value is %s",color.name);
			color=color.next(5);
			$display("The value is %s and indes is : %0d",color.name, color);
	end
endmodule
