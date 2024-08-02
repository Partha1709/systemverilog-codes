module tb; 
  bit a; 
  bit [3:0] b; 
  bit [7:0] c; 
  byte d;
  
  initial 
    begin
      a=1'b1; b=4'b1101; c=8'b11001100; d=8'b11001100; 
      $display("a=%b b=%b c=%b d=%b", a,b,c,d); 
      $display("a=%b b=%d c=%d d=%d", a,b,c,d);
    end
endmodule

