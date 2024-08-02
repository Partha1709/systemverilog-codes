//************UVM_COMPONENTS**************//
interface intf;
	logic a;
	logic b;
	logic c; 
	logic sum; 
	modport mod();
	modport tb();
	clocking block;
	endclocking
endinterface
module dut ();
	intf inf;
	always @(posedge clk)
		inf.sum=(inf.a+inf.b+inf.c);
endmodule 
module top;
	intf If;
	dut d0 (If);
	initial begin
		uvm_config_db #(virtual intf)::set (null,"*","If",If); //We will get this in Driver and Monitor. 
	end
endmodule
class transaction extends uvm_sequence_item; 
	`uvm_object_utils(transaction)
	rand a; 
	rand b; 
	rand c; 
	bit sum; 
	bit carry; 
	function new(string name="packet");
		super.new(name);
	endfunction 
endclass 
class my_sequence extends uvm_sequence #(transaction);
	transaction t_h;
	`uvm_object_utils(my_sequence) 
	function new(string name="my_sequence");
		super.new(name);
	endfunction
	task body();
		repeat(10) begin	
			t_h=transaction::type_id::create("t_h"); //Here only accepting one argument no other arguments are expected. 
			start_item(t_h);
			t_h.randomize();
			finish_item(t_h);
endclass
class driver extends uvm_driver #(transaction);
	transaction t_h; 
	virtual intf inf; 
	`uvm_componet_utils(driver) 
	function new(string name="driver", uvm_component parent=null);
		super.new(name,parent);
	endfunction 
	function build_phase(uvm_phase phase);
		if (!uvm_config_db #(virtual intf)::get("this",".","inf",inf))
			`uvm_error("Driver","Unable to get interface, It seems If not set");
	task run_phase;
		forever begin	
			sqrh.get_item(t_h); //You will get t_h here
				inf.a=t_h.a;
				inf.b=t_h.b;
				inf.c=t_h.c;
			sqrh.item_done;
		end
endclass
class monitor extends uvm_monitor;
	`uvm_component_utils(monitor)
	transaction t_h;
	virtual intf inf; 
	covergroup cg; 
		a:covergroup inf.a; 
		b:covergroup inf.b;
		c:covergroup inf.c;
		cross a,b,c;
	endgroup 
	function new(string name="monitor",uvm_component parent=null);
		super.new(name,parent);
		cg=new();
	endfunction 
	task run_phase();
		cg.sample();
		@(posedge inf.clk)
		rm_sum=inf.a + inf.b; 
		if(rm_sum==inf.sum) 
			`uvm_info("monitor","Result matched");
		else 
			`uvm_info("monitor","Result mismatched");
	endtask
endclass
class agent extends uvm_agent;
	`uvm_component_utils(agent)
	driver drv; 
	monitro mon; 
	sequencer seqrh; 
	bit is_active=1;
	function new(string name="agent",uvm_component parent=null);
		super.new(name,parent);
	endfunction
	function build_phase(uvm_phase phase);
		super.build(phase);
		if (!uvm_config_db #(bit)::get("this",".","is_active",is_active))
			`uvm_error("Driver","Unable to get is active, It seems If not set");
		mon=monitor::type_id::create("mon",this);
		if(is_active) begin
			drv=driver::type_id::create("drv",this);
			seqrh=sequencer::type_id::create("seqrh",this);
		end
	endfunction 
	function connect_phase(uvm_phase phase);
		if(is_active) begin
			drv.seq_item_port.connect(seqrh.seq_item_export);
		end
	endfunction
endclass
class env extends uvm_env;
	`uvm_component_utils(env);
	agent ag;
	function new(string name="env",uvm_component parent=null);
		super.new(name,string);
	endfunction
	function build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db #(bit)::set(this,"ag","is_active",1);
		ag=agent::type_id::create("ag",this);
	endfunction
endclass
class test extends uvm_test;
	`uvm_component_utils(test)
	env e_h;
	function new(string name="test",vum_component parent=null);
		super.new(name,parent);
	endfunction
	function build_phase(uvm_phase phase);
		e_h=env::type_id::create("e_h",this);
	endfunction
	task run_phase();
		my_sequence sqh;
		sqh=my_sequence::type_id::create("sqh",this);
		sqh.randomize();
		sqh.start(e_h.a_h.sqrh); 
	endtask
endclass











 





