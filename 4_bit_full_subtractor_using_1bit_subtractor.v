// Code your design here
// methodology: data flow modeling
module fullsubtractor1(output diff, bout, input a, b, bin);
  
  assign diff = a ^ b ^ bin;
  assign bout = ~a & (b ^ bin) | b & bin;
  
endmodule


// 4 bit full subtractor using 1 bit subtractor
module fullsubtractor4(diff, bout, a, b, bin);
  
  input [3:0] a, b;
  output [3:0] diff;
  input bin;
  output bout;
  
  wire w1, w2, w3;
  
  fullsubtractor1 L0(diff[0], w1, a[0], b[0], bin);
  fullsubtractor1 L1(diff[1], w2, a[1], b[1], w1);
  fullsubtractor1 L2(diff[2], w3, a[2], b[2], w2);
  fullsubtractor1 L3(diff[3], bout, a[3], b[3], w3);
  
endmodule

// Code your testbench here
// or browse Examples

module fullsubtractor1_tb;
	wire diff, bout;
	reg a, b, bin;
  
  fullsubtractor1 m1 (diff, bout, a, b, bin);
  
initial begin
         a = 0; b = 0; bin = 0;
	#20  a = 0; b = 0; bin = 1;
	#20  a = 0; b = 1; bin = 0;
	#20  a = 0; b = 1; bin = 1;
	#20  a = 1; b = 0; bin = 0;
	#20  a = 1; b = 0; bin = 1;
	#20  a = 1; b = 1; bin = 0;
	#20  a = 1; b = 1; bin = 1; 
end
  
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
end
endmodule
