// design: describes the behaviour of system
// methodology: data flow modelling
module halfadder1(output sum, carry, input a, b);
  
  assign sum = a ^ b;
  assign carry = a & b;
  
endmodule

// testbench: to check if the design codes are correct

module halfadder1_tb();

  reg a,b;
  
  wire sum;
  wire carry;
  
  halfadder1 m1 (sum, carry, a, b);

 initial begin

	$dumpfile("dump.vcd");
    
    $dumpvars(1);

	    a=0; b=0;
    #20 a=1; b=0;
    #20 a=0; b=1;
    #20 a=1; b=1;
    #30 $stop;

 end
endmodule
