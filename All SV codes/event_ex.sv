module event_tb;
	event ev;
	initial begin
		$display("S1 :: Called");
		#10;
		$display("S2 :: Called");
		-> ev;
	end
	
	initial begin
		$display("S3 :: Called");
		#10;
		wait(ev.triggered);
		$display("S4 :: Called");
	end
endmodule 
	
