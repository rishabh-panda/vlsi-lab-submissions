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

// Code your testbench here
// or browse Examples
module srff_tb();
  reg s, r, clk;
  wire q, qb;
  srff L0(q, qb, s, r, clk);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    s=0; r=0; #20;
    s=0; r=1; #20;
    s=1; r=0; #20;
    s=1; r=1; #100;
    $finish;
  end
  always #10 clk=~clk;
endmodule
