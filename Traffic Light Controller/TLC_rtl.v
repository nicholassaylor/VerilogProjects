`timescale 1ns/1ns
// Nicholas Saylor 13/03/2021
// CMPEN 270 Verilog Project 12
// RTL Module for TLC

module TLC_rtl(CLK, CLR, SD, MD, MR, MY, MG, MA, SR, SY, SG, STATE);
    input SD, MD, CLK, CLR;
    output MR, MY, MG, MA, SR, SY, SG;
    output [3:0] STATE;
    reg [3:0] Q;
    reg [3:0] QN;
    
    // Logic For Output has been generated through Espresso
    // MR and SR Uses POS instead of SOP
    
    
    // States
    parameter [3:0] A = 4'b0000,
        B = 4'b0001,
        C = 4'b0010,
        D = 4'b0011,
        E = 4'b0100,
        F = 4'b0101,
        G = 4'b0110,
        H = 4'b0111,
        I = 4'b1000,
        J = 4'b1001;
    
    
    
    // Find next state
    always @ (SD or MD or Q or CLR) begin
        // Synchronous clear
        if (CLR) begin
            QN <= 4'b0000;
        end
        else begin
            // Allows for use of don't cares in case statement 1'bz represents don't care input
            casez ({Q,SD,MD})
                {A,1'bz,1'bz}: QN <= B;
                {B,1'bz,1'bz}: QN <= C;
                {C,1'bz,1'bz}: QN <= D;
                {D,1'bz,1'b1}: QN <= E;
                {D,1'b1,1'bz}: QN <= E;
                {D,1'b0,1'b0}: QN <= D;
                {E,1'bz,1'bz}: QN <= F;
                {F,1'b1,1'bz}: QN <= G;
                {F,1'b0,1'b0}: QN <= B;
                {F,1'b0,1'b1}: QN <= J;
                {G,1'bz,1'bz}: QN <= H;
                {H,1'bz,1'bz}: QN <= I;
                {I,1'bz,1'b1}: QN <= J;
                {I,1'bz,1'b0}: QN <= B;
                {J,1'bz,1'bz}: QN <= A;
            endcase
        end
    end


    // Formally change states
    always @ (posedge CLK) begin
        Q <= QN;
    end
 
 
    // Combinational logic for lights
    assign MR = !((!Q[3]&Q[2]&!Q[1]&!Q[0]) | (!Q[3]&!Q[2]&Q[1]) | (!Q[3]&!Q[2]&!Q[1]&Q[0]));
    assign MY = (Q[2]&!Q[1]&!Q[0]);
    assign MG = (!Q[2]&Q[1]&Q[0]&SD) | (!Q[3]&!Q[2]&!Q[1]&Q[0]) | (!Q[2]&Q[1]&Q[0]&MD) | (!Q[2]&Q[1]&!SD&!MD) | (!Q[2]&Q[1]&!Q[0]);
    assign MA = (Q[3]&Q[0]);

    assign SR = !(!Q[3]&Q[2]&Q[1]);
    assign SY = (Q[2]&Q[1]&Q[0]);
    assign SG = (Q[2]&Q[1]&!Q[0]);
    
    assign STATE = Q;
    
endmodule