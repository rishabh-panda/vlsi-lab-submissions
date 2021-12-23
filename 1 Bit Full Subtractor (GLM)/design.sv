// design: describes the behaviour of system
// methodology: gate level modelling
module fullsubtractor1(output diff, bout, input a, b, bin);
  
  xor a1(diff, a, b, bin);
  and a2(w1, ~a, b);
  and a3(w2, ~a, bin);
  and a4(w3, b, bin);
  or  a5(bout, w1, w2, w3);
  
endmodule