module r_mux(
    input [31:0] alu,
    input resultsrc,
    input [31:0] rd,
    output [31:0] result
    );
    assign result = (resultsrc == 0) ? alu : rd;
endmodule