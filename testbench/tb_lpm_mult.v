//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 18:49:56
// Design Name: 
// Module Name: tb_lpm_mult
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

`timescale 1ns / 1ps

module lpm_mult_tb;
    reg clock;
    reg clken;
    reg aclr;
    reg [7:0] dataa;
    reg [7:0] datab;
    reg [7:0] sumin;
    wire [15:0] result;

    lpm_mult dut (
        .result(result),
        .dataa(dataa),
        .datab(datab),
        .sumin(sumin),
        .clock(clock),
        .clken(clken),
        .aclr(aclr)
    );

    initial begin
        // Initialize input values
        dataa = 8'h01;
        datab = 8'h02;
        sumin = 8'h03;

        // Assert reset
        aclr = 1;
        clken = 1;
        #5 aclr = 0;
        clock = 1;

        // Run test
        forever begin
            @(posedge clock);
            {dataa, datab} <= {datab, dataa};
        end
    end

    always
        #5 clock = ~clock;
endmodule
