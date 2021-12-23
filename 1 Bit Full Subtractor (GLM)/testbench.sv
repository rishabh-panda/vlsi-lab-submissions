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