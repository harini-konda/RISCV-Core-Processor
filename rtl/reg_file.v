module reg_file(
    input  [4:0] a1, a2, a3,
    input  [31:0] wd3,
    input         clk, rst, regwrite,
    output [31:0] rd1, rd2
);
  reg [31:0] mem[31:0];
  integer i;

  always @(posedge clk) begin
    if (!rst) begin
      for (i = 0;i < 32;i = i + 1) 
        mem[i] <= 32'd0;
    end else if (regwrite && a3 != 5'd0) //to prevent over-riding ofx0 register
      begin
      mem[a3] <= wd3;
    end
  end

  assign rd1 = mem[a1];
  assign rd2 = mem[a2];
endmodule


