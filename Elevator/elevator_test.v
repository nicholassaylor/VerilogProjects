`timescale 1ns / 1ns
// Nicholas Saylor 11/10/21
// CMPEN 270
// Test bench for elevator


module elevator_test;

    reg [3:1] B = 3'b000; // Buttons
    reg clk = 0;
    
    wire [3:1] C, Q, R;
    wire [1:0] O;


    always begin
        // 200ns clock
        #100 clk = ~clk;
	end

    initial begin
        // Pushing buttons
        #50 B[3] = 1;
        #200 B[3] = 0;
        #400 B[2] = 1;
        #200 B[2] = 0;
        #200 B[1] = 1;
        #200 B[1] = 0;
        #400 B[2] = 1;
        #200 B[2] = 0;
        #400 $finish();
        end

    initial begin
        $dumpfile("elevator.vcd");
        $dumpvars();
        $display("B[3] B[2] B[1]  C[3] C[2] C[1]   Q[3] Q[2] Q[1]   O[1] O[0]   R[3] R[2] R[1]");
        end


    always @ (posedge clk) begin
            #100 $strobe("%4d %4d %4d   %4d %4d %4d   %4d %4d %4d   %4d %4d   %4d %4d %4d",
            B[3], B[2], B[1], C[3], C[2], C[1], Q[3], Q[2], Q[1], O[1], O[0], R[3], R[2], R[1]);
        end
    
    elevator_rtl rtl (clk, B, C, Q, O, R);

endmodule