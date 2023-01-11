
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 22:36:30
// Design Name: 
// Module Name: pe
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
// This is a single processing element in the matrix multiply unit.

// Inputs:
//
// clk -- global clk signal
// active -- if high, we are performing multiplies and passing values
// datain -- 8-bit datain (matrix element)
// win -- 8-bit weight value
// sumin -- sum input from previous element in array
// wwrite -- control update of internal weight

// Outputs:
//
// maccout -- datain * weight + sumin
// dataout -- pass datain to the right

module pe(
    input clock,
    input active,
    input signed [7:0] datain,
    input signed [7:0] win,
    input signed [15:0] sumin,
    input wwrite,

    output reg signed [15:0] maccout,
    output reg signed [7:0] dataout,
    output reg signed [7:0] wout,
    output reg wwriteout,
    output reg activeout
);

    reg signed [15:0] maccout_c;
    reg signed [7:0] dataout_c, wout_c;
    reg signed [7:0] weight, weight_c;
    reg wwriteout_c, activeout_c;

    wire [15:0] result;
    wire [15:0] maccout_c = result;
    // DSP Multiplier Instantiation
    dsp_multiplier mult (
        .dataa (datain),
        .datab (weight),
        .result(result),
        //.clock(clock),
        //.clken(1'b1),
        .aclr(1'b0),
        .sumin(16'h0)
    );

    always @(*) begin

        activeout_c = active;
        if (active == 1'b1) begin
            dataout_c = datain;
            //maccout_c = sumin + (mult_result); //이 mult_result 씨발새끼가 오류가 난다. 
            maccout_c = sumin + result;
        end // if (active == 1'b1)

        else begin
            // If not active, stall pipeline. We may have run out of memory to feed
            // or store data going into and coming out of systolic array.
            // NOT SURE IF STALL IDEA WILL WORK
            dataout_c = dataout;
            maccout_c = maccout;
        end // else

    end // always @(active or datain or sumin)

    always @(*) begin

        wwriteout_c = wwrite;
        if ((wwrite == 1'b1) || (wwriteout == 1'b1)) begin
            weight_c    = win;
            wout_c      = weight;
        end // if (wwrite == 1'b1)

        else begin
            weight_c = weight;
            wout_c = 8'hAA;
        end // else

    end //always @(win or wwrite)

    always @(posedge clock) begin

        maccout   <= maccout_c;
        dataout   <= dataout_c;
        weight    <= weight_c;
        wout      <= wout_c;
        wwriteout <= wwriteout_c;
        activeout <= activeout_c;

    end // always @(posedge clk)

endmodule // pe
