module tb_class; 
	class id_card;
		string name; 
		int roll_no; 
	endclass
	
	id_card id1,id2, id3;
	
	initial 
		begin
			id1=new();
			id2=new();
			id1.name = "This is the id 1 name";
			id2.roll_no= 32;
			$display("name : %s and roll no is: %d",id1.name, id2.roll_no, id3);
			id3=new();
			
			$display("name : %s and roll no is: %d",id1.name, id2.roll_no, id3);
	end
endmodule 