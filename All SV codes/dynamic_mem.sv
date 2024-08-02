module dynamic_mem();
	byte a[3:0];
	int da [];
	int i=0;
	
	initial 
		begin 
			da = new[20];
			a[0]=8'd3;
			a[1]=8'd2;
			a[2]=8'd5;
			a[3]=8'd8;
			da[2]= 38;
			$display("size of da is : %d and value at 4 th location is : %d",da.size(), da[2]);
			$display("size of a is : %p ",a);
			
			#5;
			da=new[10](da);
			$display("after time : $time size of da is : %d and value at 4th location is : %d",da.size(), da[2]);
			
			
			foreach (da[i]) begin //(i=0; i<=10; i=i+1) begin 
				da[i]=$random;
				$display("da[%0d]=%d",i,da[i]);
			end
			da.delete();
			foreach (da[i]) $display("da[%0d]=%d",i,da[i]);
			  
	end
endmodule 
