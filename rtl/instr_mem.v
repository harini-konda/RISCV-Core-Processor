module instr_mem(
    input [31:0] pc,
    output [31:0] instr
    );
    reg [31:0]mem[1023:0];

    initial begin
      $readmemh("program.hex", mem);
      
    end
    assign instr = mem[pc[11:2]];
endmodule
