module reg_tb;
	int ma=20;
	function void pass_by_value (int fa);
		fa=fa*2;
		$display("Inside the function pass by value fa = %d", fa);
	endfunction : pass_by_value
	
	function automatic void pass_by_ref (ref int fa);
		fa=fa*2;
		$display("Inside the function pass by ref fa = %d", fa);
	endfunction : pass_by_ref
	
	initial begin 
		pass_by_value(ma);
		$display("After calling the function pass by value ma=%d", ma);
		pass_by_ref(ma);
		$display("After calling the function pass by ref ma=%d",ma);
	end
endmodule: reg_tb
