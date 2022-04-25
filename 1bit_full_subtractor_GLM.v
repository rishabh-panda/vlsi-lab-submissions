// design: describes the behaviour of system
// methodology: gate level modelling
module fullsubtractor1(output diff, bout, input a, b, bin);
  
  xor a1(diff, a, b, bin);
  and a2(w1, ~a, b);
  and a3(w2, ~a, bin);
  and a4(w3, b, bin);
  or  a5(bout, w1, w2, w3);
  
endmodule

// testbench: to check if the design codes are correct

module fullsubtractor1_tb();
  
  wire diff;
  wire bout;

  reg a,b;
  reg bin;
  
  fullsubtractor1 m1 (diff, bout, a, b, bin);

 initial begin

	$dumpfile("dump.vcd");
    
    $dumpvars(1);

	    a=0; b=0; bin=0;
    #20 a=0; b=0; bin=1;
    #20 a=0; b=1; bin=0;
    #20 a=0; b=1; bin=1;
    #20 a=1; b=0; bin=0;
    #20 a=1; b=0; bin=1;
    #20 a=1; b=1; bin=0;
    #20 a=1; b=1; bin=1;
    #30 $stop;

 end
endmodule
