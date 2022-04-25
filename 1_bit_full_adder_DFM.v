// design: describes the behaviour of system
// methodology: data flow modelling
module fulladder1(output sum, cout, input a, b, cin);
  
  assign sum=a^b^cin;
  assign cout=(a&b)|((a^b)&cin);
  
endmodule

// testbench: to check if the design codes are correct

module fulladder1_tb();

  reg a,b;
  reg cin;
  
  wire sum;
  wire cout;
  
 fulladder1 instance0 (sum, cout, a, b, cin);

 initial begin

	$dumpfile("dump.vcd");
    
    $dumpvars(1);

	    a=0; b=0; cin=0;
    #20 a=0; b=0; cin=1;
    #20 a=0; b=1; cin=0;
    #20 a=0; b=1; cin=1;
    #20 a=1; b=0; cin=0;
    #20 a=1; b=0; cin=1;
    #20 a=1; b=1; cin=0;
    #20 a=1; b=1; cin=1;
    #30 $stop;

 end
endmodule
