// Code your design here
module srff(q,qb,s,r,clk);
  input s,r,clk;
  output reg q,qb;
  initial q=0;
  initial qb=1;
  always @(posedge clk)
    begin
      if(s==0 & r==0)
        begin
          q=q;
          qb=qb;
        end
      else if(s==0 & r==1)
        begin
          q=0;
          qb=1;
        end
      else if(s==1 & r==0)
        begin
          q=1;
          qb=0;
        end
      else begin
        q=1'bx;
        qb=1'bx;
      end
    end
endmodule

//JK using SR
module jk_sr(q,qb,j,k,clk);
  input j,k,clk;
  output q,qb;
  wire w1, w2;
  and a1(w1, j, qb);
  and a2(w2, k, q);
  srff L0(q,qb,w1,w2,clk);
endmodule

// Code your testbench here
// or browse Examples
module srff_tb();
  reg j, k, clk;
  wire q, qb;
  jk_sr L0(q, qb, j, k, clk);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    j=0; k=0; #20;
    j=0; k=1; #20;
    j=1; k=0; #20;
    j=1; k=1; #100;
    $finish;
  end
  always #10 clk=!clk;
endmodule
