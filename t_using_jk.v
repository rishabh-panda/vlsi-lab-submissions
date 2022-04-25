// Code your design here
module jkff(q,qb,j,k,clk);
  input j,k,clk;
  output reg q,qb;
  initial q=0;
  initial qb=1;
  always @(posedge clk)
    begin
      if(j==0 & k==0)
        begin
          q=q;
          qb=qb;
        end
      else if(j==0 & k==1)
        begin
          q=0;
          qb=1;
        end
      else if(j==1 & k==0)
        begin
          q=1;
          qb=0;
        end
      else begin
        q=~q;
        qb=~qb;
      end
    end
endmodule

//T using JK
module t_jk(q,qb,t,clk);
  input t,clk;
  output q,qb;
  jkff L0(q,qb,t, t,clk);
endmodule

// Code your testbench here
// or browse Examples
module jkff_tb();
  reg t, clk;
  wire q, qb;
  t_jk L0(q, qb, t, clk);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=0;
    t=0; #20;
    t=1; #100;
    $finish;
  end
  always #10 clk=!clk;
endmodule
