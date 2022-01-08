// design: describes the behaviour of system
// behavioural modelling
module syncupdown(output reg [3:0] count, input clk, rst, status);
  initial count=0;
  always @ (posedge clk)
    begin 
      if(status==0)
        begin
         if(rst)
           count=0;
         else
           count=count+1;
        end
      else
        begin
          if(status)
            begin
              if(rst)
                count=0;
              else
                count=count-1;
            end
        end
    end
  always @ (posedge status)
    begin
      count=15;
    end
  always @ (negedge status)
    begin
      count=0;
    end
endmodule