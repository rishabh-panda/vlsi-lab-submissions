// testbench: to check if the design codes are correct

module fulladder1_tb();
  
  wire sum;
  wire cout;

  reg a,b;
  reg cin;
  
 fulladder1 m1 (sum, cout, a, b, cin);

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