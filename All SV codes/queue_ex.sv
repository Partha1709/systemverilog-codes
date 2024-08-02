module queue_tb;
	int q[$]={1,3,4,6,7};
	
	initial begin
		foreach(q[i]) $display(" value of array q[%0d] = %d", i,q[i]); 
		$display("size of the queue is : %d",q.size());
		
		q.insert(1,q.pop_back());
		$display("After doing insert");
		
		foreach(q[i]) $display(" value of array q[%0d] = %d", i,q[i]);
		
		
		$display("after push front");
		q.push_front(11);
		foreach(q[i]) $display(" value of array q[%0d] = %d", i,q[i]);
		
		$display("after push back");
		q.push_back(13);
		foreach(q[i]) $display(" value of array q[%0d] = %d", i,q[i]);
		

	end
endmodule
		
	
