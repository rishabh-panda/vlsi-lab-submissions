// design: describes the behaviour of system
// methodology: gate level modelling
module fulladder1(output sum, cout, input a, b, cin);
  
  xor a1(sum, a, b, cin);
  and a2(w1, a, b);
  and a3(w2, b, cin);
  and a4(w3, a, cin);
  or  a5(cout, w1, w2, w3);
  
endmodule

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
