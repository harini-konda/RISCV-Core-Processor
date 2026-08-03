module reg_mux(
    input [31:0] rd2,immnext,
    input alusrc,
    output signed [31:0] srcB
    );
    assign srcB = (alusrc == 0) ? rd2 : immnext;
endmodule
