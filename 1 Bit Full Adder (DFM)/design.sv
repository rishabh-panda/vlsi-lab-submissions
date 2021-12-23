// design: describes the behaviour of system
// methodology: data flow modelling
module fulladder1(output sum, cout, input a, b, cin);
  
  assign sum=a^b^cin;
  assign cout=(a&b)|((a^b)&cin);
  
endmodule