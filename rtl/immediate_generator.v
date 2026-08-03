module extend_functionality(
    input [31:7] in,
    input [1:0] immsrc,
    output [31:0] immnext
    );
    assign immnext = (immsrc==2'b00) ? {{20{in[31]}},in[31:20]}: 
                     (immsrc==2'b01) ? {{20{in[31]}},in[31:25],in[11:7]}:
                     (immsrc==2'b10) ? {{19{in[31]}},in[31],in[7],in[30:25],in[11:8],1'b0}:
                     (immsrc==2'b11) ? {{11{in[31]}},in[31],in[19:12],in[20],in[30:21],1'b0}: 32'hx;
    
endmodule