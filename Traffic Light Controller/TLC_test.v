`timescale 1ns/1ns

// Nicholas Saylor 12/02/2021
// CMPEN 270 Verilog Project 12
// Test bench for TLC module

module TLC_test();

    reg clk = 0;
    reg clr = 1;
    // Cars waiting
    reg MD = 0;
    reg SD = 0;
    // Output busses
    wire [3:0] STATE_rtl;
    wire [3:0] STATE;

    always begin
        #50 clk = ~clk;
    end

    
    initial begin
        //Simulate cars 
        #100 clr = 0;
        #900 MD = 1;
        #900 MD = 0;
        #500 SD = 1;
        #900 SD = 0;
        #300 MD = 1;
        #10 SD = 1;
        #900 SD = 0;
        #90 MD = 0;
        #700 $finish;
    end
    
    

    initial begin
        $dumpfile("./TLC.vcd"); // Output vcd file
        $dumpvars;
        // Titles
        $display("SD  MD  CLR       MR_r  MY_r  MG_r  MA_r    SR_r  SY_r  SG_r    STATE_r        MR  MY  MG  MA    SR  SY  SG    STATE");
    end
    
    always @ (posedge clk) begin
        #50 $strobe("%2d  %2d  %2d       %4d  %4d  %4d  %4d    %4d  %4d  %4d  %7d           %2d  %2d  %2d  %2d    %2d  %2d  %2d  %5d", 
        SD, MD, clr, MR_rtl, MY_rtl, MG_rtl, MA_rtl, SR_rtl, SY_rtl, SG_rtl, STATE_rtl,
        MR, MY, MG, MA, SR, SY, SG, STATE);
    end
    
    always @ (negedge clk) begin
    // Check validity
        if (STATE_rtl != STATE) $display("Error! States do not match at time: %5d", $time);
        if ({MR,MY,MG,MA,SR,SY,SG} != {MR_rtl,MY_rtl,MG_rtl,MA_rtl,SR_rtl,SY_rtl,SG_rtl}) $display("Error! Lights do not match at time: %5d", $time);
    end
    
    TLC_rtl tr (clk, clr, SD, MD, MR_rtl, MY_rtl, MG_rtl, MA_rtl, SR_rtl, SY_rtl, SG_rtl, STATE_rtl);
    TLC tg (clk, clr, SD, MD, MR, MY, MG, MA, SR, SY, SG, STATE);

endmodule