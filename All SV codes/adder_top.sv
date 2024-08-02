interface intf(input logic clk,reset);
	logic [3:0] a;
	logic [3:0] b;
	logic [3:0] cin;
	logic [6:0] sum; 
	logic [6:0] cout;
endinterface

class transaction; 
	rand bit [3:0] a; 
	rand bit [3:0] b; 
	rand bit [3:0] cin; //Output
		 bit [6:0] sum;
		 bit [6:0] cout;
endclass

class generator;
	transaction trans=new();
	mailbox #(transaction) gen2driv; //mbx
	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction
	task working();
		begin
			trans.randomize();
			gen2driv.put(trans);
		end
	endtask
endclass 

class driver;
	virtual intf vif;
	mailbox gen2driv;
	transaction trans;
	function new(virtual intf vif,mailbox gen2driv);
		this.vif=vif;
		this.gen2driv=gen2driv;
	endfunction
	task working();
		begin
			gen2driv.get(trans);
			@(posedge vif.clk);
			vif.a=trans.a;
			vif.b=trans.b;
			vif.cin=trans.cin;
		end
	endtask
endclass

class monitor;
	virtual intf vif;
	mailbox mon2sb;
	transaction trans;
	function new(virtual intf vif,mailbox mon2sb);
		this.vif = vif;
		this.mon2sb = mon2sb;
	endfunction
	task working;
		forever begin
			@(posedge vif.clk);
			trans.a <= vif.a;
			trans.b <= vif.b;
			trans.cin <= vif.cin;
			trans.cout <=vif.cout;
			@(posedge vif.clk);
				mon2sb.put(trans);
		end
	endtask
endclass 

class scoreboard; //comparator + REF
	mailbox mon2sb;
	transaction trans;
	function new(mailbox mon2sb);
		this.mon2sb = mon2sb;
	endfunction
	task working;
		forever begin 
			mon2sb.get(trans);
			if((trans.a+trans.b+trans.cin) == trans.sum)
				$display("Result is as Expected, Yes ");
			else 
				$display("No, Wrong Result. \n\tExpected: %0d Actual: %0d",(trans.a+trans.b+trans.cin),trans.sum);
		end
	endtask
endclass

class environment;
	generator gen;
	driver driv;
	monitor mon;
	scoreboard scb; 
	
	mailbox gen2driv=new();
	mailbox mon2sb=new();
	
	virtual intf vif; 
	function new(virtual intf vif);
		this.vif = vif; 
		gen = new(gen2driv);
		driv = new(vif,gen2driv);
		mon = new(vif,mon2sb);
		scb = new(mon2sb);
	endfunction
	task working();
		gen.working();
		driv.working();
		mon.working();
		scb.working();
	endtask 
endclass
			
class test;
	environment env;
	virtual intf vif;
	function new(virtual intf vif);
		this.vif=vif;
	endfunction
	task working;
		env.working();
	endtask
endclass

module full_adder(
  input clk,
  input reset,
  input [3:0] a,
  input [3:0]b,
  input [3:0]cin,
  output reg [6:0]sum,
  output reg [6:0]cout
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      sum <= 0;
      cout <= 0;
    end else begin
      sum <= a ^ b ^ cin;
      cout <= (a & b) | (b & cin) | (a & cin);
    end
  end

endmodule

module adder_tb();
	bit clk;
	bit reset;
	intf i_intf(clk,reset);
	test t1=new(i_intf);
	full_adder DUT (.clk(i_intf.clk),.reset(i_intf.reset),.a(i_intf.a),.b(i_intf.b),.cin(i_intf.cin),.sum(i_intf.sum),.cout(i_intf.cout));
	always #5 clk = ~clk;
	initial begin	
		reset<=1; 
		t1.working();
		#5 reset<=0;
	end
endmodule

		
	





















	
	















