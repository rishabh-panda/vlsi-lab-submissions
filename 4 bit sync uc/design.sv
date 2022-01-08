// design: describes the behaviour of system
// behavioural modelling
module syncup(output reg [3:0] count, input clk, rst);
  always @ (posedge clk or posedge rst)
    
    begin
      
      if(rst)
        count<=0;
      else if(clk)
        count<=count+1; //negate the one for down counter
      else
        count<=0;
  
    end
  
endmodule