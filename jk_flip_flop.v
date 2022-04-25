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

// Code your testbench here
// or browse Examples
module jkff_tb();
  reg j, k, clk;
  wire q, qb;
  jkff L0(q, qb, j, k, clk);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=0;
    j=0; k=0; #20
    j=0; k=1; #20
    j=1; k=0; #20
    j=1; k=1; #100
    $finish;
  end
  always #10 clk=!clk;
endmodule
