// testbench: to check if the design codes are correct

module fulladder4_tb();
  
  wire cout;
  wire [3:0] sum;

  reg [3:0] a, b;
  reg cin;
  
fulladder4 instance0 (sum, cout, a, b, cin);

 initial begin

	$dumpfile("dump.vcd");
    
   $dumpvars(1);

	    a=2; b=3; cin=0;
	#20 a=5; b=3;
	#20 a=4; b=10;
	#20 a=7; b=8;
	#20 $stop;

 end
endmodule