// Code your design here
module fullsubtractor1(output diff, bout, input a, b, bin);
  
  //methodology: data flow modeling
  assign diff = a ^ b ^ bin;
  assign bout = ~a & (b ^ bin) | b & bin;
  
endmodule
