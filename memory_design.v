// Code your design here
module ram1k(dout, din, addr, clk, en, rw);
  input en, rw, clk;
  input [7:0] din;
  input [9:0] addr;
  output reg [7:0] dout;
  reg [7:0] ram[1023:0];
  always @ (posedge clk)
  //en=enabling the IC
  if(en)
    begin
      if(rw) //write operation
        ram[addr]=din;
      else //read operation
        dout=ram[addr];
    end
  else
    dout=8'bz;
endmodule

// Code your testbench here
// or browse Examples
module ram1k_tb();
  reg en, rw, clk;
  reg [7:0] din;
  reg [9:0] addr;
  wire [7:0] dout;
  ram1k DUT(dout, din, addr, clk, en, rw);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    //rw=1, in write operation rw=0 in read operation
    clk=0; en=1; rw=1;
    addr=5; din=12; 
    #20;
    addr=20; din=32; 
    #20;
    addr=100; din=121; 
    #20;
    
    rw=0;
    addr=5; #20;
    addr=20; #20;
    addr=100; #20;
    $finish;
  end
  always #10 clk=!clk;
endmodule
