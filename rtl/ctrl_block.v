 module ctrl_block(
    input [6:0] op,
    input [2:0] funct3,
    input [6:0] funct7,
    input zero,
    output pcsrc,
    output resultsrc,
    output memwrite,
    output [2:0] aluctrl,
    output alusrc,
    output [1:0] immsrc,
    output regwrite
    );
    wire [1:0] md_aluop;
    wire md_branch,md_jump;
    main_decoder md(.op(op),.zero(zero),.pcsrc(pcsrc),.resultsrc(resultsrc),
                                 .memwrite(memwrite),
                     .aluop(md_aluop),.branch(md_branch),.alusrc(alusrc),
                                 .immsrc(immsrc),.jump(md_jump),.regwrite(regwrite));
  alu_decoder ad(.aluop(md_aluop),.funct3(funct3),.funct7(funct7),.aluctrl(aluctrl));
endmodule
