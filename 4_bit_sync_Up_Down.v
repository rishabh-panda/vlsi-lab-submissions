// design: describes the behaviour of system
// behavioural modelling
module syncupdown(output reg [3:0] count, input clk, rst, status);
  initial count=0;
  always @ (posedge clk)
    begin 
      if(status==0)
        begin
         if(rst)
           count=0;
         else
           count=count+1;
        end
      else
        begin
          if(status)
            begin
              if(rst)
                count=0;
              else
                count=count-1;
            end
        end
    end
  always @ (posedge status)
    begin
      count=15;
    end
  always @ (negedge status)
    begin
      count=0;
    end
endmodule

// testbench: to check if the design codes are correct

module syncupdown_tb();
  
  reg clk, rst, status;
  wire [3:0] count;
  
  syncupdown m1(count, clk, rst, status);

 initial begin

	$dumpfile("dump.vcd");
    $dumpvars(1);

	clk=0; rst=1; status=0;
   #20 rst=0;
   #200 status=1;
   #400 status=0;
   #600 $finish;

 end
  always #10 clk=~clk;
endmodule
