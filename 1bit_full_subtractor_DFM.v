// Code your design here
module fullsubtractor1(output diff, bout, input a, b, bin);
  
  //methodology: data flow modeling
  assign diff = a ^ b ^ bin;
  assign bout = ~a & (b ^ bin) | b & bin;
  
endmodule


// Code your testbench here
// or browse Examples

module fullsubtractor1_tb;
	wire diff, bout;
	reg a, b, bin;
  
  fullsubtractor1 Instance0 (diff, bout, a, b, bin);
  
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
