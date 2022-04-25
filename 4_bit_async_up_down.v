// design: describes the behaviour of system
// behavioural modelling
module asyncupdown(output reg [3:0] count, input clk, rst, status);
  initial count=0;
  always @ (posedge clk & status)
    begin 
      if(rst)
        count=0;
      else
        count[0]=~count[0];
    end
  
  always @ (posedge count[0] & status)
    begin 
      if(rst)
        count=0;
      else
        count[1]=~count[1];
    end
      
  always @ (posedge count[1] & status)
    begin
      if(rst)
        count=0;
      else
        count[2]=~count[2];
    end
      
  always @ (posedge count[2] & status)
    begin
      if(rst)
        count=0;
      else
        count[3]=~count[3];
    end
      
//upcount
      always @(posedge clk & ~status)
        begin
          if(rst)
            count=0;
          else
            count[0]=~count[0];
        end
      
      always @(negedge count[0] & ~status)
        begin
          if(rst)
            count=0;
          else
            count[1]=~count[1];
        end
      
      always @(negedge count[1] & ~status)
        begin
          if(rst)
            count=0;
          else
            count[2]=~count[2];
        end
      
      always @(negedge count[2] & ~status)
        begin
          if(rst)
            count=0;
          else
            count[3]=~count[3];
        end 
endmodule

// testbench: to check if the design codes are correct

module asyncupdown_tb();
  
  reg clk, rst, status;
  wire [3:0] count;
  
  asyncupdown m1(count, clk, rst, status);

 initial begin

	$dumpfile("dump.vcd");
    $dumpvars(1);

	clk=0; rst=1; status=0;
   #20 rst=0;
   #200 status=1;
   #300 $finish;

 end
  always #10 clk=~clk;
endmodule
