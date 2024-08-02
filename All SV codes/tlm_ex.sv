`include "uvm_macros.svh"
import uvm_pkg::*;

class mon_tx extends uvm_agent;
	`uvm_component_utils(mon_tx)
	int a=100;
	uvm_bloking_put_port #(int) put_port;
	function new(string name="mon_tx",uvm_component parent=null);
		super.new(name,parent);
		put_port=new("put_port",this);
	endfunction
	task run_phase(uvm_phase);
		super.run_phase(phase);
		put_port(a);
	endtask
endclass 
class mon_rx extends uvm_agent;
	`uvm_component_utils(mon_rx)
	int a; 
	uvm_blocking_get_port #(int) get_port;
	function new(string name="mon_tx",uvm_component parent=null);
		super.new(name,parent);
		get_port=new("get_port",this);
	endfunction
	task run_phase(uvm_phase);
		super.run_phase(phase);
		$display("Before get mon rx, a : %0d",a);
		get_port(a);
		$display("After get mon rx, a : %0d",a);
	endtask
endclass 
class env extends uvm_env;
	mon_tx mtx_h;
	mon_rx mrx_h;
	
	uvm_tlm_fifo #(int) fifoh; 
	function new(string name="mon_tx",uvm_component parent=null);
		super.new(name,parent);
		fifoh=new("fifoh",this);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		mtx_h=mon_tx::type_id::create("mtx_h",this);
		mrx_h=mon_rx::type_id::create("mrx_h",this);
	endfunction
	function connect_phase();
		mtx_h.put_port.connect(fifoh.put_export);
		mrx_h.get_port.connect(fifoh.get_export);
	endfunction
	
endclass
module tlm_tb;
	env e_h;
	initial begin
		e_h=new();
		run_test();
	end
endmodule 



