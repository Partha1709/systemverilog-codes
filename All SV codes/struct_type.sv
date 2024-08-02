module tb_struct; 
	struct {string name; int roll_no; } id_card; 
	initial 
		begin
			id_card.name = "This is a name";
			$display("name is : %s", id_card.name);
	end
endmodule
