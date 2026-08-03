module main_decoder(
    input [6:0] op,
    input zero,
    output pcsrc,
    output reg branch,
    output reg jump,
    output reg resultsrc,
    output reg memwrite,
    output reg alusrc,
    output reg [1:0] aluop,
    output reg [1:0] immsrc,
    output reg regwrite
    );
    always@(*) begin
    if(op == 7'b0110011) begin //r-type
    branch = 0;
    jump = 0;
    resultsrc = 0;
    memwrite = 0;
    alusrc = 0;
    aluop = 2'b10;    
    immsrc = 2'b00;
    regwrite = 1;
    end
    else if(op == 7'b001_0011) //i-type (addi,subi..)
    begin
    resultsrc = 1'b0;
    branch = 1'b0;
    jump = 1'b0;
    memwrite = 1'b0;
    alusrc = 1'b1;
    aluop = 2'b11;
    immsrc = 2'b00;
    regwrite = 1'b1;
    end 
    else if(op == 7'b000_0011) //i-type (lw)
    begin
    resultsrc = 1'b1;
    branch = 1'b0;
    jump = 1'b0;
    memwrite = 1'b0;
    alusrc = 1'b1;
    aluop = 2'b00;
    immsrc = 2'b00;
    regwrite = 1'b1;
    end 
    else if(op == 7'b010_0011) //s-type (sw)
    begin
    resultsrc = 1'b0;
    branch = 1'b0;
    jump = 1'b0;
    memwrite = 1'b1;
    alusrc = 1'b1;
    aluop = 2'b00;
    immsrc = 2'b01;
    regwrite = 1'b0;
    end                   
    else if(op == 7'b110_0011) //b-type (beq,bne)
    begin
    resultsrc = 1'b0;
    branch = 1'b1;
    jump = 1'b0;
    memwrite = 1'b0;
    alusrc = 1'b0;
    aluop = 2'b01;
    immsrc = 2'b10;
    regwrite = 1'b0;
    end     
    else if(op == 7'b110_1111) //j-type 
    begin
    resultsrc = 1'b0;
    branch = 1'b0;
    jump = 1'b1;
    memwrite = 1'b0;
    alusrc = 1'b1;
    aluop = 2'b00;
    immsrc = 2'b11;
    regwrite = 1'b1;
    end     
    else               //default values               
    begin
    branch = 1'b0;
    jump = 1'b0;
    resultsrc = 1'b0;
    memwrite = 1'b0;
    alusrc = 1'b0;
    aluop = 2'b00;
    immsrc = 2'b00;
    regwrite = 1'b0;
    end                 
    end
    assign pcsrc = (zero & branch) | jump; 
endmodule
