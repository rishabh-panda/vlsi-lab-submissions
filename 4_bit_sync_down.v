// design: describes the behaviour of system
// behavioural modelling
module syncdown(output reg [3:0] count, input clk, rst);
  always @ (posedge clk or posedge rst)
    
    begin
      
      if(rst)
        count<=0;
      else if(clk)
        count<=count-1;
      else
        count<=0;
  
    end
  
endmodule

// testbench: to check if the design codes are correct

module syncdown_tb();
  
  reg clk, rst;
  wire [3:0] count;
  
  syncdown m1(count, clk, rst);

 initial begin

	$dumpfile("dump.vcd");
    
    $dumpvars(1);

	clk=0;
    rst=1;
   #20 rst=0;
   #150 $stop;

 end
  always #5 clk=~clk;
endmodule
