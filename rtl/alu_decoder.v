module alu_decoder(
    input [1:0] aluop,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [2:0] aluctrl
    );

    always @(*) begin
        case (aluop)

          //(lw,sw,j)
        2'b00: begin
            aluctrl = 3'b000; // ADD
        end

        // Branch comparition (beq/bne use subtraction)
        2'b01: begin
            aluctrl = 3'b001; // SUB
        end

        // R-type
        2'b10: begin
            case (funct3)
                3'b000: aluctrl = (funct7 == 7'b0100000) ? 3'b001 : 3'b000; // sub/add
                3'b100: aluctrl = 3'b011; // xor
                3'b110: aluctrl = 3'b100; // or
                3'b111: aluctrl = 3'b010; // and
                3'b001: aluctrl = 3'b101; // sll
                3'b101: aluctrl = 3'b110; // srl
                3'b010: aluctrl = 3'b111; // slt
                default: aluctrl = 3'b000;
            endcase
        end

        // I-type (xori/ori/andi/slti/slli/srli/addi)
        2'b11: begin
            case (funct3)
                3'b000: aluctrl = 3'b000; // addi
                3'b100: aluctrl = 3'b011; // xori
                3'b110: aluctrl = 3'b100; // ori
                3'b111: aluctrl = 3'b010; // andi
                3'b010: aluctrl = 3'b111; // slti
                3'b001: aluctrl = 3'b101; // slli (funct7 should be 0000001)
                3'b101: aluctrl = 3'b110; // srli (ignore srai in this simple core)
                default: aluctrl = 3'b000;
            endcase
        end

        default: aluctrl = 3'b000;
        endcase
    end
endmodule


