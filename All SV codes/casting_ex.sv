module struct_tb();
	typedef struct {string name; int roll_no; enum {O, A, B, AB} b_grp;} id_card;
	id_card id1;
	initial 
		begin
			id1.name= "Partha";
			id1.b_grp= AB;
			$display("name is %s",id1.name);
			$display("b_grp is %s",id1.b_grp);
	end
endmodule
