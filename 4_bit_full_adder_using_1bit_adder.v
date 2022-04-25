// design: describes the behaviour of system
// methodology: data flow modelling
module fulladder1(output sum, cout, input a, b, cin);
  
  assign sum=a ^ b ^ cin;
  assign cout=(a & b) | (b & cin) | (a & cin);

endmodule


// 4 bit full adder using 1 bit adder
module fulladder4(sum, cout, a, b, cin);
  
  input [3:0] a, b;
  output [3:0] sum;
  input cin;
  output cout;
  
  wire w1, w2, w3;
  
  fulladder1 L0(sum[0], w1, a[0], b[0], cin);
  fulladder1 L1(sum[1], w2, a[1], b[1], w1);
  fulladder1 L2(sum[2], w3, a[2], b[2], w2);
  fulladder1 L3(sum[3], cout, a[3], b[3], w3);
  
endmodule

// testbench: to check if the design codes are correct

module fulladder4_tb();
  
  wire cout;
  wire [3:0] sum;

  reg [3:0] a, b;
  reg cin;
  
fulladder4 m1 (sum, cout, a, b, cin);

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
