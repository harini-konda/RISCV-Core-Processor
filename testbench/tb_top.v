
  `include "pc_adder.v"
  `include "pc_target.v"
  `include "pc_mux.v"
  `include "pc.v"
  `include "instr_mem.v"
  `include "reg_file.v"
  `include "main_decoder.v"
  `include "alu_decoder.v"
  `include "ctrl_block.v"
  `include "extend_functionality.v"
  `include "reg_mux.v"
  `include "alu.v"
  `include "data_mem.v"
  `include "r_mux.v"
module tb;
reg clk,rst;
wire [31:0] result;
risc_v uut(.clk(clk),.rst(rst),.result(result));
  
initial begin
clk = 0;
forever #5 clk = ~clk;
end
  
initial begin
rst = 0; #20;  
rst = 1;#200;
end
  
initial begin
$monitor("T=%0t PC=0x%0h instr=0x%08h op=%02b f3=%0b f7=%0b regwrite=%b alusrc=%b resultsrc=%b aluctrl=%0d a1=%0d a2=%0d a3=%0d rd1=%0d rd2=%0d imm=%0d srcB=%0d alu=%0d rd=%0d wd3=%0d x5=%0d x10=%0d result",
    $time, uut.pc, uut.instr, uut.op[6:5], uut.funct3, uut.funct7, uut.regwrite, uut.alusrc, uut.resultsrc, uut.aluctrl,uut.a1, uut.a2, uut.a3, uut.rd1, uut.rd2, uut.immnext,uut.srcB,uut.alu,uut.rd,uut.wd3,uut.regfile.mem[5],
uut.regfile.mem[10],result);

end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
$dumpvars(1, uut.regfile.mem);
end 
  
initial begin
    #320 $finish;
end
endmodule
