`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 18:49:10
// Design Name: 
// Module Name: lpm_mult
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

module lpm_mult (
    result, 
    dataa, 
    datab, 
    sum, 
    clock, 
    clken, 
    aclr
);
    parameter lpm_type = "lpm_mult";
    parameter lpm_widtha = 1;
    parameter lpm_widthb = 1;
    parameter lpm_widths = 1;
    parameter lpm_widthp = 1;
    parameter lpm_representation  = "UNSIGNED";
    parameter lpm_pipeline  = 0;
    parameter lpm_hint = "UNUSED";
    output reg [lpm_widthp-1:0] result;

    input clock;
    input clken;
    input aclr;
    input [lpm_widtha-1:0] dataa;
    input [lpm_widthb-1:0] datab;
    input [lpm_widths-1:0] sum;
    //output[lpm_widthp-1:0] result;

    always @(posedge clock) begin
        begin
            if(aclr!=0)
                result <= 0;
            else
                result <= dataa + datab + sum;
        end
    end
endmodule
