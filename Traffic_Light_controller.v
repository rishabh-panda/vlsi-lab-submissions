// Code your design here
module traffic_light(rst,clk,h_red,h_yellow,h_green,b_red,b_yellow,b_green);
  input rst, clk;
  output reg h_red,h_yellow,h_green,b_red,b_yellow,b_green;
  reg [4:0] count;
  reg [1:0] state;
  parameter s0=0, s1=1, s2=2, s3=3;
  initial state=0;
  initial count=0;
  initial h_red=0;
  initial h_yellow=0;
  initial h_green=0;
  initial b_red=0;
  initial b_yellow=0;
  initial b_green=0;
  
  always @(posedge clk) begin
    if(rst)
      state=s0;
    else
      case(state)
        s0:
          begin
            if(count==20) begin
              count=0;
              state=s1;
            end
            else
              begin
                count=count+1;
                state=s0;
              end
          end
        s1:
          begin
            if(count==10) begin
              count=0;
              state=s2;
            end
            else
              begin
                count=count+1;
                state=s1;
              end
          end
        s2:
          begin
            if(count==10) begin
              count=0;
              state=s3;
            end
            else
              begin
                count=count+1;
                state=s2;
              end
          end
        s3:
          begin
            if(count==5) begin
              count=0;
              state=s0;
            end
            else
              begin
                count=count+1;
                state=s3;
              end
          end
      endcase
  end
  
  
  //determine output depends upon state
  always @(state) begin
    case(state)
      s0:
        begin
          h_green=1;
          b_red=1;
          h_red=0;
          h_yellow=0;
          b_yellow=0;
          b_green=0;
        end
      s1:
        begin
          h_green=0;
          b_red=1;
          h_red=0;
          h_yellow=1;
          b_yellow=0;
          b_green=0;
        end
      s2:
        begin
          h_green=0;
          b_red=0;
          h_red=1;
          h_yellow=0;
          b_yellow=0;
          b_green=1;
        end
      s3:
        begin
          h_green=0;
          b_red=0;
          h_red=1;
          h_yellow=0;
          b_yellow=1;
          b_green=0;
        end
      endcase
  end
  
endmodule

// Code your testbench here
// or browse Examples
module traffic_tb();
  reg rst, clk;
  wire h_red,h_yellow,h_green,b_red,b_yellow,b_green;
  traffic_light L00(rst,clk,h_red,h_yellow,h_green,b_red,b_yellow,b_green);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;clk=1;#20;
    rst=0;#500;
    $finish;
  end
  always #3 clk=!clk;
endmodule
