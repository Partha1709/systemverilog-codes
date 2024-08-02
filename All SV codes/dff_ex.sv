interface dff_if (input clk);
	logic d,q,rst; //You can taek reset preset, q! also
	clocking cb @(posedge clk);
		default input #(1) output #(1);
		input q;
		output d;
		output rst;
	endclocking
	
	modport DUT (input d, rst, output q);
	modport TB (clocking cd, input clk);
endinterface

module DUT(dff_if.DUT if_h);
	always @(posedge if_h.clk)
		begin
			if(if_h.rst)
				if_h.q <=0;
			else
				if_h.q <= if_h.d;
		end
endmodule

module dff_tb(dff_if.TB if_h);
	initial 
		begin 
			$monitor("clk=%0b rst=%0b d=%0b q=%0b",if_h.clk, if_h.rst, if_h.d, if_h.q);
			if_h.rst=0;if_h.d=0;
			#2 if_h.rst=0;if_h.d=1;
			#2 if_h.rst=1;if_h.d=0;
			#2 if_h.rst=1;if_h.d=1;
	end
endmodule		

module top;
	logic clk=0;
	always #3 clk=~clk;
	dff_if IF(clk);
	DUT D0 (IF);
	dff_tb t0 (IF);
endmodule