module pc(
    input [31:0] pcnext,
    input clk,rst,
    output reg [31:0] pc
    );
    always@(posedge clk) 
    begin
    if(!rst)
    pc <= 32'd0;
    else 
    pc <= pcnext;
    end
endmodule
