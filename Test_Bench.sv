module ALU_tb;    
//inputs
reg clk, A,B;
reg[3:0] ALU_Sel;
// output
wire ALU_Out; 

//Instantiate the design under test
ALU dut(
    .clk(clk),
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_out(ALU_Out));

initial begin //Initial means this only happens once
    $display("A  B  ALU_Sel  ALU_Out");
    $monitor("%b  %b  %b     %b",A,B,ALU_Sel, ALU_Out);
    clk = 1'b1;
    A = 8'b01001101;// Not sure about the inputs. Should maybe be 8-bit numbers but then itt is no an extensive test that way0
    B = 8'b0010111;
    ALU_Sel = 4'b0000; //ADD
    #5  //Note: This is not synthesizable and only available in simulation
        clk=!clk;
    #5
        clk=!clk;
        ALU_Sel = 4'b0001; // MAC, with an ACC initial value of 0b00000101
    #5
        clk=!clk;
    #5
        clk=!clk;
        ALU_Sel =  4'b0111; //ROR
    #5
        clk=!clk;
    #5
        clk=!clk;
        ALU_Sel = 4'b1111; //LTH
    #5
        clk = !clk;
  	
    end
