module ALU(
  input[7:0] A,B,
  input clk,
  input [3:0] ALU_Sel,
  output [7;0] wire  ALU_out
);

reg ALU_result;
assign ALU_out = ALU_result

always@(posedge clk) //Triggered on rising edge clock
    begin
        case(ALU_Sel)
            4'b0000:  //Addition = 0000
                ALU_result = A + B;
            
            4'b0001:  //Subtraction = 0001
                ALU_result = A - B;

        
            4'b0001:  //Multiplication = 0010
                ALU_result = A * B;
            
            4'b0011:  //Division = 0011
                ALU_result = A / B;
          
            4'b0100:  //Add A = 0100
                ALU_result = ALU_result + A;
          
            4'b0101:  //Multiply by A = 0101
                ALU_result = ALU_result * A;
          
            4'b0110:  // MAC = 0110
              ALU_result = ALU_result + (A * B);
          
            4'b0111:  //left rotation by 1 = 0111
              ALU_result = {A[6;0],A[7]};
          
            4'b1000:  //Right rotation by 1 = 1000
              ALU_result = {A[0],A[7:1]};
          
            4'b1001:  //AND = 1001
                ALU_result = A & B;
          
            4'b1010:  //OR = 1010
                ALU_result = A | B;
          
            4'b1011:  //XOR = 1011
                ALU_result = A ^ B;
          
            4'b1100:  //Manually enumerate NAND = 1100
              ALU_result = ~(A & B);
          
            4'b1101:  //Manually enumerate Addition = 1101
              ALU_result = (A==B)?8'hFF:8'h00;
          
            4'b1110:  //Greater than = 1110
              ALU_result = (A>B)?8'hFF:8'h00;
          
            4'b1111:  //Manually enumerate Addition = 1111
              ALU_result = (A<B)?8'hFF:8'h00; 
            default: ALU_Result = A + B ; 
        endcase
    end

endmodule
