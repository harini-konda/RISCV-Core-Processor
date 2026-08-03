module risc_v(
    input clk,rst,
    output [31:0] result
    );
    wire [31:0] pcplus4;
wire [31:0] pctarget;
wire [31:0] pcnext;
wire [31:0] pc;
wire [31:0] instr;
wire [4:0] a1,a2,a3;
wire [31:0] wd3;
wire [31:0] rd1,rd2;
wire [6:0] op;
wire [2:0] funct3;
wire [6:0] funct7;
wire zero;
wire pcsrc;
wire resultsrc;
wire memwrite;
wire [2:0] aluctrl;
wire alusrc;
wire [1:0] immsrc;
wire regwrite;
wire [31:7] in;
wire [31:0] immnext;
wire signed [31:0] srcB;
wire [31:0] alu; 
wire [31:0] rd;
 
assign result = wd3;
assign a1 = instr[19:15];
assign a2 = instr[24:20];
assign a3 = instr[11:7];
assign in = instr[31:7];
assign op = instr[6:0];
assign funct3 = instr[14:12];
assign funct7 = instr[30:25];


pc_mux pcmux(.pcplus4(pcplus4),.pctarget(pctarget),.pcsrc(pcsrc),.pcnext(pcnext));
pc_adder pcadder(.pc(pc),.pcplus4(pcplus4));
pc pcounter(.pcnext(pcnext),.clk(clk),.rst(rst),.pc(pc));
pc_target ptarget(.pc(pc),.immnext(immnext),.pctarget(pctarget));
instr_mem instrmem(.pc(pc),.instr(instr));
reg_file regfile(.a1(a1),.a2(a2),.a3(a3),.wd3(wd3),.clk(clk),.rst(rst),
                 .regwrite(regwrite),.rd1(rd1),.rd2(rd2));
ctrl_block ctrl_unit(.op(op),.funct3(funct3),.funct7(funct7),.zero(zero),
                     .pcsrc(pcsrc),.resultsrc(resultsrc),                    .memwrite(memwrite),.aluctrl(aluctrl),.alusrc(alusrc),.immsrc(immsrc),
                     .regwrite(regwrite));
extend_functionality immext(.in(in),.immsrc(immsrc),.immnext(immnext));
reg_mux regmux(.rd2(rd2),.immnext(immnext),.alusrc(alusrc),.srcB(srcB));
alu alu_block(.srcA(rd1),.srcB(srcB),.aluctrl(aluctrl),.zero(zero),.alu(alu));
data_mem datamem(.alu(alu),.wd(rd2),.memwrite(memwrite),.clk(clk),.rst(rst),.rd(rd));
r_mux rmux(.alu(alu),.resultsrc(resultsrc),.rd(rd),.result(wd3));
endmodule


  