`timescale 1ns/1ns
// Nicholas Saylor 10/14/2021
// CMPEN 270 Verilog Project 6
// This is the module for the 7 segment display
//---        ---   ---         ---  ---  ---   ---   ---  ---       ---         ---   ---
//| |    |     |     |   | |   |    |      |   | |   | |  | |  |    |       |   |     |
//           ---   ---   ---   ---  ---        ---   ---  ---  ---        ---   ---   ---
//| |    |   |       |     |     |  | |    |   | |     |  | |  | |  |     | |   |     |
//---        ---   ---         ---  ---        ---             ---  ---   ---   ---

module bin_7seg_disp_rtl(MODE, DATA, a, b, c, d, e, f, g, dp);
    input MODE; // 0 for binary, 1 for 2s complement
    input [3:0] DATA; // 4 bit input
    output reg a, b, c, d, e, f, g; // Segments
    output reg dp; // Decimal point for 2s complement

    always @ (MODE or DATA)
    begin
        //Case statement containing all possible values for DATA
        case(DATA)
            4'b0000:
            begin
                a = 0;
                b = 0;
                c = 0;
                d = 0;
                e = 0;
                f = 0;
                g = 0;
                dp = 1;
                //---
                //| |
                //
                //| |
                //---
            end
            4'b0001:
            begin
                a = 1;
                b = 0;
                c = 0;
                d = 1;
                e=1;
                f=1;
                g=1;
                dp = 1;
                //
                //  |
                //
                //  |
                //
            end
            4'b0010:
            begin
                a=0;
                b=0;
                c=1;
                d=0;
                e=0;
                f=0;
                g=1;
                dp = 1;
                //---
                //  |
                //---
                //|
                //---
            end
            4'b0011:
            begin
                a=0;
                b=0;
                c=0;
                d=0;
                e=1;
                f=1;
                g=0;
                dp=1;
                //---
                //  |
                //---
                //  |
                //---
            end
            4'b0100:
            begin
                a=1;
                b=0;
                c=0;
                d=1;
                e=1;
                f=0;
                g=0;
                dp=1;
                //
                //| |
                //---
                //  |
                //
            end
            4'b0101:
            begin
                a=0;
                b=1;
                c=0;
                d=0;
                e=1;
                f=0;
                g=0;
                dp=1;
                //---
                //|
                //---
                //  |
                //---
            end
            4'b0110:
            begin
                a=0;
                b=1;
                c=0;
                d=0;
                e=0;
                f=0;
                g=0;
                dp=1;
                //---
                //|
                //---
                //| |
                //---
            end
            4'b0111:
            begin
                a=0;
                b=0;
                c=0;
                d=1;
                e=1;
                f=1;
                g=1;
                dp=1;
                //---
                //  |
                //
                //  |
                //
            end
            4'b1000:
            if (MODE)
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=0;
                    e=0;
                    f=0;
                    g=0;
                    dp=0;
                    //---
                    //| |
                    //---
                    //| |
                    //---.
                end
            else
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=0;
                    e=0;
                    f=0;
                    g=0;
                    dp=1;
                    //---
                    //| |
                    //---
                    //| |
                    //---
                end
            4'b1001:
            if (MODE)
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=1;
                    e=1;
                    f=1;
                    g=1;
                    dp=0;
                    //---
                    //  |
                    //
                    //  |
                    //   .
                end
            else
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=1;
                    e=1;
                    f=0;
                    g=0;
                    dp=1;
                    //---
                    //| |
                    //---
                    //  |
                    //
                end
            4'b1010:
            if (MODE)
                begin
                    a=0;
                    b=1;
                    c=0;
                    d=0;
                    e=0;
                    f=0;
                    g=0;
                    dp=0;
                    //---
                    //|
                    //---
                    //| |
                    //---.
                end
            else
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=1;
                    e=0;
                    f=0;
                    g=0;
                    dp=1;
                    //---
                    //| |
                    //---
                    //| |
                    //
                end
            4'b1011:
            if (MODE)
                begin
                    a=0;
                    b=1;
                    c=0;
                    d=0;
                    e=1;
                    f=0;
                    g=0;
                    dp=0;
                    //---
                    //|
                    //---
                    //  |
                    //---.
                end
            else
                begin
                    a=1;
                    b=1;
                    c=0;
                    d=0;
                    e=0;
                    f=0;
                    g=0;
                    dp=1;
                    //
                    //|
                    //---
                    //| |
                    //---
                end
            4'b1100:
            if (MODE)
                begin
                    a=1;
                    b=0;
                    c=0;
                    d=1;
                    e=1;
                    f=0;
                    g=0;
                    dp=0;
                    //
                    //| |
                    //---
                    //  |
                    //   .
                end
            else
                begin
                    a=0;
                    b=1;
                    c=1;
                    d=0;
                    e=0;
                    f=0;
                    g=1;
                    dp=1;
                    //---
                    //|
                    //
                    //|
                    //---
                end
            4'b1101:
            if (MODE)
                begin
                    a=0;
                    b=0;
                    c=0;
                    d=0;
                    e=1;
                    f=1;
                    g=0;
                    dp=0;
                    //---
                    //  |
                    //---
                    //  |
                    //---.
                end
            else
                begin
                    a=1;
                    b=0;
                    c=0;
                    d=0;
                    e=0;
                    f=1;
                    g=0;
                    dp=1;
                    //
                    //  |
                    //---
                    //| |
                    //---
                end
            4'b1110:
            if (MODE)
                begin
                    a=0;
                    b=0;
                    c=1;
                    d=0;
                    e=0;
                    f=0;
                    g=1;
                    dp = 0;
                    //---
                    //  |
                    //---
                    //|
                    //---.
                end
            else
                begin
                    a=0;
                    b=1;
                    c=1;
                    d=0;
                    e=0;
                    f=0;
                    g=0;
                    dp=1;
                    //---
                    //|
                    //---
                    //|
                    //---
                end
            4'b1111:
            if (MODE)
                begin
                    a=1;
                    b=0;
                    c=0;
                    d=1;
                    e=1;
                    f=1;
                    g=1;
                    dp=0;
                    //
                    //  |
                    //
                    //  |
                    //   .
                end
            else
                begin
                    a=0;
                    b=1;
                    c=1;
                    d=1;
                    e=0;
                    f=0;
                    g=0;
                    dp=1;
                    //---
                    //|
                    //---
                    //|
                    //
                end
        endcase
    end

endmodule