`timescale 1ns/1ns
// Nicholas Saylor 10/28/2021
// CMPEN 270 Verilog Project 8
// RTL file for LS74163 Counter
module LS74163_rtl(CLR_L, LD_L, ENT, ENP, CLK, QD, QC, QB, QA, D, C, B, A);
    input CLR_L, LD_L, ENT, ENP, CLK, D, C, B, A;
    output reg QD, QC, QB, QA;
    
    always @ (posedge CLK)
    begin
        if (~CLR_L)
        begin
            QD <= 0;
            QC <= 0;
            QB <= 0;
            QA <= 0;
        end
        else if (~LD_L)
        begin
            QD <= D;
            QC <= C;
            QB <= B;
            QA <= A;
        end
        else if (ENT&ENP)
        begin
            QD <= (!QD&QC&QB&QA) | (QD&!QA) | (QD&!QC) | (QD&!QB);
            QC <= (!QC&QB&QA) | (QC&!QB) | (QC&!QA);
            QB <= (!QB&QA) | (QB&!QA);
            QA <= (!QA);
        end
    end




endmodule