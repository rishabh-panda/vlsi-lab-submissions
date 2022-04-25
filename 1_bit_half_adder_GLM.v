// design: describes the behaviour of system
// methodology: gate level modelling
module halfadder1(output sum, carry, input a, b);
  
  xor a1(sum, a, b);
  and a2(carry, a, b);
  
endmodule

// testbench: to check if the design codes are correct

module halfadder1_tb();
  
  wire sum;
  wire carry;

  reg a,b;
  
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
