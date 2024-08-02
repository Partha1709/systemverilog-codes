`include "uvm_macros.svh"
import uvm_pkg::*;

class mon extends uvm_object;
	int a=11,b=22,c=33;
	
	function void do_print (uvm_printer printer);
	
		printer.print_field("a",a,32,UVM_DEC);
		printer.print_field("b",this.b,32,UVM_DEC);
		printer.print_field("last c",this.c,32,UVM_DEC);
	endfunction
	
endclass

module tb_print;
	mon m_h;
	initial begin
		m_h=new();
		m_h.print(uvm_default_line_printer);
	end
	
endmodule
	

