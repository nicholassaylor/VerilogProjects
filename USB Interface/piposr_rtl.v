// Nicholas Saylor 11/12/2021
// CMPEN 270
// RTL file for the shift register assignment
`timescale 1ns/1ns

module piposr_rtl(din, si, ldin, ldout, CK, dout, so);

    // As required by assignment definition
    input [3:0] din;
    input si, ldin, ldout, CK;
    output reg [3:0] dout;
    output so;
    
    //For debugging
    reg [3:0] data;
    
    // so should be a combinational output since having it in a flip flop would delay it
    assign so = data[0];
    
    // Only clock edge matters
    always @ (posedge CK) begin
        
        // Now handles loading in
        if (ldin) begin
            data <= din;
        end
		
		else begin
        // Bit shift to the right 1, putting serial in in the first bit
        data <= {si, data} >> 1;
		end
		
        // Loading out must be handled after loading in for accurate readings
        if (ldout) begin
            dout <= data;
        end
    end



endmodule