/* Semaphore example ---------- Taking key and giving key ---------*/ 
/* module tb_top;
	semaphore key;
	initial begin
		key = new(1);
		fork 
			personA ();
			personB ();
			#25 personA ();
		join_none
	end
	task getRoom (bit [1:0] id);
		$display(" time: %t, trying to get room for id is : %0d",$time, id);
		key.get(1);
		$display(" time: %t, Room key received for id is : %0d",$time, id);
	endtask
	task putRoom (bit [1:0] id);
		$display(" time: %t, Leaving room id is : %0d",$time, id);
		key.put(1);
		$display(" time: %t, Room key put back id is : %0d",$time, id);
	endtask
	task personA();
		getRoom (1);
		#20 putRoom (1);
	endtask
	task personB();
		#5 getRoom (2);
		#10 putRoom (2);
	endtask
endmodule */

/*
module mailb_tb();
	mailbox mbx = new(2);
	
	initial begin	
		for (int i=0; i<5; i++) begin	
			#1 mbx.put (i);
			$display ("Time: %0t, Thread0 : Put item #%0d, size=%0d", $time, i, mbx.num());
		end
	end
	
	initial begin	
		forever begin	
			int idx; 
			#2 mbx.get (idx);
			$display ("Time: %0t, Thread1 : Got item #%0d, size=%0d", $time, idx, mbx.num());
		end
	end
endmodule
*/

typedef mailbox #(string) s_mbox;
class comp1;
	s_mbox names; 
	
	task send ();
		for (int i=0; i<3; i++) begin
			string s = $sformatf ("name_%0d",i);
			string new_s = "This is a new string";
			$display ("T:%0t Comp1: Put %s", $time,s);
			names.put(new_s);
		end
	endtask
endclass
class comp2; 
	s_mbox list;
	task receive ();
		forever begin	
			string s; 
			list.get(s);
			#1 $display ("T:%0t Comp2 : Got %s", $time,s);
		end
	endtask
endclass

module mailb_tb1;
	s_mbox m_mbx = new();
	comp1 m_comp1 = new();
	comp2 m_comp2 = new();
	initial begin	
		m_comp1.names = m_mbx;
		m_comp2.list = m_mbx;
		
		fork 
			m_comp1.send();
			m_comp2.receive();
		join
	end
endmodule 






	
		
