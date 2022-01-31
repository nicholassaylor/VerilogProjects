`timescale 1ns/1ns
// Nicholas Saylor 10/28/2021
// CMPEN 270 Verilog Project 8
// Test bench for LS74163 Counter

module LS74163_test();

    wire [3:0] count_rtl;
    wire [3:0] count;
    reg [3:0] clk = 0;
    reg [3:0] sets = 4'b1011;
    reg [3:0] runs = 0;
    
    always begin
        #1000 clk = clk + 1;
        if (&clk) begin
            if (sets==4'b0000) #100 $finish;
            else if (sets==4'b1111) begin
                runs = runs + 1;
                #1000 sets = sets - runs;
                $strobe("\n\n\n");
            end
            else #1000 sets = 4'b1111;
        end
    end

    initial begin
        $dumpfile("./LS74163.vcd"); // Output vcd file
        $dumpvars;
        // Titles
        $display("%5s %4s %3s %3s      %4s  %4s  %4s  %4s    %3s%3s%3s%3s",
        "CLR_L", "LD_L", "ENT", "ENP", "QD_R", "QC_R", "QB_R", "QA_R", "QD", "QC", "QB", "QA");
    end
    
    always @(clk) begin
        #1000 $strobe("%5d %4d %3d %3d      %4d  %4d  %4d  %4d    %3d%3d%3d%3d",
        sets[3], sets[2], sets[1], sets[0], count_rtl[3], count_rtl[2], count_rtl[1], count_rtl[0], count[3], count[2], count[1], count[0]);
    end


    LS74163_rtl v1 (sets[3], sets[2], sets[1], sets[0], clk, count_rtl[3], count_rtl[2], count_rtl[1], count_rtl[0], 1, 0, 0, 1);
    LS74163 v2 (sets[3], sets[2], sets[1], sets[0], clk, count[3], count[2], count[1], count[0], 1, 0, 0, 1);



endmodule