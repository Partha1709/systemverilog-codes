module asso_tb;
	int mem [int];
	int mem_st [string];
	int temp;
	initial 
		begin
			mem[3]=44;
			mem[5]=23;
			mem[8]=25;
			mem_st["name1"]=236;
			mem_st["name2"]=230;
			
			mem.first(temp);
			
			$display("value of temp is %d",temp);
			
			$display("size of mem_st is %d",mem_st.size());
			$display("mem[3]=%d,mem[5]=%d and %0d",mem[3],mem[5],mem[4]);
			
			$display("mem_st[name1]=%d,mem_st[name2]=%d and %0d",mem_st["name1"],mem_st["name2"],mem_st["name3"]);
			
			foreach (mem[i]) $display("value of mem[%d]= %d",i,mem[i]);
			
			foreach (mem_st[i]) $display("value of mem[%d]= %d",i,mem[i]);
			
	end
endmodule
