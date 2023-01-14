`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/14 15:15:40
// Design Name: 
// Module Name: tb_sysArrRow
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

// Instantiates a systolic array row with four PEs in it, and drives input signals.

module tb_sysArrRow();

    localparam row_width = 4;
    localparam weight_width = 8 * row_width;
    localparam sum_width = 16 * row_width;

    // Inputs to DUT
    reg clock;
    reg active;
    reg [7:0] datain;
    reg [weight_width-1:0] win;
    reg [sum_width-1:0] sumin;
    reg [row_width-1:0] wwrite;

    // Outputs from DUT
    wire [sum_width-1:0] maccout;
    wire [weight_width-1:0] wout;
    wire [row_width-1:0] wwriteout;
    wire [row_width-1:0] activeout;
    wire [7:0] dataout;

    // Instantiation of DUT
    sysArrRow DUT (
        .clock      (clock),
        .active   (active),
        .datain   (datain),
        .win      (win),
        .sumin    (sumin),
        .wwrite   (wwrite),
        .maccout  (maccout),
        .wout     (wout),
        .wwriteout(wwriteout),
        .activeout(activeout),
        .dataout  (dataout)
    );

    defparam DUT.row_width = row_width;

    always begin
        #5;
        clock = ~clock;
    end // always

    initial begin
        clock = 1'b1;
        active = 1'b1;
        datain = 8'h00;
        win = 32'h0000_0000;
        sumin = 64'h0000_0000_0000_0001;
        wwrite = 4'b0000;

        #10;

        win = 32'h9999_9999;
        wwrite = 4'b1111;

        #10;

        win = 32'h0000_0011;
        wwrite = 4'b0000;

        #10;

       // active = 1'b1;

        #10;

        datain = 8'h01;

        #10;

        datain = 8'h02;

        #10;

        datain = 8'h03;

        #10;

        datain = 8'h04;

        #10;

        //active = 1'b0;

        #50;

        $stop;
    end // initial
endmodule // tb_sysArrRow
