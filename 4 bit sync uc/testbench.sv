// testbench: to check if the design codes are correct

module syncup_tb();
  
  reg clk, rst;
  wire [3:0] count;
  
  syncup m1(count, clk, rst);

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