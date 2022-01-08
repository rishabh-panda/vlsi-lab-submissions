// testbench: to check if the design codes are correct

module syncupdown_tb();
  
  reg clk, rst, status;
  wire [3:0] count;
  
  syncupdown m1(count, clk, rst, status);

 initial begin

	$dumpfile("dump.vcd");
    $dumpvars(1);

	clk=0; rst=1; status=0;
   #20 rst=0;
   #200 status=1;
   #400 status=0;
   #600 $finish;

 end
  always #10 clk=~clk;
endmodule