module pc_mux(
    input [31:0] pcplus4,
    input [31:0] pctarget,
    input pcsrc,
    output [31:0] pcnext
    );
    assign pcnext = (pcsrc == 1) ? pctarget : pcplus4;
endmodule