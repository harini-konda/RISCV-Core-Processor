module alu(
    input signed [31:0] srcA,srcB,
    input [2:0] aluctrl,
    output zero,
    output reg [31:0] alu
    );
    always@(*) begin
    case(aluctrl)
    3'd0 : alu = srcA + srcB; //add
    3'd1 : alu = srcA - srcB; //sub
    3'd2 : alu = srcA & srcB; //and
    3'd3 : alu = srcA ^ srcB; //xor
    3'd4 : alu = srcA | srcB; //or
    3'd5 : alu = srcA << srcB[4:0]; //sll
    3'd6 : alu = srcA >> srcB[4:0]; //slr
    3'd7 : alu = (srcA < srcB) ? 32'd1 : 32'd0; //slt
    default : alu = 32'd0;
    endcase
    end
    assign zero = (alu == 0) ? 1 : 0;
endmodule