`timescale 1ns/1ns

module bin_7seg_disp_test();
    reg [4:0] count = 0; // Tracks iterations (5 inputs)
    wire [7:0] z; // RTL output
    
    
    always begin
        #100 count = count + 1; // Iterates through truth table
        if (&count) #100 $finish; // Avoid overflow
    end
    
    initial begin
        $dumpfile("./bin_7seg_disp.vcd"); // Output vcd file
        $dumpvars;
        // Titles
        $display("%4s     %5s     %5s     %5s     %5s     %1s     %1s     %1s     %1s     %1s     %1s     %1s     %2s",
        "MODE", "DATA3", "DATA2", "DATA1", "DATA0", "A", "B", "C", "D", "E", "F", "G", "DP");
    end
    
    always @(count) begin
        #90 $strobe("%4d     %5d     %5d     %5d     %5d     %1d     %1d     %1d     %1d     %1d     %1d     %1d     %2d",
        count[4], count[3], count[2], count[1], count[0], z[7], z[6], z[5], z[4], z[3], z[2], z[1], z[0]);
    end


    // RTL model
    bin_7seg_disp_rtl c1 (.MODE(count[4]), .DATA(count[3:0]), .a(z[7]), .b(z[6]), .c(z[5]), .d(z[4]), .e(z[3]), .f(z[2]), .g(z[1]), .dp(z[0]));


endmodule