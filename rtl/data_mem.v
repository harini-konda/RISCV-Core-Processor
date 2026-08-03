

module data_mem(
    input  [31:0] alu,   // address from ALU
    input  [31:0] wd,    // store data
    input         memwrite,
    input         clk, rst,
    output [31:0] rd
);
  reg [31:0] mem[1023:0];
  integer j;

  always @(posedge clk,negedge rst) begin
    if (!rst) begin
      for (j = 0; j < 1024; j = j + 1)
        mem[j] <= 32'd0;
    end else if (memwrite) begin
      mem[alu[11:2]] <= wd;
    end
  end

  assign rd = mem[alu[11:2]];
endmodule
