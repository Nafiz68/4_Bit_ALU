module ALU_4bit (A,B,Sel,Result,CarryOut,Zero);
input [3:0] A, B;
input [2:0] Sel;
output reg [3:0] Result;
output reg CarryOut;
output reg Zero;


always @(*) begin
    CarryOut = 0;
    case (Sel)
        3'b000: {CarryOut, Result} = A + B;     // Addition
        3'b001: Result = A - B;                 // Subtraction
        3'b010: Result = A & B;                 // AND operation
        3'b011: Result = A | B;                 // OR operation
        3'b100: Result = A ^ B;                 // XOR operation
        3'b101: Result = ~A;                    // NOT operation
        3'b110: Result = A + 1;                 // Increament
        3'b111: Result = A - 1;                 // Decreament
        default: Result = 4'b0000;
    endcase
    Zero = (Result == 4'b0000) ? 1 : 0;
end

endmodule
