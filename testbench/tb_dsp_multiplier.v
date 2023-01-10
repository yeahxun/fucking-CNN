`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 21:00:00
// Design Name: 
// Module Name: tb_dsp_multiplier
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
module dsp_multiplier_tb();
    reg signed [7:0] dataa, datab;
    reg signed [7:0] sumin;
    reg clock;
    reg clken;
    reg aclr;
    wire signed [15:0] result;

    dsp_multiplier UUT (
        .dataa(dataa), 
        .datab(datab),
        .sumin(sumin),
        .result(result),
        .clock(clock),
        .clken(clken),
        .aclr(aclr)
    );
    always
    begin
        #5;
        clock= ~clock;
    end
    
    initial begin
        // Stimulus goes here
        clock=0;
        dataa = 8'h01;
        datab = 8'h02;
        sumin = 8'h03;
        clken = 1'b1;
        aclr = 1'b0;
        #100;
        dataa = 0;
        datab = 1;
        sumin = 8'h01;
    end

endmodule
