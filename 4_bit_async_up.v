// design: describes the behaviour of system
// behavioural modelling
module asyncup(output reg [3:0] count, input clk, rst);
  always @(rst)
    count=0;
  always@(negedge clk)
    count[0]=~count[0];
  always@(negedge count[0])
    count[1]=~count[1];
  always@(negedge count[1])
    count[2]=~count[2];
  always@(negedge count[2])
    count[3]=~count[3];
endmodule

// testbench: to check if the design codes are correct

module asyncup_tb();
  
  reg clk, rst;
  wire [3:0] count;
  
  asyncup m1(count, clk, rst);

 initial begin

	$dumpfile("dump.vcd");
    
    $dumpvars(1);

	clk=0;
    rst=1;
   #20 rst=0;
   #200 $stop;

 end
  always #5 clk=~clk;
endmodule
