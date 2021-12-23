// design: describes the behaviour of system
// methodology: gate level modelling
module fulladder1(output sum, cout, input a, b, cin);
  
  xor a1(sum, a, b, cin);
  and a2(w1, a, b);
  and a3(w2, b, cin);
  and a4(w3, a, cin);
  or  a5(cout, w1, w2, w3);
  
endmodule