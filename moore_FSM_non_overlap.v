// Code your design here
module moore_noverlap(Y,A,clk,rst);
  input A;
  input clk;
  input rst;
  output reg Y;
  
  //current and next states
  reg [1:0] cst, nst;
  
  //assigning binary values to the states
  parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
  
  always @ (cst or A)
    begin
      case(cst)
        
        s0:
          begin
            Y=1'b0;
            nst=A?s1:s0;
      
          end
        
        s1:
          begin
            Y=1'b0;
            nst=A?s1:s2;
            
          end
        
        s2:
          begin
            Y=1'b0;
            nst=A?s3:s0;
            
          end
        
        s3:
          begin
            Y=1'b1;
            nst=A?s1:s0;
            
          end
        
        //default: nst=s0;
        
      endcase
    end
  always @ (posedge clk or posedge rst)
    begin
      if(rst)
        cst=s0;
      else
        cst=nst;
    end
endmodule

// Code your testbench here
// or browse Examples
module moore_noverlap_tb();
  reg A,clk,rst;
  wire Y;
  moore_noverlap m1(Y,A,clk,rst);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    clk=0;
    rst=1;
    A=0;
    #10 rst=0; A=1; #20;
    A=0; #20; A=1; #20;
    A=0; #20; A=1; #20;
    A=1; #20; A=0; #20;
    A=1; #20; A=0; #20;
    #200 $stop;
  end
  //always #20 A=!A;
  always #10 clk=!clk;
endmodule
