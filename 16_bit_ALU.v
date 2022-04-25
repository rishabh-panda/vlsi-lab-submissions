module ALU16(A, B, opcode, out);
  
  //4 bit input signals
  input[3:0] A,B;
  
  //4 bit opcode input
  input[3:0] opcode;
  
  //output after operation
  output reg[3:0] out;
  always @ (*)
    begin
      case(opcode)
        //addition
        4'b0000: out = A+B;
        //subtraction
        4'b0001: out = A-B;
        //multiplication
        4'b0010: out = A*B;
        //division
        4'b0011: out = A/B;
        //modulud operation
        4'b0100: out = A%B;
        //bitwise and
        4'b0101: out = A & B;
        //bitwise or
        4'b0110: out = A | B;
        //bitwise xor
        4'b0111: out = A ^ B;
        //bitwise xnor
        4'b1000: out = ~(A ^ B);
        //bitwise nor
        4'b1001: out = ~(A | B);
        //bitwise nand
        4'b1010: out = ~(A & B);
        //arithmetic left shift (preserves sign at MSB)
        4'b1011: out = A <<< B;
        //arithmetic right shift (preserves sign at MSB)
        4'b1100: out = A >>> B;
        //logical left-shift
        4'b1101: out = A << B;
        //logical right-shift
        4'b1110: out = A >> B;
        //equality check
        4'b1111: out = (A == B);
        default: out = 0;
      endcase
    end
endmodule

module ALU16_TB();
  reg[3:0] A,B;
  
  //4 bit opcode input
  reg[3:0] opcode;
  
  //output post operation
  wire[3:0] out;
  
  ALU16 a1(A, B, opcode, out);
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      
      //Addition Opcode
      opcode=4'b0000;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //Multiplication Opcode
      opcode=4'b0010;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //Bitwise AND Opcode
      opcode=4'b0101;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //logical left-shift Opcode
      opcode=4'b1101;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //XOR Opcode
      opcode=4'b0111;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //arithmetic left-shift opcode
      opcode=4'b1011;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //equality check opcode
      opcode=4'b1111;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      //modulo opcode
      opcode=4'b0100;
      A=4'b0011;//3
      B=4'b0010;//2
      #10;
      
      $finish;
    end
endmodule
