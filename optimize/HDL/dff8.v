`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/09 14:57:47
// Design Name: 
// Module Name: dff8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// dff8.v
// Standard D flip-flop, transferring inputs of size DATA_WIDTH

// Inputs:
//
// clk -- clock signal
// reset -- when high, sets output to 0 on clock positive edge
// en -- enable latch
// d -- data input

// Outputs:
//
// q -- data output

module dff8(clock, reset, en, d, q);

    parameter DATA_WIDTH = 8;

    input clock;
    input reset;
    input en;
    input signed [DATA_WIDTH-1:0] d;
    output reg signed [DATA_WIDTH-1:0] q;

    always @(*) begin

        if (reset) begin
            q <= 0;
        end  // if (reset == 1'b1)

        else if (en) begin
            q <= d;
        end  // else if (en)

        else begin  // expecting this to get synthesized away (remove otherwise)
            q <= q;
        end  // else

    end  // always @(posedge clk)

endmodule  // dff8
