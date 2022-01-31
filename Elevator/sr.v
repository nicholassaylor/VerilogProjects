`timescale 1ns / 1ps
// Nicholas Saylor 11/10/21
// CMPEN 270
// RTL sr latch


// NOTE: Could not get this to latch for some reason
module sr (s,r,q,qn);
input s, r;
output q, qn;

assign #10 q = ~(s & qn);
assign #10 qn = ~(r & q);

endmodule