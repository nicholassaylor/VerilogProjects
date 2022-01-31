// wrapper.v for XO3 demo board - 2018
// MachXO3LF - LCMX03LF-9400C - CABGA484    Device settings
// Must use JEDEC file, FTUSB-1 (port)
// Unused wrapper ports may be ignored - they are removed by software
module wrapper_USB(CLK, DIPSW, PBSW, LED, HEADER_X3_PIN);
// DIPSW and PBSW are low when on
   input    [3:0]DIPSW;
   input    [5:2]PBSW;
   input    CLK;
// leds light when low
   output   [7:0]LED;
//  header index aligns with the header pins 
//  HEADER_X3_PIN[5] is pin 5 on the X3 header
	inout [18:3] HEADER_X3_PIN;
	
	wire [3:0] data; 
	reg [28:0] TruCLK = 0;
	
	always @ (CLK) begin
		TruCLK = TruCLK + 1;
		end
		
		
	assign LED[0] = usbWire;
	assign LED[6:1]= 6'b111111;
	assign LED[7] = TruCLK[28];
	
	piposr_rtl Trans 	 (.si(0), .CK(TruCLK[28]), .ldin(din_gen), .ldout(0), .din(DIPSW), .dout(), .so(usbWire));
	piposr_rtl LDin_gen  (.si(din_gen), .CK(TruCLK[28]), .ldin(~PBSW[2]), .ldout(0), .din(4'b0001), .dout(), .so(din_gen));
	
	piposr_rtl Rec 		 (.si(usbWire), .CK(TruCLK[28]), .ldin(0), .ldout(dout_gen), .din(0), .dout(data), .so());
	piposr_rtl LDout_gen (.si(dout_gen), .CK(TruCLK[28]), .ldin(~PBSW[3]), .ldout(0), .din(4'b0010), .dout(), .so(dout_gen));
	
	
	bin_7seg_disp_rtl b1 (.MODE(1'b0), .DATA(data), .a(HEADER_X3_PIN[3]), .b(HEADER_X3_PIN[4]), .c(HEADER_X3_PIN[5]), .d(HEADER_X3_PIN[6]), .e(HEADER_X3_PIN[7]), .f(HEADER_X3_PIN[8]), .g(HEADER_X3_PIN[9]), .dp(HEADER_X3_PIN[10]));
	
	
endmodule

