module task_tb();

	task static double(int a, string s);
		#5;
		a = a * 2; 
		$display($time," time:  %s : %d",s,a);
	endtask : double
	
	initial begin
		fork 
			begin	
				
				double(6, "From Thread 2: ");
			end
			
			begin 
				double(5, "From Thread 1: ");
			end 
		join
	end
endmodule



