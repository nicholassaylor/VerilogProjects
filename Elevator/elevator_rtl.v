`timescale 1ns / 1ns
// Nicholas Saylor 11/10/21
// CMPEN 270
// RTL file for elevator

module elevator_rtl(CLK, B, C, Q, O, R);

input CLK;

// B stores the button values from each floor.
input [3:1] B; 

// Q is the current state of the elevator.
output reg [3:1] Q = 3'b001;

// Floor indicators
output [1:0] O;

// Reset values
output [3:1] R;


// C stores the status of each button (0 if not called and 1 if called).
output [3:1] C;
sr c_3 (~B[3], R[3], C[3], c3n);

sr c_2 (~B[2], R[2], C[2], c2n);

sr c_1 (~B[1], R[1], C[1], c1n);


// Qn is the next state
reg [3:1] Qn;


always @(posedge CLK) begin
    if (C) begin
        Qn[3] = (C[3]&Q[2]&Q[1]) | (C[3]&Q[2]&~C[1]) | C[3]&Q[3];
        Qn[2] = (C[3]&~Q[2]&Q[1]) | (C[2]&~Q[2]&Q[1]) | (C[2]&Q[3]) | (C[1]&Q[3]) | C[2]&Q[2];
        Qn[1] = (C[1]&Q[2]&~Q[1]) | (C[1]&Q[2]&Q[1]&~C[3]) | (C[2]&~Q[2]&Q[1]) | (C[3]&~Q[2]&Q[1]) | C[1]&~Q[2]&Q[1];
    end
    Q = Qn;
end

// Assign statements for the reset values.
assign R[3] = Q[3] & !Q[2] & !Q[1];
assign R[2] = Q[2];
assign R[1] = !Q[3] & !Q[2] & Q[1];

// Assign statements for floor indicators
assign O[0] = ~Q[2]&Q[1] | Q[3];
assign O[1] = Q[2] | Q[3];


endmodule